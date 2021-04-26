// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineModel _$OnlineModelFromJson(Map<String, dynamic> json) {
  return OnlineModel(
    time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
    identifier: json['identifier'] as String,
    uuid: json['uuid'] as String,
  );
}

Map<String, dynamic> _$OnlineModelToJson(OnlineModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'uuid': instance.uuid,
      'time': instance.time?.toIso8601String(),
    };
