// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draggable_marker_map.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DraggableStamp {
  Widget get widget => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;

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
  $Res call({Widget widget, double width, double height});
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
    Object? widget = null,
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_value.copyWith(
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
  $Res call({Widget widget, double width, double height});
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
    Object? widget = null,
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_$DraggableStampImpl(
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
    ));
  }
}

/// @nodoc

class _$DraggableStampImpl implements _DraggableStamp {
  const _$DraggableStampImpl(
      {required this.widget, required this.width, required this.height});

  @override
  final Widget widget;
  @override
  final double width;
  @override
  final double height;

  @override
  String toString() {
    return 'DraggableStamp(widget: $widget, width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraggableStampImpl &&
            (identical(other.widget, widget) || other.widget == widget) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @override
  int get hashCode => Object.hash(runtimeType, widget, width, height);

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
      {required final Widget widget,
      required final double width,
      required final double height}) = _$DraggableStampImpl;

  @override
  Widget get widget;
  @override
  double get width;
  @override
  double get height;

  /// Create a copy of DraggableStamp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DraggableStampImplCopyWith<_$DraggableStampImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
