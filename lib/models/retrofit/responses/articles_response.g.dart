// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseArticlesModel _$ResponseArticlesModelFromJson(
    Map<String, dynamic> json) {
  return ResponseArticlesModel(
    identifier: json['identifier'] as String,
    category: json['category'] as String,
    title: json['title'] as String,
    date_article: json['date_article'] == null
        ? null
        : DateTime.parse(json['date_article'] as String),
    image_article: json['image_article'] as String,
    image_sub_title: json['image_sub_title'] as String,
    sub_title: json['sub_title'] as String,
    text_article: json['text_article'] as String,
    doctor_article: json['doctor_article'] as String,
  );
}

Map<String, dynamic> _$ResponseArticlesModelToJson(
        ResponseArticlesModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'title': instance.title,
      'category': instance.category,
      'image_article': instance.image_article,
      'image_sub_title': instance.image_sub_title,
      'sub_title': instance.sub_title,
      'text_article': instance.text_article,
      'doctor_article': instance.doctor_article,
      'date_article': instance.date_article?.toIso8601String(),
    };
