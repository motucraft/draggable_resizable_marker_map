import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Shaking extends HookWidget {
  const Shaking({
    super.key,
    required this.child,
    this.isShaking = false,
    this.duration = const Duration(milliseconds: 150),
    this.rotationAngle = 0.05,
  });

  final Widget child;
  final bool isShaking;
  final Duration duration;
  final double rotationAngle;

  @override
  Widget build(BuildContext context) {
    final rotationController = useAnimationController(duration: duration)
      ..repeat(reverse: true);

    final rotationAnimation = useMemoized(
      () => Tween<double>(begin: -rotationAngle, end: rotationAngle)
          .animate(CurvedAnimation(
        parent: rotationController,
        curve: Curves.easeInOut,
      )),
      [rotationAngle],
    );

    useEffect(() {
      if (isShaking) {
        rotationController.repeat(reverse: true);
      } else {
        rotationController.stop();
      }
      return null;
    }, [isShaking]);

    return AnimatedBuilder(
      animation: rotationAnimation,
      builder: (_, child) {
        return Transform.rotate(
          angle: isShaking ? rotationAnimation.value : 0,
          child: child,
        );
      },
      child: child,
    );
  }
}
