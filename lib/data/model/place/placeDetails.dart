// To parse this JSON data, do
//
//     final placeDetailsModel = placeDetailsModelFromJson(jsonString);

import 'dart:convert';

PlaceDetailsModel placeDetailsModelFromJson(var str) => PlaceDetailsModel.fromJson(str);

String placeDetailsModelToJson(PlaceDetailsModel data) => json.encode(data.toJson());

class PlaceDetailsModel {
  PlaceDetailsModel({
    this.id,
    this.name,
    this.address,
    this.latitude,
    this.longitude,
    this.description,
    this.capacity,
    this.logoUrl,
    this.bannerUrl,
    this.state,
    this.contracts,
    this.categories,
    this.featured,
  });

  int? id;
  String? name;
  String? address;
  dynamic? latitude;
  dynamic? longitude;
  String? description;
  int? capacity;
  String? logoUrl;
  String? bannerUrl;
  int? state;
  String? contracts;
  String? categories;
  bool? featured;

  factory PlaceDetailsModel.fromJson(Map<String, dynamic> json) => PlaceDetailsModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        address: json["address"] == null ? null : json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        description: json["description"] == null ? null : json["description"],
        capacity: json["capacity"] == null ? null : json["capacity"],
        logoUrl: json["logoUrl"] == null ? null : json["logoUrl"],
        bannerUrl: json["bannerUrl"] == null ? null : json["bannerUrl"],
        state: json["state"] == null ? null : json["state"],
        contracts: json["contracts"] == null ? null : json["contracts"],
        categories: json["categories"] == null ? null : json["categories"],
        featured: json["featured"] == null ? null : json["featured"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "address": address == null ? null : address,
        "latitude": latitude,
        "longitude": longitude,
        "description": description == null ? null : description,
        "capacity": capacity == null ? null : capacity,
        "logoUrl": logoUrl == null ? null : logoUrl,
        "bannerUrl": bannerUrl == null ? null : bannerUrl,
        "state": state == null ? null : state,
        "contracts": contracts == null ? null : contracts,
        "categories": categories == null ? null : categories,
        "featured": featured == null ? null : featured,
      };
}
