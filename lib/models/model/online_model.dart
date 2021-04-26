import 'package:json_annotation/json_annotation.dart';

part 'online_model.g.dart';

@JsonSerializable()
class OnlineModel {
  String identifier, uuid;
  DateTime time;

  OnlineModel({this.time, this.identifier, this.uuid});

  factory OnlineModel.fromJson(Map<String, dynamic> json) => _$OnlineModelFromJson(json);

  Map<String, dynamic> toJson() => _$OnlineModelToJson(this);
}