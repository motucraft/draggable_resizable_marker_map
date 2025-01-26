// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dropped_stamp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DroppedStampImpl _$$DroppedStampImplFromJson(Map<String, dynamic> json) =>
    _$DroppedStampImpl(
      id: json['id'] as String,
      stampCategory: $enumDecode(_$StampCategoryEnumMap, json['stampCategory']),
      latLng: LatLng.fromJson(json['latLng'] as Map<String, dynamic>),
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      start: json['start'] == null
          ? null
          : LatLng.fromJson(json['start'] as Map<String, dynamic>),
      end: json['end'] == null
          ? null
          : LatLng.fromJson(json['end'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DroppedStampImplToJson(_$DroppedStampImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stampCategory': _$StampCategoryEnumMap[instance.stampCategory]!,
      'latLng': instance.latLng,
      'width': instance.width,
      'height': instance.height,
      'start': instance.start,
      'end': instance.end,
    };

const _$StampCategoryEnumMap = {
  StampCategory.login: 'login',
  StampCategory.exit: 'exit',
  StampCategory.info: 'info',
  StampCategory.wc: 'wc',
  StampCategory.danger: 'danger',
  StampCategory.localParking: 'localParking',
  StampCategory.smokingArea: 'smokingArea',
  StampCategory.busStop: 'busStop',
  StampCategory.help: 'help',
  StampCategory.store: 'store',
  StampCategory.arrow: 'arrow',
};
