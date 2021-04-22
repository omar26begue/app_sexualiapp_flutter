// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseLoginModel _$ResponseLoginModelFromJson(Map<String, dynamic> json) {
  return ResponseLoginModel(
    identifier: json['identifier'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$ResponseLoginModelToJson(ResponseLoginModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'token': instance.token,
    };
