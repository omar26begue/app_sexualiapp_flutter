import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RequestRegisterModel {
  // ignore: non_constant_identifier_names
  String name, email, password, sex, id_religion, sexual_orientation;
  int age;

  // ignore: non_constant_identifier_names
  RequestRegisterModel({this.name, this.email, this.password, this.age, this.id_religion, this.sex, this.sexual_orientation});

  factory RequestRegisterModel.fromJson(Map<String, dynamic> json) => _$RequestRegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestRegisterModelToJson(this);
}