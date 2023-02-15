// To parse this JSON data, do
//
//     final eventDetailsModel = eventDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:dj_mania/data/model/place/placeDetails.dart';

ListEventDetailsModel listeventDetailsModelFromJson(var str) => ListEventDetailsModel.fromJson(str);

String eventDetailsModelToJson(ListEventDetailsModel data) => json.encode(data.toJson());

class ListEventDetailsModel {
  ListEventDetailsModel(
      {this.id,
      this.name,
      this.dateTimeEvent,
      this.allowExtraCapacity,
      this.description,
      this.placeId,
      this.logoUrl,
      this.bannerUrl,
      this.state,
      this.categories,
      this.urlImageConverter,
      this.placeDetailsModel,
      this.price,
      this.featured});

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
  String? urlImageConverter;
  PlaceDetailsModel? placeDetailsModel;
  String? price;
  bool? featured;

  factory ListEventDetailsModel.fromJson(Map<String, dynamic> json) => ListEventDetailsModel(
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
        featured: json["featured"] == null ? null : json["featured"],
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
        "featured": featured == null ? null : featured
      };
}
