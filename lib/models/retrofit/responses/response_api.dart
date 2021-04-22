import 'package:json_annotation/json_annotation.dart';

part 'response_api.g.dart';

@JsonSerializable()
class ResponseAPIModel {
  int code;
  String message;

  ResponseAPIModel({this.code, this.message});

  factory ResponseAPIModel.fromJson(Map<String, dynamic> json) => _$ResponseAPIModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseAPIModelToJson(this);
}