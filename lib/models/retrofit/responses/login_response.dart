import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class ResponseLoginModel {
  String identifier, token, name, email;

  ResponseLoginModel({this.identifier, this.token, this.name, this.email});

  factory ResponseLoginModel.fromJson(Map<String, dynamic> json) => _$ResponseLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseLoginModelToJson(this);
}