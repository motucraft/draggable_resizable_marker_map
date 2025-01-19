import 'package:draggable_resizable_marker_map/with_flutter_map/models/draggable_stamp.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/widgets/custom_draggable_stamp.dart';
import 'package:draggable_resizable_marker_map/with_flutter_map/widgets/stamp_list.dart';
import 'package:flutter/material.dart';

class StampSelection extends StatelessWidget {
  const StampSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      padding: EdgeInsets.only(
          top: 8, bottom: MediaQuery.paddingOf(context).bottom + 16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 48),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: stampList.length,
          itemBuilder: (context, index) {
            final stamp = stampList[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: stamp.width,
                height: stamp.height,
                child: CustomDraggableStamp(
                  data: DraggableStamp(
                    stampCategory: stamp.stampCategory,
                    widget: stamp.widget,
                    width: stamp.width,
                    height: stamp.height,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
