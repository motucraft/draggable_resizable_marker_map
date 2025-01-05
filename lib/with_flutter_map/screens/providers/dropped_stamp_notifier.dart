import 'package:draggable_resizable_marker_map/with_flutter_map/models/dropped_stamp.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dropped_stamp_notifier.g.dart';

@riverpod
class DroppedStampNotifier extends _$DroppedStampNotifier {
  @override
  List<DroppedStamp> build() => [];

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
