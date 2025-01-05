import 'package:draggable_resizable_marker_map/with_flutter_map/widgets/stamp_list.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'draggable_stamp.freezed.dart';

@freezed
class DraggableStamp with _$DraggableStamp {
  const factory DraggableStamp({
    String? id,
    required StampCategory stampCategory,
    required Widget widget,
    required double width,
    required double height,
    LatLng? start,
    LatLng? end,
  }) = _DraggableStamp;
}
