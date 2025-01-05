import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomLongPressDraggable<T extends Object> extends LongPressDraggable<T> {
  const CustomLongPressDraggable({
    super.key,
    required super.child,
    required super.feedback,
    super.data,
    super.axis,
    super.childWhenDragging,
    super.feedbackOffset,
    super.dragAnchorStrategy,
    super.maxSimultaneousDrags,
    super.onDragStarted,
    super.onDragUpdate,
    super.onDraggableCanceled,
    super.onDragEnd,
    super.onDragCompleted,
    bool? hapticFeedbackOnStart,
    Duration? delay,
    super.ignoringFeedbackSemantics,
    super.ignoringFeedbackPointer,
    super.allowedButtonsFilter,
    super.hitTestBehavior,
    super.rootOverlay,
  })  : _hapticFeedbackOnStart = hapticFeedbackOnStart ?? true,
        _delay = delay ?? kLongPressTimeout;

  final bool _hapticFeedbackOnStart;
  final Duration _delay;

  @override
  bool get hapticFeedbackOnStart => _hapticFeedbackOnStart;

  @override
  Duration get delay => _delay;

  @override
  DelayedMultiDragGestureRecognizer createRecognizer(
      GestureMultiDragStartCallback onStart) {
    return DelayedMultiDragGestureRecognizer(
        delay: delay, allowedButtonsFilter: allowedButtonsFilter)
      ..onStart = (Offset position) {
        final Drag? result = onStart(position);
        if (result != null && hapticFeedbackOnStart) {
          HapticFeedback.mediumImpact();
        }
        return result;
      };
  }
}
