import 'package:json_annotation/json_annotation.dart';

part 'orientation_sexual_response.g.dart';

@JsonSerializable()
class ResponseOrientationSexualModel {
  String identifier, name;

  ResponseOrientationSexualModel({this.name, this.identifier});

  factory ResponseOrientationSexualModel.fromJson(Map<String, dynamic> json) => _$ResponseOrientationSexualModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseOrientationSexualModelToJson(this);
}