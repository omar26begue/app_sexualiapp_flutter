// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseAPIModel _$ResponseAPIModelFromJson(Map<String, dynamic> json) {
  return ResponseAPIModel(
    code: json['code'] as int,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ResponseAPIModelToJson(ResponseAPIModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
