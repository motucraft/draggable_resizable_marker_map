import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:draggable_resizable_marker_map/only_google_map/models/stamp.dart';
import 'package:draggable_resizable_marker_map/only_google_map/router/router.gr.dart';
import 'package:draggable_resizable_marker_map/only_google_map/screens/draggable_marker_map/providers/dropped_stamp_notifier.dart';
import 'package:draggable_resizable_marker_map/only_google_map/screens/draggable_marker_map/providers/map_controller.dart';
import 'package:draggable_resizable_marker_map/only_google_map/screens/draggable_marker_map/providers/marker_notifier.dart';
import 'package:draggable_resizable_marker_map/widgets/custom_long_press_draggable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

part 'draggable_marker_map.freezed.dart';

@RoutePage()
class DraggableMarkerMapScreen extends StatelessWidget {
  const DraggableMarkerMapScreen({super.key, required this.latLng});

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
    final isDeleteMode = useState(false);

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
            IconButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(EdgeInsets.zero),
                backgroundColor: WidgetStateProperty.all(Colors.white),
              ),
              onPressed: () async {
                context.router.popForced();
                await context.router.push(ScrollableSheetRoute(latLng: latLng));
              },
              icon: const Icon(Icons.warehouse_outlined, size: 24),
            ),
            IconButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(EdgeInsets.zero),
                backgroundColor: WidgetStateProperty.all(
                  isDeleteMode.value ? Colors.red : Colors.white,
                ),
              ),
              onPressed: () {
                isDeleteMode.value = !isDeleteMode.value;

                ref
                    .read(markerNotifierProvider.notifier)
                    .toggleDeleteMode(deleteMode: isDeleteMode.value);
              },
              icon: Icon(
                isDeleteMode.value ? Icons.cancel : Icons.delete,
                size: 24,
                color: isDeleteMode.value ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
        body: MapBody(latLng: latLng),
      ),
    );
  }
}

class MapBody extends ConsumerWidget {
  const MapBody({super.key, required this.latLng});

  final LatLng latLng;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapControllerCompleter = ref.watch(mapControllerProvider);
    final markers = ref.watch(markerNotifierProvider).valueOrNull ?? {};

    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.satellite,
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          padding: EdgeInsets.only(
              bottom: MediaQuery.paddingOf(context).bottom + 16),
          initialCameraPosition: CameraPosition(
            target: latLng,
            zoom: 18,
          ),
          onMapCreated: (controller) {
            ref.read(mapControllerProvider.notifier).setController(controller);
          },
          markers: markers,
        ),
        DragTarget<DraggableStamp>(
          onAcceptWithDetails: (details) async {
            final controller = await mapControllerCompleter.future;

            final adjustedOffset = Offset(
              details.offset.dx + details.data.width / 2,
              details.offset.dy + details.data.height / 2 - 50,
            );
            final screenCoordinate = ScreenCoordinate(
              x: adjustedOffset.dx.toInt(),
              y: details.offset.dy.toInt(),
            );

            final latLng = await controller.getLatLng(screenCoordinate);
            log('latLng=$latLng');

            ref.read(droppedStampNotifierProvider.notifier).addStamp(
                  DroppedStamp(
                    id: const Uuid().v4(),
                    latLng: latLng,
                    widget: Container(
                      key: key,
                      child: details.data.widget,
                    ),
                    width: details.data.width,
                    height: details.data.height,
                  ),
                );
          },
          builder: (context, candidateData, rejectedData) {
            return const SizedBox.expand();
          },
        ),
        const Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: StampSelection(),
        ),
      ],
    );
  }
}

class StampSelection extends StatelessWidget {
  const StampSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      padding: EdgeInsets.only(
          top: 8, bottom: MediaQuery.paddingOf(context).bottom + 16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 48),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: stampList.length,
          itemBuilder: (context, index) {
            final stamp = stampList[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomLongPressDraggable(
                data: DraggableStamp(
                  widget: stamp.widget,
                  width: stamp.width,
                  height: stamp.height,
                ),
                feedback: Material(
                  key: key,
                  color: Colors.transparent,
                  // child: stamp.widget,
                  child: Transform.translate(
                    offset: const Offset(0, -50),
                    child: Transform.scale(
                      scale: 1.5,
                      child: stamp.widget,
                    ),
                  ),
                ),
                // feedbackOffset: const Offset(0, -50),
                childWhenDragging: Opacity(
                  opacity: 0.5,
                  child: stamp.widget,
                ),
                child: stamp.widget,
              ),
            );
          },
        ),
      ),
    );
  }
}

@freezed
class DraggableStamp with _$DraggableStamp {
  const factory DraggableStamp({
    required Widget widget,
    required double width,
    required double height,
  }) = _DraggableStamp;
}
