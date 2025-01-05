import 'package:draggable_resizable_marker_map/widgets/custom_long_press_draggable.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/models/draggable_stamp.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/widgets/stamp_list.dart';
import 'package:flutter/material.dart';

class CustomDraggableStamp extends StatelessWidget {
  const CustomDraggableStamp({
    super.key,
    required this.data,
  });

  final DraggableStamp data;

  @override
  Widget build(BuildContext context) {
    return CustomLongPressDraggable<DraggableStamp>(
      data: data,
      feedback: Material(
        color: Colors.transparent,
        child: Transform.translate(
          offset: const Offset(0, -50),
          child: Transform.scale(
            scale: data.id == null ? 2 : 1,
            child: data.widget,
          ),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.5,
        child: data.widget,
      ),
      child: data.stampCategory == StampCategory.arrow
          ? SizedBox.expand(
              child: data.widget,
            )
          : data.widget,
    );
  }
}
