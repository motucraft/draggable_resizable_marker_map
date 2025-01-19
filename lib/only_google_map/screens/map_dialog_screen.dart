import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:draggable_resizable_marker_map/only_google_map/router/router.gr.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

@RoutePage()
class MapDialogScreen extends StatelessWidget {
  const MapDialogScreen({super.key, required this.latLng});

  final LatLng latLng;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return GestureDetector(
      onTap: () => context.maybePop(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.95),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 8,
                    child: Card(
                      elevation: 4,
                      child: InkWell(
                        onTap: () => context.router
                            .push(DraggableMarkerMapRoute(latLng: latLng)),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Flexible(
                                child: MapImage(latLng: latLng),
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: FutureBuilder(
                                  future: _getAddressFromLatLng(latLng),
                                  builder: (context, snapshot) {
                                    final address = snapshot.data;
                                    if (snapshot.connectionState ==
                                            ConnectionState.waiting ||
                                        !snapshot.hasData ||
                                        address == null) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }

                                    return Text(address);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> _getAddressFromLatLng(LatLng latLng) async {
    const apiKey = String.fromEnvironment('GOOGLE_MAP_API_KEY');

    // URIを安全に構築
    final uri = Uri.https(
      'maps.googleapis.com',
      '/maps/api/geocode/json',
      {
        'key': apiKey,
        'latlng': '${latLng.latitude},${latLng.longitude}',
        'language': 'ja',
      },
    );

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'OK' && data['results'].isNotEmpty) {
          return data['results'][0]['formatted_address'];
        } else {
          return null;
        }
      } else {
        throw Exception('Failed to fetch address: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching address: $e');
      return null;
    }
  }
}

class MapImage extends StatelessWidget {
  const MapImage({super.key, required this.latLng});

  final LatLng latLng;

  @override
  Widget build(BuildContext context) {
    const apiKey = String.fromEnvironment('GOOGLE_MAP_API_KEY');
    final imageUrl = 'https://maps.googleapis.com/maps/api/staticmap'
        '?center=${latLng.latitude},${latLng.longitude}'
        '&zoom=18'
        '&size=600x400'
        '&maptype=satellite'
        '&key=$apiKey';

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(imageUrl: imageUrl),
    );
  }
}
