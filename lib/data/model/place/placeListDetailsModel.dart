// To parse this JSON data, do
//
//     final placeDetailsModel = placeDetailsModelFromJson(jsonString);

import 'dart:convert';

ListPlaceDetailsModel listplaceDetailsModelFromJson(var str) => ListPlaceDetailsModel.fromJson(str);

String placeDetailsModelToJson(ListPlaceDetailsModel data) => json.encode(data.toJson());

class ListPlaceDetailsModel {
  ListPlaceDetailsModel({
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
    this.urlImageConverter,
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
  String? urlImageConverter;

  factory ListPlaceDetailsModel.fromJson(Map<String, dynamic> json) => ListPlaceDetailsModel(
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
      };
}
