import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:draggable_resizable_marker_map/only_google_map/router/router.dart';
import 'package:draggable_resizable_marker_map/util/determine_position.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      determinePosition();
      return null;
    }, []);

    return MaterialApp.router(
      theme: ThemeData.light(),
      routerConfig: ref.watch(routerProvider).config(),
    );
  }
}
