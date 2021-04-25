// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_users_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestImageUsersModel _$RequestImageUsersModelFromJson(
    Map<String, dynamic> json) {
  return RequestImageUsersModel(
    image: json['image'] as String,
    identifier: json['identifier'] as String,
  );
}

Map<String, dynamic> _$RequestImageUsersModelToJson(
        RequestImageUsersModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'image': instance.image,
    };
