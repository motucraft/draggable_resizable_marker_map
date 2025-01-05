import 'dart:convert';
import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_token.g.dart';

// see... https://developers.google.com/maps/documentation/tile/session_tokens?hl=ja
@riverpod
Future<String> sessionToken(Ref ref) async {
  const apiKey = String.fromEnvironment('GOOGLE_MAP_API_KEY');
  const url = 'https://tile.googleapis.com/v1/createSession';
  final response = await http.post(
    Uri.parse('$url?key=$apiKey'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'mapType': 'satellite',
      'language': 'ja',
      'region': 'JP',
    }),
  );

  if (response.statusCode == 200) {
    final session = json.decode(response.body)['session'];
    log('session=$session');
    return session;
  } else {
    throw Exception('Failed to create session: ${response.body}');
  }
}
