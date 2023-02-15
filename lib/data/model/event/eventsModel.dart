// To parse this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

import 'dart:convert';

EventsModel eventsModelFromJson(var str) => EventsModel.fromJson(str);

String eventsModelToJson(EventsModel data) => json.encode(data.toJson());

class EventsModel {
  EventsModel({
    required this.id,
    required this.name,
    required this.type,
    this.description,
  });

  int id;
  String name;
  int type;
  dynamic description;

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "description": description,
      };
}
