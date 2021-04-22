import 'package:json_annotation/json_annotation.dart';

part 'religion_response.g.dart';

@JsonSerializable()
class ResponseReligionModel {
  String identifier, name;

  ResponseReligionModel({this.name, this.identifier});

  factory ResponseReligionModel.fromJson(Map<String, dynamic> json) => _$ResponseReligionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseReligionModelToJson(this);
}