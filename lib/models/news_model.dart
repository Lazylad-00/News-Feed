// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<NewsModel> userFromJson(String str) =>
    List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String userToJson(List<NewsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  NewsModel({
    required this.dateLong,
    this.url,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.author,
    this.language,
    this.src,
    required this.summary,
    this.slug,
  });

  int dateLong;
  String? url;
  String title;
  String subTitle;
  String image;
  String author;
  String? language;
  String? src;
  String summary;
  String? slug;

  factory NewsModel.fromJson(Map<dynamic, dynamic> json) => NewsModel(
        dateLong: json["dateLong"],
        url: json["url"],
        title: json["title"],
        subTitle: json["sub_title"],
        image: json["image"],
        author: json["author"],
        language: json["language"],
        src: json["src"],
        summary: json["summary"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "dateLong": dateLong,
        "url": url,
        "title": title,
        "sub_title": subTitle,
        "image": image,
        "author": author,
        "language": language,
        "src": src,
        "summary": summary,
        "slug": slug,
      };
}
