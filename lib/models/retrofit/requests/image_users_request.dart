import 'package:json_annotation/json_annotation.dart';

part 'image_users_request.g.dart';

@JsonSerializable()
class RequestImageUsersModel {
  String identifier, image;

  RequestImageUsersModel({this.image, this.identifier});

  factory RequestImageUsersModel.fromJson(Map<String, dynamic> json) => _$RequestImageUsersModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestImageUsersModelToJson(this);
}