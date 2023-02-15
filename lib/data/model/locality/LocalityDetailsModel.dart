// To parse this JSON data, do
//
//     final localityDetailsModel = localityDetailsModelFromJson(jsonString);

import 'dart:convert';

LocalityDetailsModel localityDetailsModelFromJson(var str) => LocalityDetailsModel.fromJson(str);

String localityDetailsModelToJson(LocalityDetailsModel data) => json.encode(data.toJson());

class LocalityDetailsModel {
  LocalityDetailsModel({
    this.id,
    this.name,
    this.capacity,
    this.price,
    this.imageUrl,
    this.description,
    this.eventId,
    this.eventName,
  });

  int? id;
  String? name;
  int? capacity;
  int? price;
  String? imageUrl;
  String? description;
  int? eventId;
  String? eventName;

  factory LocalityDetailsModel.fromJson(Map<String, dynamic> json) => LocalityDetailsModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        capacity: json["capacity"] == null ? null : json["capacity"],
        price: json["price"] == null ? null : json["price"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        description: json["description"] == null ? null : json["description"],
        eventId: json["eventID"] == null ? null : json["eventID"],
        eventName: json["eventName"] == null ? null : json["eventName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "capacity": capacity == null ? null : capacity,
        "price": price == null ? null : price,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "description": description == null ? null : description,
        "eventID": eventId == null ? null : eventId,
        "eventName": eventName == null ? null : eventName,
      };
}
