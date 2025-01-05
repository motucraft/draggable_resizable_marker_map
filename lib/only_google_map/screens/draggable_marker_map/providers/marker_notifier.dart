import 'dart:ui';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:draggable_resizable_marker_map/only_google_map/screens/draggable_marker_map/providers/dropped_stamp_notifier.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

part 'marker_notifier.g.dart';

@riverpod
class MarkerNotifier extends _$MarkerNotifier {
  final double devicePixelRatio =
      PlatformDispatcher.instance.views.first.devicePixelRatio;
  bool isDeleteMode = false;

  @override
  Future<Set<Marker>> build() async {
    final List<DroppedStamp> droppedStamps =
        ref.watch(droppedStampNotifierProvider);
    return await _generateMarkers(droppedStamps, isDeleteMode);
  }

  Future<void> toggleDeleteMode({required bool deleteMode}) async {
    final List<DroppedStamp> droppedStamps =
        ref.read(droppedStampNotifierProvider);

    state = await AsyncValue.guard(() async {
      isDeleteMode = deleteMode;
      return await _generateMarkers(droppedStamps, isDeleteMode);
    });
  }

  Future<Set<Marker>> _generateMarkers(
      List<DroppedStamp> droppedStamps, bool isDeleteMode) async {
    // 非同期処理の解決後に `toSet` を呼び出す
    final markerList = await Future.wait(droppedStamps.map((stamp) async {
      final icon = isDeleteMode
          ? await _createIconWithDelete(stamp)
          : await stamp.widget.toBitmapDescriptor(
              waitToRender: Duration.zero,
              logicalSize: Size(stamp.width, stamp.height),
              imageSize: Size(
                stamp.width * devicePixelRatio,
                stamp.height * devicePixelRatio,
              ),
            );

      return Marker(
        markerId: MarkerId(stamp.id),
        position: stamp.latLng,
        draggable: !isDeleteMode,
        icon: icon,
        onDragStart: (latLng) async {
          if (!isDeleteMode) await HapticFeedback.mediumImpact();
        },
        onDragEnd: (latLng) {
          if (!isDeleteMode) {
            ref
                .read(droppedStampNotifierProvider.notifier)
                .updateStampPosition(stamp.id, latLng);
          }
        },
        onTap: () {
          if (isDeleteMode) {
            ref
                .read(droppedStampNotifierProvider.notifier)
                .removeStamp(stamp.id);
          }
        },
      );
    }));

    return markerList.toSet();
  }

  Future<BitmapDescriptor> _createIconWithDelete(DroppedStamp stamp) async {
    final markerWidget = badges.Badge(
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.circle,
        badgeColor: Colors.red,
        borderSide: BorderSide(color: Colors.white, width: 1),
      ),
      position: badges.BadgePosition.topEnd(top: 0, end: 0),
      badgeContent: const Icon(
        Icons.close,
        color: Colors.white,
        size: 12,
      ),
      child: stamp.widget,
    );

    return await markerWidget.toBitmapDescriptor(
      waitToRender: Duration(milliseconds: 300),
    );
  }
}
