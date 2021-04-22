// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'religion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseReligionModel _$ResponseReligionModelFromJson(
    Map<String, dynamic> json) {
  return ResponseReligionModel(
    name: json['name'] as String,
    identifier: json['identifier'] as String,
  );
}

Map<String, dynamic> _$ResponseReligionModelToJson(
        ResponseReligionModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'name': instance.name,
    };
