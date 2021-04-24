import 'package:json_annotation/json_annotation.dart';

part 'articles_response.g.dart';

@JsonSerializable()
class ResponseArticlesModel {
  // ignore: non_constant_identifier_names
  String identifier, title, category, image_article, image_sub_title, sub_title, text_article, doctor_article;

  // ignore: non_constant_identifier_names
  DateTime date_article;

  // ignore: non_constant_identifier_names
  ResponseArticlesModel({
    this.identifier,
    this.category,
    this.title,
    // ignore: non_constant_identifier_names
    this.date_article,
    // ignore: non_constant_identifier_names
    this.image_article,
    // ignore: non_constant_identifier_names
    this.image_sub_title,
    // ignore: non_constant_identifier_names
    this.sub_title,
    // ignore: non_constant_identifier_names
    this.text_article,
    // ignore: non_constant_identifier_names
    this.doctor_article,
  });

  factory ResponseArticlesModel.fromJson(Map<String, dynamic> json) => _$ResponseArticlesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseArticlesModelToJson(this);
}
