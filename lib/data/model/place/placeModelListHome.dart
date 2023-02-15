// To parse this JSON data, do
//
//     final placeListModel = placeListModelFromJson(jsonString);

import 'dart:convert';

List<PlaceListModel> placeListModelFromJson(var str) => List<PlaceListModel>.from(str.map((x) => PlaceListModel.fromJson(x)));

String placeListModelToJson(List<PlaceListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlaceListModel {
  PlaceListModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory PlaceListModel.fromJson(Map<String, dynamic> json) => PlaceListModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
