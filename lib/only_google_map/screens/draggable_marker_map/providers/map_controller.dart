import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_controller.g.dart';

@riverpod
class MapController extends _$MapController {
  final Completer<GoogleMapController> _completer =
      Completer<GoogleMapController>();

  @override
  Completer<GoogleMapController> build() {
    return _completer;
  }

  void setController(GoogleMapController controller) {
    if (!_completer.isCompleted) {
      _completer.complete(controller);
    }
  }
}
