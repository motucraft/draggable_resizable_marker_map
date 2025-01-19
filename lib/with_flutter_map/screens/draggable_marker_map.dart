import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:draggable_resizable_marker_map/gen/assets.gen.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/models/draggable_stamp.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/models/dropped_stamp.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/router/router.gr.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/screens/providers/copyright.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/screens/providers/dropped_stamp_notifier.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/screens/providers/edit_mode_notifier.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/screens/providers/map_controller.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/screens/providers/marker_notifier.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/screens/providers/session_token.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/widgets/stamp_list.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/widgets/stamp_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:uuid/uuid.dart';

@RoutePage()
class FlutterMapDraggableMarkerMapScreen extends StatelessWidget {
  const FlutterMapDraggableMarkerMapScreen({super.key, required this.latLng});

  final LatLng latLng;

  @override
  Widget build(BuildContext context) {
    return DraggableMarkerMap(latLng: latLng);
  }
}

class DraggableMarkerMap extends HookConsumerWidget {
  const DraggableMarkerMap({super.key, required this.latLng});

  final LatLng latLng;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasDroppedStamp = ref.watch(droppedStampNotifierProvider).isNotEmpty;
    final editMode = ref.watch(editModeNotifierProvider);

    return PopScope(
      canPop: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all(EdgeInsets.zero),
              backgroundColor: WidgetStateProperty.all(Colors.white),
            ),
            onPressed: () => context.router.popForced(),
            icon: const Icon(Icons.chevron_left, size: 24),
          ),
          actions: [
            if (hasDroppedStamp)
              AnimatedToggleSwitch<EditMode>.rolling(
                current: editMode,
                values: EditMode.values,
                onChanged: (editMode) {
                  ref.read(editModeNotifierProvider.notifier).update(editMode);
                },
                iconBuilder: (editMode, _) {
                  return switch (editMode) {
                    EditMode.none => const Icon(Icons.close),
                    EditMode.delete => const Icon(Icons.delete),
                    EditMode.transform => const Icon(Icons.transform),
                    EditMode.arrow => const Icon(Icons.arrow_forward),
                  };
                },
                styleBuilder: (mode) {
                  return ToggleStyle(
                    backgroundColor: switch (mode) {
                      EditMode.none => Colors.grey,
                      EditMode.delete => Colors.red,
                      EditMode.transform => Colors.blue,
                      EditMode.arrow => Colors.green,
                    },
                    borderColor: Colors.black12,
                    indicatorColor: Colors.white,
                  );
                },
                spacing: 8,
                height: 42,
                animationDuration: const Duration(milliseconds: 300),
                animationCurve: Curves.easeInOut,
              ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IconButton(
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                ),
                onPressed: () async {
                  context.router.popForced();
                  await context.router
                      .push(FlutterMapScrollableSheetRoute(latLng: latLng));
                },
                icon: const Icon(Icons.warehouse_outlined, size: 24),
              ),
            ),
          ],
        ),
        body: MapBody(latLng: latLng),
      ),
    );
  }
}

class MapBody extends HookConsumerWidget {
  const MapBody({super.key, required this.latLng});

  final LatLng latLng;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const apiKey = String.fromEnvironment('GOOGLE_MAP_API_KEY');
    final sessionTokenAsyncValue = ref.watch(sessionTokenProvider);
    final mapController = ref.watch(mapControllerProvider);
    final markers = ref.watch(markerNotifierProvider).valueOrNull ?? [];
    final editMode = ref.watch(editModeNotifierProvider);

    final bounds = useMemoized(() => _calculateBounds(latLng, 1), [latLng]);
    final copyright = ref
        .watch(copyrightProvider(latLng: latLng, bounds: bounds))
        .valueOrNull;

    return sessionTokenAsyncValue.maybeWhen(
      data: (sessionToken) {
        return Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: latLng,
                initialZoom: 18,
                maxZoom: 20,
                minZoom: 16,
                cameraConstraint: CameraConstraint.contain(bounds: bounds),
                interactionOptions: InteractionOptions(
                  flags: editMode == EditMode.transform ||
                          editMode == EditMode.arrow
                      ? InteractiveFlag.none
                      : InteractiveFlag.all & ~InteractiveFlag.rotate,
                ),
              ),
              children: [
                // Map Tiles API
                // see... https://developers.google.com/maps/documentation/tile/satellite?hl=ja
                TileLayer(
                  urlTemplate:
                      'https://tile.googleapis.com/v1/2dtiles/{z}/{x}/{y}?session=$sessionToken&key=$apiKey',
                ),

                MarkerLayer(markers: markers),
              ],
            ),
            DragTarget<DraggableStamp>(
              onAcceptWithDetails: (details) async {
                final adjustedOffset = Offset(
                  details.offset.dx + details.data.width / 2,
                  details.offset.dy + details.data.height / 2 - 50,
                );

                final renderBox = context.findRenderObject() as RenderBox;
                final localOffset = renderBox.globalToLocal(adjustedOffset);

                final localPoint = Point(localOffset.dx, localOffset.dy);
                LatLng latLng = mapController.camera.pointToLatLng(localPoint);

                final droppedStampId = details.data.id;
                final existingStamp = droppedStampId == null
                    ? null
                    : ref.read(droppedStampNotifierProvider).firstWhereOrNull(
                        (stamp) => stamp.id == droppedStampId);

                if (existingStamp == null || droppedStampId == null) {
                  LatLng? start;
                  LatLng? end;
                  double width = details.data.width;
                  double height = details.data.height;
                  if (details.data.stampCategory == StampCategory.arrow) {
                    const offsetDistance = 50.0;
                    final startPoint =
                        Point(localOffset.dx - offsetDistance, localOffset.dy);
                    final endPoint =
                        Point(localOffset.dx + offsetDistance, localOffset.dy);

                    start = mapController.camera.pointToLatLng(startPoint);
                    end = mapController.camera.pointToLatLng(endPoint);
                    latLng = LatLng(
                      (start.latitude + end.latitude) / 2,
                      (start.longitude + end.longitude) / 2,
                    );
                  }

                  ref.read(droppedStampNotifierProvider.notifier).addStamp(
                        DroppedStamp(
                          id: const Uuid().v4(),
                          stampCategory: details.data.stampCategory,
                          latLng: latLng,
                          widget: details.data.widget,
                          width: width,
                          height: height,
                          start: start,
                          end: end,
                        ),
                      );
                } else {
                  ref
                      .read(droppedStampNotifierProvider.notifier)
                      .updateStamp(droppedStampId, newLatLng: latLng);
                }
              },
              builder: (_, __, ___) => const SizedBox.expand(),
            ),
            // ref: https://developers.google.com/maps/documentation/tile/policies?hl=ja
            Positioned(
              left: 8,
              bottom: MediaQuery.paddingOf(context).bottom + 72,
              child: Assets.images.googleLogo.image(width: 56),
            ),
            if (copyright != null)
              Positioned(
                right: 8,
                bottom: MediaQuery.paddingOf(context).bottom + 72,
                child: Text(
                  copyright,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: StampSelection(),
            ),
          ],
        );
      },
      orElse: () => const Center(child: CircularProgressIndicator()),
    );
  }

  LatLngBounds _calculateBounds(LatLng center, double radiusInKm) {
    // 地球の平均半径で近似
    const earthRadiusKm = 6371.0;
    final latDelta = radiusInKm / earthRadiusKm * (180 / pi);
    final lngDelta = latDelta / cos(center.latitude * pi / 180);

    return LatLngBounds(
      LatLng(center.latitude - latDelta, center.longitude - lngDelta),
      LatLng(center.latitude + latDelta, center.longitude + lngDelta),
    );
  }
}
