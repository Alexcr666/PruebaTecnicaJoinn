// To parse this JSON data, do
//
//     final localityPaginateDetailsModel = localityPaginateDetailsModelFromJson(jsonString);

import 'dart:convert';

LocalityPaginateDetailsModel localityPaginateDetailsModelFromJson(var str) => LocalityPaginateDetailsModel.fromJson(str);

String localityPaginateDetailsModelToJson(LocalityPaginateDetailsModel data) => json.encode(data.toJson());

class LocalityPaginateDetailsModel {
  LocalityPaginateDetailsModel({
    this.totalRecords,
    this.page,
  });

  int? totalRecords;
  List<Page>? page;

  factory LocalityPaginateDetailsModel.fromJson(Map<String, dynamic> json) => LocalityPaginateDetailsModel(
        totalRecords: json["totalRecords"] == null ? null : json["totalRecords"],
        page: json["page"] == null ? null : List<Page>.from(json["page"].map((x) => Page.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalRecords": totalRecords == null ? null : totalRecords,
        "page": page == null ? null : List<dynamic>.from(page!.map((x) => x.toJson())),
      };
}

class Page {
  Page({
    this.id,
    this.name,
    this.capacity,
    this.price,
    this.imageUrl,
    this.description,
    this.eventId,
    this.eventName,
    this.state,
  });

  int? id;
  String? name;
  int? capacity;
  int? price;
  String? imageUrl;
  String? description;
  int? eventId;
  String? eventName;
  int? state;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        capacity: json["capacity"] == null ? null : json["capacity"],
        price: json["price"] == null ? null : json["price"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        description: json["description"] == null ? null : json["description"],
        eventId: json["eventID"] == null ? null : json["eventID"],
        eventName: json["eventName"] == null ? null : json["eventName"],
        state: json["state"] == null ? null : json["state"],
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
        "state": state == null ? null : state,
      };
}
