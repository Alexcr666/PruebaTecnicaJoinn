// To parse this JSON data, do
//
//     final listCategoriesModel = listCategoriesModelFromJson(jsonString);

import 'dart:convert';

List<ListCategoriesModel> listCategoriesModelFromJson(var str) =>
    List<ListCategoriesModel>.from(str.map((x) => ListCategoriesModel.fromJson(x)));

String listCategoriesModelToJson(List<ListCategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListCategoriesModel {
  ListCategoriesModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory ListCategoriesModel.fromJson(Map<String, dynamic> json) => ListCategoriesModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
