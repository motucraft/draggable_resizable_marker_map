import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dropped_stamp_notifier.freezed.dart';
part 'dropped_stamp_notifier.g.dart';

@riverpod
class DroppedStampNotifier extends _$DroppedStampNotifier {
  @override
  List<DroppedStamp> build() => [];

  void addStamp(DroppedStamp stamp) {
    state = [...state, stamp];
  }

  void updateStampPosition(String id, LatLng newLatLng) {
    state = state.map((stamp) {
      if (stamp.id == id) {
        return stamp.copyWith(latLng: newLatLng);
      }
      return stamp;
    }).toList();
  }

  void removeStamp(String id) {
    state = state.where((stamp) => stamp.id != id).toList();
  }
}

@freezed
class DroppedStamp with _$DroppedStamp {
  const factory DroppedStamp({
    required String id,
    required LatLng latLng,
    required Widget widget,
    required double width,
    required double height,
  }) = _DroppedStamp;
}
