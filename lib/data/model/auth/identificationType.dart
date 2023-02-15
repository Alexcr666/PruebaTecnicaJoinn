// To parse this JSON data, do
//
//     final identificationListModel = identificationListModelFromJson(jsonString);

import 'dart:convert';

List<IdentificationListModel> identificationListModelFromJson(var str) =>
    List<IdentificationListModel>.from(str.map((x) => IdentificationListModel.fromJson(x)));

String identificationListModelToJson(List<IdentificationListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IdentificationListModel {
  IdentificationListModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory IdentificationListModel.fromJson(Map<String, dynamic> json) => IdentificationListModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
