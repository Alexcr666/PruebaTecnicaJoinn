// To parse this JSON data, do
//
//     final placeContractDashboardModel = placeContractDashboardModelFromJson(jsonString);

import 'dart:convert';

PlaceContractDashboardModel placeContractDashboardModelFromJson(var str) => PlaceContractDashboardModel.fromJson(str);

String placeContractDashboardModelToJson(PlaceContractDashboardModel data) => json.encode(data.toJson());

class PlaceContractDashboardModel {
  PlaceContractDashboardModel({
    this.totalRecords,
    this.page,
  });

  int? totalRecords;
  List<PagePlaceContracts>? page;

  factory PlaceContractDashboardModel.fromJson(Map<String, dynamic> json) => PlaceContractDashboardModel(
        totalRecords: json["totalRecords"] == null ? null : json["totalRecords"],
        page: json["page"] == null ? null : List<PagePlaceContracts>.from(json["page"].map((x) => PagePlaceContracts.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalRecords": totalRecords == null ? null : totalRecords,
        "page": page == null ? null : List<dynamic>.from(page!.map((x) => x.toJson())),
      };
}

class PagePlaceContracts {
  PagePlaceContracts({
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

  factory PagePlaceContracts.fromJson(Map<String, dynamic> json) => PagePlaceContracts(
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
