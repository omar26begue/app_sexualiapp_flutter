// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatsModel _$ChatsModelFromJson(Map<String, dynamic> json) {
  return ChatsModel(
    data: json['data'] as String,
    from: json['from'] as String,
    to: json['to'] as String,
  );
}

Map<String, dynamic> _$ChatsModelToJson(ChatsModel instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'data': instance.data,
    };
