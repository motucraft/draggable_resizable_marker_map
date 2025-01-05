import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/router/router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
// ignore: unsupported_provider_value
AppRouter router(Ref ref) {
  final router = AppRouter();
  ref.onDispose(router.dispose);

  return router;
}

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: FlutterMapHomeRoute.page,
        ),
        CustomRoute(
          page: FlutterMapMapDialogRoute.page,
          customRouteBuilder: <T>(_, child, page) {
            return buildAnimatedDialogRoute(child, page);
          },
        ),
        CustomRoute(
          page: FlutterMapScrollableSheetRoute.page,
          customRouteBuilder: <T>(_, child, page) {
            return buildAnimatedDialogRoute(child, page);
          },
        ),
        AutoRoute(page: FlutterMapDraggableMarkerMapRoute.page),
      ];
}

class CustomDialogRoute<T> extends RawDialogRoute<T> {
  @override
  final Duration reverseTransitionDuration;

  CustomDialogRoute({
    required super.pageBuilder,
    super.barrierDismissible,
    super.barrierColor,
    super.barrierLabel,
    super.transitionDuration,
    super.transitionBuilder,
    super.settings,
    super.anchorPoint,
    super.traversalEdgeBehavior,
    this.reverseTransitionDuration = Duration.zero,
  });
}

Route<T> buildAnimatedDialogRoute<T>(Widget child, AutoRoutePage<T> page) {
  return CustomDialogRoute(
    settings: page,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    transitionDuration: const Duration(milliseconds: 1200),
    pageBuilder: (_, __, ___) => child,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      if (animation.status == AnimationStatus.reverse) {
        return child;
      }

      final offsetAnimation = Tween(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: const ElasticOutCurve(1.0),
        ),
      );

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
