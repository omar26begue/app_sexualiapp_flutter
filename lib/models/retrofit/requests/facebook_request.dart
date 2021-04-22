import 'package:json_annotation/json_annotation.dart';

part 'facebook_request.g.dart';

@JsonSerializable()
class RequestFacebookModel {
  String email, name, token;

  RequestFacebookModel({this.token, this.email, this.name});

  factory RequestFacebookModel.fromJson(Map<String, dynamic> json) => _$RequestFacebookModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestFacebookModelToJson(this);
}