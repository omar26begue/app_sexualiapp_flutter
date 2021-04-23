import 'package:json_annotation/json_annotation.dart';

part 'articles_response.g.dart';

@JsonSerializable()
class ResponseArticlesModel {
  // ignore: non_constant_identifier_names
  String identifier, title, category, image_article, image_sub_title, sub_title, text;

  // ignore: non_constant_identifier_names
  DateTime date_article;

  // ignore: non_constant_identifier_names
  ResponseArticlesModel({
    this.identifier,
    this.category,
    this.title,
    this.date_article,
    this.image_article,
    this.image_sub_title,
    this.sub_title,
    this.text,
  });

  factory ResponseArticlesModel.fromJson(Map<String, dynamic> json) => _$ResponseArticlesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseArticlesModelToJson(this);
}
