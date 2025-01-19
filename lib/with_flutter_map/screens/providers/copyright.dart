import 'dart:convert';
import 'dart:developer';

import 'package:draggable_resizable_marker_map/with_flutter_map/screens/providers/session_token.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'copyright.g.dart';

@riverpod
Future<String?> copyright(Ref ref,
    {required LatLng latLng, required LatLngBounds bounds}) async {
  const apiKey = String.fromEnvironment('GOOGLE_MAP_API_KEY');
  final sessionTokenAsyncValue = ref.watch(sessionTokenProvider);
  final sessionToken = sessionTokenAsyncValue.valueOrNull;
  if (!sessionTokenAsyncValue.hasValue ||
      sessionTokenAsyncValue.hasError ||
      sessionToken == null) {
    return null;
  }

  final uri = Uri.https(
    'tile.googleapis.com',
    '/tile/v1/viewport',
    {
      'session': sessionToken,
      'key': apiKey,
      'zoom': '18',
      'north': bounds.north.toString(),
      'south': bounds.south.toString(),
      'east': bounds.east.toString(),
      'west': bounds.west.toString(),
    },
  );

  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['copyright'] as String?;
    } else {
      log('Failed to fetch copyright: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    log('Exception while fetching copyright: $e');
    return null;
  }
}
