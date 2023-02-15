// To parse this JSON data, do
//
//     final placeListCategoriesModel = placeListCategoriesModelFromJson(jsonString);

import 'dart:convert';

PlaceListCategoriesModel placeListCategoriesModelFromJson(var str) => PlaceListCategoriesModel.fromJson(str);

String placeListCategoriesModelToJson(PlaceListCategoriesModel data) => json.encode(data.toJson());

class PlaceListCategoriesModel {
  PlaceListCategoriesModel({
    this.totalRecords,
    this.page,
  });

  int? totalRecords;
  List<PagePlaceCategorie>? page;

  factory PlaceListCategoriesModel.fromJson(Map<String, dynamic> json) => PlaceListCategoriesModel(
        totalRecords: json["totalRecords"] == null ? null : json["totalRecords"],
        page: json["page"] == null ? null : List<PagePlaceCategorie>.from(json["page"].map((x) => PagePlaceCategorie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalRecords": totalRecords == null ? null : totalRecords,
        "page": page == null ? null : List<dynamic>.from(page!.map((x) => x.toJson())),
      };
}

class PagePlaceCategorie {
  PagePlaceCategorie({
    this.id,
    this.name,
    this.address,
    this.latitude,
    this.longitude,
    this.zoom,
    this.description,
    this.capacity,
    this.logoUrl,
    this.bannerUrl,
    this.state,
    this.contracts,
    this.categories,
    this.price,
  });

  int? id;
  String? name;
  String? address;
  double? latitude;
  double? longitude;
  int? zoom;
  String? description;
  int? capacity;
  String? logoUrl;
  String? bannerUrl;
  int? state;
  String? contracts;
  String? categories;
  String? urlConverterBanner;
  String? urlConverterLogo;
  String? price;

  factory PagePlaceCategorie.fromJson(Map<String, dynamic> json) => PagePlaceCategorie(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        address: json["address"] == null ? null : json["address"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
        zoom: json["zoom"] == null ? null : json["zoom"],
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
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "zoom": zoom == null ? null : zoom,
        "description": description == null ? null : description,
        "capacity": capacity == null ? null : capacity,
        "logoUrl": logoUrl == null ? null : logoUrl,
        "bannerUrl": bannerUrl == null ? null : bannerUrl,
        "state": state == null ? null : state,
        "contracts": contracts == null ? null : contracts,
        "categories": categories == null ? null : categories,
      };
}
