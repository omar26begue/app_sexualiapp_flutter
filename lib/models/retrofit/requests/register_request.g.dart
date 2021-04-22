// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestRegisterModel _$RequestRegisterModelFromJson(Map<String, dynamic> json) {
  return RequestRegisterModel(
    name: json['name'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    age: json['age'] as int,
    id_religion: json['id_religion'] as String,
    sex: json['sex'] as String,
    sexual_orientation: json['sexual_orientation'] as String,
  );
}

Map<String, dynamic> _$RequestRegisterModelToJson(
        RequestRegisterModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'sex': instance.sex,
      'id_religion': instance.id_religion,
      'sexual_orientation': instance.sexual_orientation,
      'age': instance.age,
    };
