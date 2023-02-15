// To parse this JSON data, do
//
//     final eventListHomeModel = eventListHomeModelFromJson(jsonString);

import 'dart:convert';

List<EventListHomeModel> eventListHomeModelFromJson(var str) =>
    List<EventListHomeModel>.from(str.map((x) => EventListHomeModel.fromJson(x)));

String eventListHomeModelToJson(List<EventListHomeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventListHomeModel {
  EventListHomeModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory EventListHomeModel.fromJson(Map<String, dynamic> json) => EventListHomeModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
