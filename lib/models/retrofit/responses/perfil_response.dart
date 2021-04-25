import 'package:json_annotation/json_annotation.dart';

part 'perfil_response.g.dart';

@JsonSerializable()
class ResponsePerfilModel {
  // ignore: non_constant_identifier_names
  String identifier, name, email, sex, id_religion, name_religion, sexual_orientation, name_sexual_orientation, image;
  int age, coins;

  ResponsePerfilModel({
    this.image,
    this.identifier,
    this.name,
    this.email,
    // ignore: non_constant_identifier_names
    this.sexual_orientation,
    this.sex,
    // ignore: non_constant_identifier_names
    this.id_religion,
    this.age,
    this.coins,
    // ignore: non_constant_identifier_names
    this.name_religion,
    // ignore: non_constant_identifier_names
    this.name_sexual_orientation,
  });

  factory ResponsePerfilModel.fromJson(Map<String, dynamic> json) => _$ResponsePerfilModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponsePerfilModelToJson(this);
}
