import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:draggable_resizable_marker_map/only_google_map/router/router.gr.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        padding:
            EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom + 16),
        initialCameraPosition: const CameraPosition(
          target: LatLng(35.68124555583155, 139.7671262465092),
          zoom: 14.0,
        ),
        onTap: (latLng) {
          context.router.push(MapDialogRoute(latLng: latLng));
        },
      ),
    );
  }
}
