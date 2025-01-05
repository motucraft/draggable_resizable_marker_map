import 'dart:math';

import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'draggable_arrow.freezed.dart';

class DraggableArrow extends HookWidget {
  const DraggableArrow({
    super.key,
    required this.initialStart,
    required this.initialEnd,
    this.color = Colors.red,
    this.hitRadius = 10,
    this.onPositionChanged,
  });

  final Point<double> initialStart;
  final Point<double> initialEnd;
  final Color color;
  final double hitRadius;
  final void Function(Point<double> start, Point<double> end)?
      onPositionChanged;

  @override
  Widget build(BuildContext context) {
    final arrowPosition = useState(
      ArrowPosition(start: initialStart, end: initialEnd),
    );
    final isStartBeingDragged = useState(false);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            RepaintBoundary(
              child: CustomPaint(
                painter: ArrowPathPainter(
                  start: arrowPosition.value.start,
                  end: arrowPosition.value.end,
                  color: color,
                ),
              ),
            ),
            Positioned(
              left: arrowPosition.value.start.x - hitRadius,
              top: arrowPosition.value.start.y - hitRadius,
              child: GestureDetector(
                onPanStart: (_) {
                  isStartBeingDragged.value = true;
                },
                onPanUpdate: (details) {
                  arrowPosition.value = arrowPosition.value.copyWith(
                    start: Point(
                      (arrowPosition.value.start.x + details.delta.dx)
                          .clamp(0, constraints.maxWidth),
                      (arrowPosition.value.start.y + details.delta.dy)
                          .clamp(0, constraints.maxHeight),
                    ),
                  );
                },
                onPanEnd: (details) {
                  onPositionChanged?.call(
                    arrowPosition.value.start,
                    arrowPosition.value.end,
                  );
                },
                child: Container(
                  width: hitRadius * 2,
                  height: hitRadius * 2,
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
              left: arrowPosition.value.end.x - hitRadius,
              top: arrowPosition.value.end.y - hitRadius,
              child: GestureDetector(
                onPanStart: (_) {
                  isStartBeingDragged.value = false;
                },
                onPanUpdate: (details) {
                  arrowPosition.value = arrowPosition.value.copyWith(
                    end: Point(
                      (arrowPosition.value.end.x + details.delta.dx)
                          .clamp(0, constraints.maxWidth),
                      (arrowPosition.value.end.y + details.delta.dy)
                          .clamp(0, constraints.maxHeight),
                    ),
                  );
                },
                onPanEnd: (details) {
                  onPositionChanged?.call(
                    arrowPosition.value.start,
                    arrowPosition.value.end,
                  );
                },
                child: Container(
                  width: hitRadius * 2,
                  height: hitRadius * 2,
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ArrowPathPainter extends CustomPainter {
  ArrowPathPainter({
    required this.start,
    required this.end,
    this.color = Colors.red,
    this.hitRadius = 10,
  });

  final Point<double> start;
  final Point<double> end;
  final Color color;
  final double hitRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    Path path = Path()
      ..moveTo(start.x, start.y)
      ..lineTo(end.x, end.y);
    path = ArrowPath.addTip(path);
    canvas.drawPath(path, paint);

    final hitCircle = Paint()
      ..color = Colors.white.withValues(alpha: 0.5)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(start.x, start.y), hitRadius, hitCircle);
    canvas.drawCircle(Offset(end.x, end.y), hitRadius, hitCircle);
  }

  @override
  bool shouldRepaint(ArrowPathPainter oldDelegate) {
    return start != oldDelegate.start || end != oldDelegate.end;
  }
}

@freezed
class ArrowPosition with _$ArrowPosition {
  const factory ArrowPosition({
    required Point<double> start,
    required Point<double> end,
  }) = _ArrowPosition;
}
