import 'package:draggable_resizable_marker_map/with_flutter_map/screens/providers/dropped_stamp_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_mode_notifier.g.dart';

@riverpod
class EditModeNotifier extends _$EditModeNotifier {
  @override
  EditMode build() {
    ref.listen(droppedStampNotifierProvider, (_, next) {
      if (next.isEmpty) {
        ref.invalidateSelf();
      }
    });

    return EditMode.none;
  }

  void update(EditMode editMode) => state = editMode;
}

enum EditMode {
  none,
  delete,
  transform,
  arrow,
}
