// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dropped_stamp_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DroppedStamp {
  String get id => throw _privateConstructorUsedError;
  LatLng get latLng => throw _privateConstructorUsedError;
  Widget get widget => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;

  /// Create a copy of DroppedStamp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DroppedStampCopyWith<DroppedStamp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DroppedStampCopyWith<$Res> {
  factory $DroppedStampCopyWith(
          DroppedStamp value, $Res Function(DroppedStamp) then) =
      _$DroppedStampCopyWithImpl<$Res, DroppedStamp>;
  @useResult
  $Res call(
      {String id, LatLng latLng, Widget widget, double width, double height});
}

/// @nodoc
class _$DroppedStampCopyWithImpl<$Res, $Val extends DroppedStamp>
    implements $DroppedStampCopyWith<$Res> {
  _$DroppedStampCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DroppedStamp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? latLng = null,
    Object? widget = null,
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      latLng: null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng,
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
abstract class _$$DroppedStampImplCopyWith<$Res>
    implements $DroppedStampCopyWith<$Res> {
  factory _$$DroppedStampImplCopyWith(
          _$DroppedStampImpl value, $Res Function(_$DroppedStampImpl) then) =
      __$$DroppedStampImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, LatLng latLng, Widget widget, double width, double height});
}

/// @nodoc
class __$$DroppedStampImplCopyWithImpl<$Res>
    extends _$DroppedStampCopyWithImpl<$Res, _$DroppedStampImpl>
    implements _$$DroppedStampImplCopyWith<$Res> {
  __$$DroppedStampImplCopyWithImpl(
      _$DroppedStampImpl _value, $Res Function(_$DroppedStampImpl) _then)
      : super(_value, _then);

  /// Create a copy of DroppedStamp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? latLng = null,
    Object? widget = null,
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_$DroppedStampImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      latLng: null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng,
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

class _$DroppedStampImpl implements _DroppedStamp {
  const _$DroppedStampImpl(
      {required this.id,
      required this.latLng,
      required this.widget,
      required this.width,
      required this.height});

  @override
  final String id;
  @override
  final LatLng latLng;
  @override
  final Widget widget;
  @override
  final double width;
  @override
  final double height;

  @override
  String toString() {
    return 'DroppedStamp(id: $id, latLng: $latLng, widget: $widget, width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DroppedStampImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.latLng, latLng) || other.latLng == latLng) &&
            (identical(other.widget, widget) || other.widget == widget) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, latLng, widget, width, height);

  /// Create a copy of DroppedStamp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DroppedStampImplCopyWith<_$DroppedStampImpl> get copyWith =>
      __$$DroppedStampImplCopyWithImpl<_$DroppedStampImpl>(this, _$identity);
}

abstract class _DroppedStamp implements DroppedStamp {
  const factory _DroppedStamp(
      {required final String id,
      required final LatLng latLng,
      required final Widget widget,
      required final double width,
      required final double height}) = _$DroppedStampImpl;

  @override
  String get id;
  @override
  LatLng get latLng;
  @override
  Widget get widget;
  @override
  double get width;
  @override
  double get height;

  /// Create a copy of DroppedStamp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DroppedStampImplCopyWith<_$DroppedStampImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
