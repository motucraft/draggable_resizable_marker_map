import 'package:draggable_resizable_marker_map/with_flutter_map/widgets/stamp_list.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'dropped_stamp.freezed.dart';
part 'dropped_stamp.g.dart';

@freezed
class DroppedStamp with _$DroppedStamp {
  const factory DroppedStamp({
    required String id,
    required StampCategory stampCategory,
    required LatLng latLng,
    // refs:
    //  - https://github.com/rrousselGit/freezed/issues/1075
    @JsonKey(includeFromJson: false, includeToJson: false) Widget? widget,
    required double width,
    required double height,
    LatLng? start,
    LatLng? end,
  }) = _DroppedStamp;

  factory DroppedStamp.fromJson(Map<String, dynamic> json) =>
      _$DroppedStampFromJson(json);
}
