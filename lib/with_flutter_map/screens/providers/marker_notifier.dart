import 'dart:developer' as dev;
import 'dart:math';
import 'dart:ui';

import 'package:badges/badges.dart' as badges;
import 'package:draggable_resizable_marker_map/with_flutter_map/models/draggable_stamp.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/models/dropped_stamp.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/screens/providers/dropped_stamp_notifier.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/screens/providers/edit_mode_notifier.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/screens/providers/map_controller.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/widgets/custom_draggable_stamp.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/widgets/draggable_arrow.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/widgets/shaking.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/widgets/stamp_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_box_transform/flutter_box_transform.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'marker_notifier.g.dart';

const transformableMarkerPadding = Offset(48, 48);

@riverpod
class MarkerNotifier extends _$MarkerNotifier {
  final double devicePixelRatio =
      PlatformDispatcher.instance.views.first.devicePixelRatio;

  @override
  Future<List<Marker>> build() async {
    final droppedStamps = ref.watch(droppedStampNotifierProvider);
    final editMode = ref.watch(editModeNotifierProvider);

    if (editMode == EditMode.transform) {
      return await _generateTransformMarkers(droppedStamps);
    }

    return await _generateMarkers(droppedStamps, editMode);
  }

  Future<List<Marker>> _generateMarkers(
    List<DroppedStamp> droppedStamps,
    EditMode? editMode,
  ) async {
    return droppedStamps.map((stamp) {
      final isDeleteMode = editMode == EditMode.delete;

      if (stamp.stampCategory == StampCategory.arrow) {
        return _generateArrowMarker(stamp, isDeleteMode: isDeleteMode);
      }

      return Marker(
        point: stamp.latLng,
        width: stamp.width,
        height: stamp.height,
        child: GestureDetector(
          onTap: isDeleteMode
              ? () {
                  ref
                      .read(droppedStampNotifierProvider.notifier)
                      .removeStamp(stamp.id);
                }
              : null,
          child: Shaking(
            isShaking: isDeleteMode,
            child: badges.Badge(
              showBadge: isDeleteMode,
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.red,
                padding: EdgeInsets.zero,
              ),
              badgeContent: const Icon(
                Icons.cancel,
                color: Colors.white,
                size: 24,
              ),
              child: CustomDraggableStamp(
                data: DraggableStamp(
                  id: stamp.id,
                  stampCategory: stamp.stampCategory,
                  widget: SizedBox(
                    width: stamp.width,
                    height: stamp.height,
                    child: stamp.widget,
                  ),
                  width: stamp.width,
                  height: stamp.height,
                ),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  Marker _generateArrowMarker(DroppedStamp stamp, {bool isDeleteMode = false}) {
    final mapController = ref.watch(mapControllerProvider);

    final view = PlatformDispatcher.instance.views.first;
    final screenWidth = view.physicalSize.width / view.devicePixelRatio;
    final screenHeight = view.physicalSize.height / view.devicePixelRatio;

    return Marker(
      point: stamp.latLng,
      width: screenWidth,
      height: screenHeight,
      child: GestureDetector(
        onTap: isDeleteMode
            ? () {
                ref
                    .read(droppedStampNotifierProvider.notifier)
                    .removeStamp(stamp.id);
              }
            : null,
        child: Shaking(
          isShaking: isDeleteMode,
          child: TransformableArrow(
            stamp: stamp,
            mapController: mapController,
          ),
        ),
      ),
    );
  }

  Future<List<Marker>> _generateTransformMarkers(
    List<DroppedStamp> droppedStamps,
  ) async {
    return droppedStamps.map((stamp) {
      if (stamp.stampCategory == StampCategory.arrow) {
        return _generateArrowMarker(stamp);
      }

      return Marker(
        point: stamp.latLng,
        width: stamp.width + transformableMarkerPadding.dx,
        height: stamp.height + transformableMarkerPadding.dy,
        child: TransformableMarker(
          initialRect: Rect.fromLTWH(24, 24, stamp.width, stamp.height),
          stamp: stamp,
        ),
      );
    }).toList();
  }
}

class TransformableArrow extends ConsumerWidget {
  const TransformableArrow({
    super.key,
    required this.stamp,
    required this.mapController,
  });

  final DroppedStamp stamp;
  final MapController mapController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    dev.log('screenSize=$screenSize');

    final start = stamp.start;
    final end = stamp.end;
    dev.log(
        '_generateArrowMarker latLng=${stamp.latLng}, start=$start, end=$end');

    if (start == null || end == null) {
      throw ArgumentError('Arrow stamp must have both start and end positions');
    }

    final startScreenPoint = mapController.camera.latLngToScreenPoint(start);
    final endScreenPoint = mapController.camera.latLngToScreenPoint(end);

    dev.log(
        'startScreenPoint=$startScreenPoint, endScreenPoint=$endScreenPoint');

    return DraggableArrow(
      initialStart: startScreenPoint,
      initialEnd: endScreenPoint,
      onPositionChanged: (start, end) {
        final startLatLng = mapController.camera.pointToLatLng(start);
        final endLatLng = mapController.camera.pointToLatLng(end);
        final LatLng middleLatLng = LatLng(
          (startLatLng.latitude + endLatLng.latitude) / 2,
          (startLatLng.longitude + endLatLng.longitude) / 2,
        );
        dev.log(
            'start=$start, end=$end, latLng=${stamp.latLng}, startLatLng=$startLatLng, endLatLng=$endLatLng, middleLatLng=$middleLatLng');

        ref.read(droppedStampNotifierProvider.notifier).updateStamp(
              stamp.id,
              // newLatLng: middleLatLng,
              newLatLng: stamp.latLng,
              newStart: startLatLng,
              newEnd: endLatLng,
            );
      },
    );
  }
}

class TransformableMarker extends HookConsumerWidget {
  const TransformableMarker({
    super.key,
    required this.initialRect,
    required this.stamp,
  });

  final Rect initialRect;
  final DroppedStamp stamp;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapController mapController = ref.watch(mapControllerProvider);
    final TransformableBoxController controller =
        useMemoized(() => TransformableBoxController(
              allowFlippingWhileResizing: false,
              rect: initialRect,
              constraints: BoxConstraints(
                minWidth: 32,
                minHeight: 32,
              ),
            ));

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        TransformableBox(
          controller: controller,
          draggable: false,
          allowContentFlipping: false,
          allowFlippingWhileResizing: false,
          enabledHandles: const {
            // HandlePosition.topLeft,
            // HandlePosition.topRight,
            // HandlePosition.bottomLeft,
            HandlePosition.bottomRight,
          },
          visibleHandles: const {
            // HandlePosition.topLeft,
            // HandlePosition.topRight,
            // HandlePosition.bottomLeft,
            HandlePosition.bottomRight,
          },
          // onResizeEnd: (handle, event) {
          //   ref.read(droppedStampNotifierProvider.notifier).updateStampSize(
          //       stamp.id, controller.rect.width, controller.rect.height);
          // },

          // ↓ bottomRight以外のハンドルも有効化したうえで、矩形の中心を新しい位置情報にしたかったがうまくいかず
          //   そのため、`HandlePosition.bottomRight`だけを有効化している

          onResizeEnd: (HandlePosition handle, DragEndDetails event) {
            final width = controller.rect.width;
            final height = controller.rect.height;

            final localCenter = controller.rect.center;
            final mapWidgetOffset = (context.findRenderObject() as RenderBox)
                .localToGlobal(Offset.zero);
            final globalCenter = localCenter + mapWidgetOffset;

            final adjustedGlobalCenter = switch (handle) {
              HandlePosition.bottomRight => globalCenter,
              HandlePosition.topRight => Offset(
                  globalCenter.dx,
                  globalCenter.dy + height / 2,
                ),
              HandlePosition.topLeft => Offset(
                  globalCenter.dx + width / 2,
                  globalCenter.dy + height / 2,
                ),
              HandlePosition.bottomLeft => Offset(
                  globalCenter.dx + width / 2,
                  globalCenter.dy,
                ),
              _ =>
                throw UnsupportedError('Unsupported handle position: $handle'),
            };

            final newLatLng = mapController.camera.pointToLatLng(
              Point(adjustedGlobalCenter.dx, adjustedGlobalCenter.dy),
            );

            dev.log(
                'latLng: ${stamp.latLng}, newLatLng: $newLatLng, rect: ${controller.rect}, globalCenter: $globalCenter, adjustedGlobalCenter: $adjustedGlobalCenter');

            ref.read(droppedStampNotifierProvider.notifier).updateStamp(
                  stamp.id,
                  newLatLng: newLatLng,
                  newWidth: width,
                  newHeight: height,
                );
          },
          contentBuilder: (context, rect, flip) {
            return DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: stamp.widget,
            );
          },
          cornerHandleBuilder: (context, handle) {
            return Icon(
              Icons.open_with,
              size: 24.0,
              color: Colors.white,
            );
          },
        ),
      ],
    );
  }
}
