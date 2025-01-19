import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stamp_list.freezed.dart';

final stampList = [
  const Stamp(
    stampCategory: StampCategory.login,
    widget: FittedBox(
      child: Icon(
        Icons.login,
        color: Colors.green,
      ),
    ),
    width: 48,
    height: 48,
  ),
  const Stamp(
    stampCategory: StampCategory.exit,
    widget: FittedBox(
      child: Icon(
        Icons.exit_to_app,
        color: Colors.redAccent,
      ),
    ),
    width: 48,
    height: 48,
  ),
  const Stamp(
    stampCategory: StampCategory.arrow,
    widget: FittedBox(
      child: Icon(
        Icons.arrow_forward,
        color: Colors.red,
      ),
    ),
    width: 48,
    height: 48,
  ),
  const Stamp(
    stampCategory: StampCategory.info,
    widget: FittedBox(
      child: Icon(
        Icons.info,
        color: Colors.blue,
      ),
    ),
    width: 48,
    height: 48,
  ),
  const Stamp(
    stampCategory: StampCategory.wc,
    widget: FittedBox(
      child: Icon(
        Icons.wc,
        color: Colors.purple,
      ),
    ),
    width: 48,
    height: 48,
  ),
  Stamp(
    stampCategory: StampCategory.danger,
    widget: FittedBox(
      child: Container(
        color: Colors.yellow,
        alignment: Alignment.center,
        child: const FittedBox(
          child: Text(
            'DANGER',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    ),
    width: 48,
    height: 48,
  ),
  const Stamp(
    stampCategory: StampCategory.localParking,
    widget: FittedBox(
      child: Icon(
        Icons.local_parking,
        color: Colors.brown,
      ),
    ),
    width: 48,
    height: 48,
  ),
  const Stamp(
    stampCategory: StampCategory.smokingArea,
    widget: FittedBox(
      child: Icon(
        Icons.smoking_rooms,
        color: Colors.red,
      ),
    ),
    width: 48,
    height: 48,
  ),
  const Stamp(
    stampCategory: StampCategory.busStop,
    widget: FittedBox(
      child: Icon(
        Icons.directions_bus,
        color: Colors.yellow,
      ),
    ),
    width: 48,
    height: 48,
  ),
  const Stamp(
    stampCategory: StampCategory.help,
    widget: FittedBox(
      child: Icon(
        Icons.help_outline,
        color: Colors.indigo,
      ),
    ),
    width: 48,
    height: 48,
  ),
  const Stamp(
    stampCategory: StampCategory.store,
    widget: FittedBox(
      child: Icon(
        Icons.store,
        color: Colors.deepOrange,
      ),
    ),
    width: 48,
    height: 48,
  ),
];

@freezed
class Stamp with _$Stamp {
  const factory Stamp({
    required StampCategory stampCategory,
    required Widget widget,
    required double width,
    required double height,
  }) = _Stamp;
}

enum StampCategory {
  login,
  exit,
  info,
  wc,
  danger,
  localParking,
  smokingArea,
  busStop,
  help,
  store,
  arrow,
}
