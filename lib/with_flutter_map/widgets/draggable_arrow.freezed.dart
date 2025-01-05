// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draggable_arrow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ArrowPosition {
  Point<double> get start => throw _privateConstructorUsedError;
  Point<double> get end => throw _privateConstructorUsedError;

  /// Create a copy of ArrowPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArrowPositionCopyWith<ArrowPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArrowPositionCopyWith<$Res> {
  factory $ArrowPositionCopyWith(
          ArrowPosition value, $Res Function(ArrowPosition) then) =
      _$ArrowPositionCopyWithImpl<$Res, ArrowPosition>;
  @useResult
  $Res call({Point<double> start, Point<double> end});
}

/// @nodoc
class _$ArrowPositionCopyWithImpl<$Res, $Val extends ArrowPosition>
    implements $ArrowPositionCopyWith<$Res> {
  _$ArrowPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArrowPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Point<double>,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as Point<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArrowPositionImplCopyWith<$Res>
    implements $ArrowPositionCopyWith<$Res> {
  factory _$$ArrowPositionImplCopyWith(
          _$ArrowPositionImpl value, $Res Function(_$ArrowPositionImpl) then) =
      __$$ArrowPositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Point<double> start, Point<double> end});
}

/// @nodoc
class __$$ArrowPositionImplCopyWithImpl<$Res>
    extends _$ArrowPositionCopyWithImpl<$Res, _$ArrowPositionImpl>
    implements _$$ArrowPositionImplCopyWith<$Res> {
  __$$ArrowPositionImplCopyWithImpl(
      _$ArrowPositionImpl _value, $Res Function(_$ArrowPositionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArrowPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$ArrowPositionImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Point<double>,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as Point<double>,
    ));
  }
}

/// @nodoc

class _$ArrowPositionImpl implements _ArrowPosition {
  const _$ArrowPositionImpl({required this.start, required this.end});

  @override
  final Point<double> start;
  @override
  final Point<double> end;

  @override
  String toString() {
    return 'ArrowPosition(start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArrowPositionImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  /// Create a copy of ArrowPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArrowPositionImplCopyWith<_$ArrowPositionImpl> get copyWith =>
      __$$ArrowPositionImplCopyWithImpl<_$ArrowPositionImpl>(this, _$identity);
}

abstract class _ArrowPosition implements ArrowPosition {
  const factory _ArrowPosition(
      {required final Point<double> start,
      required final Point<double> end}) = _$ArrowPositionImpl;

  @override
  Point<double> get start;
  @override
  Point<double> get end;

  /// Create a copy of ArrowPosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArrowPositionImplCopyWith<_$ArrowPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
