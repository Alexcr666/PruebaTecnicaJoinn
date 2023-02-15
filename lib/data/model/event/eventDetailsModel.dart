// To parse this JSON data, do
//
//     final eventDetailsModel = eventDetailsModelFromJson(jsonString);

import 'dart:convert';

EventDetailsModel eventDetailsModelFromJson(var str) => EventDetailsModel.fromJson(str);

String eventDetailsModelToJson(EventDetailsModel data) => json.encode(data.toJson());

class EventDetailsModel {
  EventDetailsModel({
    this.id,
    this.name,
    this.dateTimeEvent,
    this.allowExtraCapacity,
    this.description,
    this.placeId,
    this.logoUrl,
    this.bannerUrl,
    this.state,
    this.categories,
  });

  int? id;
  String? name;
  DateTime? dateTimeEvent;
  bool? allowExtraCapacity;
  dynamic? description;
  int? placeId;
  dynamic? logoUrl;
  dynamic? bannerUrl;
  int? state;
  String? categories;

  factory EventDetailsModel.fromJson(Map<String, dynamic> json) => EventDetailsModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        dateTimeEvent: json["dateTimeEvent"] == null ? null : DateTime.parse(json["dateTimeEvent"]),
        allowExtraCapacity: json["allowExtraCapacity"] == null ? null : json["allowExtraCapacity"],
        description: json["description"],
        placeId: json["placeID"] == null ? null : json["placeID"],
        logoUrl: json["logoUrl"],
        bannerUrl: json["bannerUrl"],
        state: json["state"] == null ? null : json["state"],
        categories: json["categories"] == null ? null : json["categories"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "dateTimeEvent": dateTimeEvent == null ? null : dateTimeEvent?.toIso8601String(),
        "allowExtraCapacity": allowExtraCapacity == null ? null : allowExtraCapacity,
        "description": description,
        "placeID": placeId == null ? null : placeId,
        "logoUrl": logoUrl,
        "bannerUrl": bannerUrl,
        "state": state == null ? null : state,
        "categories": categories == null ? null : categories,
      };
}
