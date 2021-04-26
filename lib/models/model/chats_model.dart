import 'package:json_annotation/json_annotation.dart';

part 'chats_model.g.dart';

@JsonSerializable()
class ChatsModel {
  String from, to, data;

  ChatsModel({this.data, this.from, this.to});

  factory ChatsModel.fromJson(Map<String, dynamic> json) => _$ChatsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatsModelToJson(this);
}