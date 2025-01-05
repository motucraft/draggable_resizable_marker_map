// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draggable_stamp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DraggableStamp {
  String? get id => throw _privateConstructorUsedError;
  StampCategory get stampCategory => throw _privateConstructorUsedError;
  Widget get widget => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  LatLng? get start => throw _privateConstructorUsedError;
  LatLng? get end => throw _privateConstructorUsedError;

  /// Create a copy of DraggableStamp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DraggableStampCopyWith<DraggableStamp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraggableStampCopyWith<$Res> {
  factory $DraggableStampCopyWith(
          DraggableStamp value, $Res Function(DraggableStamp) then) =
      _$DraggableStampCopyWithImpl<$Res, DraggableStamp>;
  @useResult
  $Res call(
      {String? id,
      StampCategory stampCategory,
      Widget widget,
      double width,
      double height,
      LatLng? start,
      LatLng? end});
}

/// @nodoc
class _$DraggableStampCopyWithImpl<$Res, $Val extends DraggableStamp>
    implements $DraggableStampCopyWith<$Res> {
  _$DraggableStampCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DraggableStamp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stampCategory = null,
    Object? widget = null,
    Object? width = null,
    Object? height = null,
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      stampCategory: null == stampCategory
          ? _value.stampCategory
          : stampCategory // ignore: cast_nullable_to_non_nullable
              as StampCategory,
      widget: null == widget
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as Widget,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DraggableStampImplCopyWith<$Res>
    implements $DraggableStampCopyWith<$Res> {
  factory _$$DraggableStampImplCopyWith(_$DraggableStampImpl value,
          $Res Function(_$DraggableStampImpl) then) =
      __$$DraggableStampImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      StampCategory stampCategory,
      Widget widget,
      double width,
      double height,
      LatLng? start,
      LatLng? end});
}

/// @nodoc
class __$$DraggableStampImplCopyWithImpl<$Res>
    extends _$DraggableStampCopyWithImpl<$Res, _$DraggableStampImpl>
    implements _$$DraggableStampImplCopyWith<$Res> {
  __$$DraggableStampImplCopyWithImpl(
      _$DraggableStampImpl _value, $Res Function(_$DraggableStampImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraggableStamp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stampCategory = null,
    Object? widget = null,
    Object? width = null,
    Object? height = null,
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_$DraggableStampImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      stampCategory: null == stampCategory
          ? _value.stampCategory
          : stampCategory // ignore: cast_nullable_to_non_nullable
              as StampCategory,
      widget: null == widget
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as Widget,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ));
  }
}

/// @nodoc

class _$DraggableStampImpl implements _DraggableStamp {
  const _$DraggableStampImpl(
      {this.id,
      required this.stampCategory,
      required this.widget,
      required this.width,
      required this.height,
      this.start,
      this.end});

  @override
  final String? id;
  @override
  final StampCategory stampCategory;
  @override
  final Widget widget;
  @override
  final double width;
  @override
  final double height;
  @override
  final LatLng? start;
  @override
  final LatLng? end;

  @override
  String toString() {
    return 'DraggableStamp(id: $id, stampCategory: $stampCategory, widget: $widget, width: $width, height: $height, start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraggableStampImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stampCategory, stampCategory) ||
                other.stampCategory == stampCategory) &&
            (identical(other.widget, widget) || other.widget == widget) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, stampCategory, widget, width, height, start, end);

  /// Create a copy of DraggableStamp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DraggableStampImplCopyWith<_$DraggableStampImpl> get copyWith =>
      __$$DraggableStampImplCopyWithImpl<_$DraggableStampImpl>(
          this, _$identity);
}

abstract class _DraggableStamp implements DraggableStamp {
  const factory _DraggableStamp(
      {final String? id,
      required final StampCategory stampCategory,
      required final Widget widget,
      required final double width,
      required final double height,
      final LatLng? start,
      final LatLng? end}) = _$DraggableStampImpl;

  @override
  String? get id;
  @override
  StampCategory get stampCategory;
  @override
  Widget get widget;
  @override
  double get width;
  @override
  double get height;
  @override
  LatLng? get start;
  @override
  LatLng? get end;

  /// Create a copy of DraggableStamp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DraggableStampImplCopyWith<_$DraggableStampImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
