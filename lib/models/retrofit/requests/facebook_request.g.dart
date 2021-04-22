// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facebook_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestFacebookModel _$RequestFacebookModelFromJson(Map<String, dynamic> json) {
  return RequestFacebookModel(
    token: json['token'] as String,
    email: json['email'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$RequestFacebookModelToJson(
        RequestFacebookModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'token': instance.token,
    };
