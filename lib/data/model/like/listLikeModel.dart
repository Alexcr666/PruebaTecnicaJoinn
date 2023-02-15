// To parse this JSON data, do
//
//     final listLikeEventsModel = listLikeEventsModelFromJson(jsonString);

import 'dart:convert';

List<ListLikeEventsModel> listLikeEventsModelFromJson(String str) =>
    List<ListLikeEventsModel>.from(json.decode(str).map((x) => ListLikeEventsModel.fromJson(x)));

String listLikeEventsModelToJson(List<ListLikeEventsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListLikeEventsModel {
  ListLikeEventsModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory ListLikeEventsModel.fromJson(Map<String, dynamic> json) => ListLikeEventsModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
