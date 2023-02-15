// To parse this JSON data, do
//
//     final placeListModel = placeListModelFromJson(jsonString);

import 'dart:convert';

PlaceListModel placeListModelFromJson(String str) => PlaceListModel.fromJson(json.decode(str));

String placeListModelToJson(PlaceListModel data) => json.encode(data.toJson());

class PlaceListModel {
  PlaceListModel({
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
    this.logo,
    this.banner,
  });

  int? id;
  String? name;
  String? address;
  int? latitude;
  int? longitude;
  String? description;
  int? capacity;
  String? logoUrl;
  String? bannerUrl;
  int? state;
  List<int>? contracts;
  List<int>? categories;
  String? logo;
  String? banner;

  factory PlaceListModel.fromJson(Map<String, dynamic> json) => PlaceListModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        address: json["address"] == null ? null : json["address"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        description: json["description"] == null ? null : json["description"],
        capacity: json["capacity"] == null ? null : json["capacity"],
        logoUrl: json["logoUrl"] == null ? null : json["logoUrl"],
        bannerUrl: json["bannerUrl"] == null ? null : json["bannerUrl"],
        state: json["state"] == null ? null : json["state"],
        contracts: json["contracts"] == null ? null : List<int>.from(json["contracts"].map((x) => x)),
        categories: json["categories"] == null ? null : List<int>.from(json["categories"].map((x) => x)),
        logo: json["logo"] == null ? null : json["logo"],
        banner: json["banner"] == null ? null : json["banner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "address": address == null ? null : address,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "description": description == null ? null : description,
        "capacity": capacity == null ? null : capacity,
        "logoUrl": logoUrl == null ? null : logoUrl,
        "bannerUrl": bannerUrl == null ? null : bannerUrl,
        "state": state == null ? null : state,
        "contracts": contracts == null ? null : List<dynamic>.from(contracts!.map((x) => x)),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x)),
        "logo": logo == null ? null : logo,
        "banner": banner == null ? null : banner,
      };
}
