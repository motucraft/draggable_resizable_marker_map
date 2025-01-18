// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:draggable_resizable_marker_map/only_google_map/screens/draggable_marker_map/draggable_marker_map.dart'
    as _i1;
import 'package:draggable_resizable_marker_map/only_google_map/screens/home.dart'
    as _i6;
import 'package:draggable_resizable_marker_map/only_google_map/screens/map_dialog_screen.dart'
    as _i7;
import 'package:draggable_resizable_marker_map/only_google_map/screens/scrollable_sheet.dart'
    as _i8;
import 'package:draggable_resizable_marker_map/with_flutter_map/screens/draggable_marker_map.dart'
    as _i2;
import 'package:draggable_resizable_marker_map/with_flutter_map/screens/home.dart'
    as _i3;
import 'package:draggable_resizable_marker_map/with_flutter_map/screens/map_dialog_screen.dart'
    as _i4;
import 'package:draggable_resizable_marker_map/with_flutter_map/screens/scrollable_sheet.dart'
    as _i5;
import 'package:flutter/material.dart' as _i10;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i11;
import 'package:latlong2/latlong.dart' as _i12;

/// generated route for
/// [_i1.DraggableMarkerMapScreen]
class DraggableMarkerMapRoute
    extends _i9.PageRouteInfo<DraggableMarkerMapRouteArgs> {
  DraggableMarkerMapRoute({
    _i10.Key? key,
    required _i11.LatLng latLng,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         DraggableMarkerMapRoute.name,
         args: DraggableMarkerMapRouteArgs(key: key, latLng: latLng),
         initialChildren: children,
       );

  static const String name = 'DraggableMarkerMapRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DraggableMarkerMapRouteArgs>();
      return _i1.DraggableMarkerMapScreen(key: args.key, latLng: args.latLng);
    },
  );
}

class DraggableMarkerMapRouteArgs {
  const DraggableMarkerMapRouteArgs({this.key, required this.latLng});

  final _i10.Key? key;

  final _i11.LatLng latLng;

  @override
  String toString() {
    return 'DraggableMarkerMapRouteArgs{key: $key, latLng: $latLng}';
  }
}

/// generated route for
/// [_i2.FlutterMapDraggableMarkerMapScreen]
class FlutterMapDraggableMarkerMapRoute
    extends _i9.PageRouteInfo<FlutterMapDraggableMarkerMapRouteArgs> {
  FlutterMapDraggableMarkerMapRoute({
    _i10.Key? key,
    required _i12.LatLng latLng,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         FlutterMapDraggableMarkerMapRoute.name,
         args: FlutterMapDraggableMarkerMapRouteArgs(key: key, latLng: latLng),
         initialChildren: children,
       );

  static const String name = 'FlutterMapDraggableMarkerMapRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FlutterMapDraggableMarkerMapRouteArgs>();
      return _i2.FlutterMapDraggableMarkerMapScreen(
        key: args.key,
        latLng: args.latLng,
      );
    },
  );
}

class FlutterMapDraggableMarkerMapRouteArgs {
  const FlutterMapDraggableMarkerMapRouteArgs({this.key, required this.latLng});

  final _i10.Key? key;

  final _i12.LatLng latLng;

  @override
  String toString() {
    return 'FlutterMapDraggableMarkerMapRouteArgs{key: $key, latLng: $latLng}';
  }
}

/// generated route for
/// [_i3.FlutterMapHomeScreen]
class FlutterMapHomeRoute extends _i9.PageRouteInfo<void> {
  const FlutterMapHomeRoute({List<_i9.PageRouteInfo>? children})
    : super(FlutterMapHomeRoute.name, initialChildren: children);

  static const String name = 'FlutterMapHomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.FlutterMapHomeScreen();
    },
  );
}

/// generated route for
/// [_i4.FlutterMapMapDialogRoute]
class FlutterMapMapDialogRoute
    extends _i9.PageRouteInfo<FlutterMapMapDialogRouteArgs> {
  FlutterMapMapDialogRoute({
    _i10.Key? key,
    required _i11.LatLng latLng,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         FlutterMapMapDialogRoute.name,
         args: FlutterMapMapDialogRouteArgs(key: key, latLng: latLng),
         initialChildren: children,
       );

  static const String name = 'FlutterMapMapDialogRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FlutterMapMapDialogRouteArgs>();
      return _i4.FlutterMapMapDialogRoute(key: args.key, latLng: args.latLng);
    },
  );
}

class FlutterMapMapDialogRouteArgs {
  const FlutterMapMapDialogRouteArgs({this.key, required this.latLng});

  final _i10.Key? key;

  final _i11.LatLng latLng;

  @override
  String toString() {
    return 'FlutterMapMapDialogRouteArgs{key: $key, latLng: $latLng}';
  }
}

/// generated route for
/// [_i5.FlutterMapScrollableSheetScreen]
class FlutterMapScrollableSheetRoute
    extends _i9.PageRouteInfo<FlutterMapScrollableSheetRouteArgs> {
  FlutterMapScrollableSheetRoute({
    _i10.Key? key,
    required _i12.LatLng latLng,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         FlutterMapScrollableSheetRoute.name,
         args: FlutterMapScrollableSheetRouteArgs(key: key, latLng: latLng),
         initialChildren: children,
       );

  static const String name = 'FlutterMapScrollableSheetRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FlutterMapScrollableSheetRouteArgs>();
      return _i5.FlutterMapScrollableSheetScreen(
        key: args.key,
        latLng: args.latLng,
      );
    },
  );
}

class FlutterMapScrollableSheetRouteArgs {
  const FlutterMapScrollableSheetRouteArgs({this.key, required this.latLng});

  final _i10.Key? key;

  final _i12.LatLng latLng;

  @override
  String toString() {
    return 'FlutterMapScrollableSheetRouteArgs{key: $key, latLng: $latLng}';
  }
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomeScreen();
    },
  );
}

/// generated route for
/// [_i7.MapDialogScreen]
class MapDialogRoute extends _i9.PageRouteInfo<MapDialogRouteArgs> {
  MapDialogRoute({
    _i10.Key? key,
    required _i11.LatLng latLng,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         MapDialogRoute.name,
         args: MapDialogRouteArgs(key: key, latLng: latLng),
         initialChildren: children,
       );

  static const String name = 'MapDialogRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MapDialogRouteArgs>();
      return _i7.MapDialogScreen(key: args.key, latLng: args.latLng);
    },
  );
}

class MapDialogRouteArgs {
  const MapDialogRouteArgs({this.key, required this.latLng});

  final _i10.Key? key;

  final _i11.LatLng latLng;

  @override
  String toString() {
    return 'MapDialogRouteArgs{key: $key, latLng: $latLng}';
  }
}

/// generated route for
/// [_i8.ScrollableSheetScreen]
class ScrollableSheetRoute extends _i9.PageRouteInfo<ScrollableSheetRouteArgs> {
  ScrollableSheetRoute({
    _i10.Key? key,
    required _i11.LatLng latLng,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         ScrollableSheetRoute.name,
         args: ScrollableSheetRouteArgs(key: key, latLng: latLng),
         initialChildren: children,
       );

  static const String name = 'ScrollableSheetRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ScrollableSheetRouteArgs>();
      return _i8.ScrollableSheetScreen(key: args.key, latLng: args.latLng);
    },
  );
}

class ScrollableSheetRouteArgs {
  const ScrollableSheetRouteArgs({this.key, required this.latLng});

  final _i10.Key? key;

  final _i11.LatLng latLng;

  @override
  String toString() {
    return 'ScrollableSheetRouteArgs{key: $key, latLng: $latLng}';
  }
}
