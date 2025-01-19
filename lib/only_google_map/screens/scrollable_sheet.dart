import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class ScrollableSheetScreen extends StatelessWidget {
  const ScrollableSheetScreen({super.key, required this.latLng});

  final LatLng latLng;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.maybePop(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.1,
              maxChildSize: 1.0,
              builder: (context, scrollController) {
                return Container(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: ListView(
                    controller: scrollController,
                    padding: EdgeInsets.zero,
                    children: [
                      Align(
                        child: Container(
                          width: 40,
                          height: 5,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                        ),
                      ),
                      ...List.generate(
                        10,
                        (index) => ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          title: Text('サンプルコンテンツ ${index + 1}'),
                          subtitle: const Text('ここはサンプルコンテンツです'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
