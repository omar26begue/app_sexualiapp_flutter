// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponsePerfilModel _$ResponsePerfilModelFromJson(Map<String, dynamic> json) {
  return ResponsePerfilModel(
    image: json['image'] as String,
    identifier: json['identifier'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    sexual_orientation: json['sexual_orientation'] as String,
    sex: json['sex'] as String,
    id_religion: json['id_religion'] as String,
    age: json['age'] as int,
    coins: json['coins'] as int,
    name_religion: json['name_religion'] as String,
    name_sexual_orientation: json['name_sexual_orientation'] as String,
  );
}

Map<String, dynamic> _$ResponsePerfilModelToJson(
        ResponsePerfilModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'name': instance.name,
      'email': instance.email,
      'sex': instance.sex,
      'id_religion': instance.id_religion,
      'name_religion': instance.name_religion,
      'sexual_orientation': instance.sexual_orientation,
      'name_sexual_orientation': instance.name_sexual_orientation,
      'image': instance.image,
      'age': instance.age,
      'coins': instance.coins,
    };
