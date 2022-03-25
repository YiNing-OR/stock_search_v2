// To parse this JSON data, do
//
//     final queryModel = queryModelFromJson(jsonString);

import 'dart:convert';

Map<String, QueryModel> queryModelFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, QueryModel>(k, QueryModel.fromJson(v)));

String queryModelToJson(Map<String, QueryModel> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class QueryModel {
  QueryModel({
    this.author,
    this.datePublished,
    this.keyPoints,
    this.stocksMentioned,
    this.title,
  });

  List<String> author;
  List<String> datePublished;
  List<String> keyPoints;
  List<String> stocksMentioned;
  List<String> title;

  factory QueryModel.fromJson(Map<String, dynamic> json) => QueryModel(
    author: List<String>.from(json["author"].map((x) => x)),
    datePublished: List<String>.from(json["date_published"].map((x) => x)),
    keyPoints: List<String>.from(json["key_points"].map((x) => x)),
    stocksMentioned: List<String>.from(json["stocks_mentioned"].map((x) => x)),
    title: List<String>.from(json["title"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "author": List<dynamic>.from(author.map((x) => x)),
    "date_published": List<dynamic>.from(datePublished.map((x) => x)),
    "key_points": List<dynamic>.from(keyPoints.map((x) => x)),
    "stocks_mentioned": List<dynamic>.from(stocksMentioned.map((x) => x)),
    "title": List<dynamic>.from(title.map((x) => x)),
  };
}
