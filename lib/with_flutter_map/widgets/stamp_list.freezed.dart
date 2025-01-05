// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stamp_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Stamp {
  StampCategory get stampCategory => throw _privateConstructorUsedError;
  Widget get widget => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;

  /// Create a copy of Stamp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StampCopyWith<Stamp> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StampCopyWith<$Res> {
  factory $StampCopyWith(Stamp value, $Res Function(Stamp) then) =
      _$StampCopyWithImpl<$Res, Stamp>;
  @useResult
  $Res call(
      {StampCategory stampCategory,
      Widget widget,
      double width,
      double height});
}

/// @nodoc
class _$StampCopyWithImpl<$Res, $Val extends Stamp>
    implements $StampCopyWith<$Res> {
  _$StampCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Stamp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stampCategory = null,
    Object? widget = null,
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StampImplCopyWith<$Res> implements $StampCopyWith<$Res> {
  factory _$$StampImplCopyWith(
          _$StampImpl value, $Res Function(_$StampImpl) then) =
      __$$StampImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StampCategory stampCategory,
      Widget widget,
      double width,
      double height});
}

/// @nodoc
class __$$StampImplCopyWithImpl<$Res>
    extends _$StampCopyWithImpl<$Res, _$StampImpl>
    implements _$$StampImplCopyWith<$Res> {
  __$$StampImplCopyWithImpl(
      _$StampImpl _value, $Res Function(_$StampImpl) _then)
      : super(_value, _then);

  /// Create a copy of Stamp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stampCategory = null,
    Object? widget = null,
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_$StampImpl(
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
    ));
  }
}

/// @nodoc

class _$StampImpl implements _Stamp {
  const _$StampImpl(
      {required this.stampCategory,
      required this.widget,
      required this.width,
      required this.height});

  @override
  final StampCategory stampCategory;
  @override
  final Widget widget;
  @override
  final double width;
  @override
  final double height;

  @override
  String toString() {
    return 'Stamp(stampCategory: $stampCategory, widget: $widget, width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StampImpl &&
            (identical(other.stampCategory, stampCategory) ||
                other.stampCategory == stampCategory) &&
            (identical(other.widget, widget) || other.widget == widget) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, stampCategory, widget, width, height);

  /// Create a copy of Stamp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StampImplCopyWith<_$StampImpl> get copyWith =>
      __$$StampImplCopyWithImpl<_$StampImpl>(this, _$identity);
}

abstract class _Stamp implements Stamp {
  const factory _Stamp(
      {required final StampCategory stampCategory,
      required final Widget widget,
      required final double width,
      required final double height}) = _$StampImpl;

  @override
  StampCategory get stampCategory;
  @override
  Widget get widget;
  @override
  double get width;
  @override
  double get height;

  /// Create a copy of Stamp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StampImplCopyWith<_$StampImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
