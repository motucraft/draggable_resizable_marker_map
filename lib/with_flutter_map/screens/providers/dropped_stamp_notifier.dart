import 'dart:convert';

import 'package:draggable_resizable_marker_map/with_flutter_map/models/dropped_stamp.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/widgets/stamp_list.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dropped_stamp_notifier.g.dart';

@riverpod
class DroppedStampNotifier extends _$DroppedStampNotifier {
  @override
  List<DroppedStamp> build() => [
        // バックエンドから入手したデータを元にデシリアライズすることを想定
        DroppedStamp.fromJson(jsonDecode(
                '{"id":"3ecf6ede-eaae-4972-a47d-d4824875d535","stampCategory":"wc","latLng":{"coordinates":[139.76997043937445,35.681193170633684]},"width":30.0,"height":30.0,"start":null,"end":null}'))
            .copyWith(widget: StampCategory.wc.stamp.widget),
      ];

  void addStamp(DroppedStamp stamp) {
    state = [...state, stamp];
  }

  void updateStamp(
    String id, {
    LatLng? newLatLng,
    double? newWidth,
    double? newHeight,
    LatLng? newStart,
    LatLng? newEnd,
  }) {
    state = state.map((stamp) {
      if (stamp.id == id) {
        return stamp.copyWith(
          latLng: newLatLng ?? stamp.latLng,
          width: newWidth ?? stamp.width,
          height: newHeight ?? stamp.height,
          start: newStart ?? stamp.start,
          end: newEnd ?? stamp.end,
        );
      }
      return stamp;
    }).toList();
  }

  void removeStamp(String id) {
    state = state.where((stamp) => stamp.id != id).toList();
  }
}
