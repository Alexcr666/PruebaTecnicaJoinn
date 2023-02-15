// To parse this JSON data, do
//
//     final eventsListCategoriesModel = eventsListCategoriesModelFromJson(jsonString);

import 'dart:convert';

EventsListCategoriesModel eventsListCategoriesModelFromJson(var str) => EventsListCategoriesModel.fromJson(str);

String eventsListCategoriesModelToJson(EventsListCategoriesModel data) => json.encode(data.toJson());

class EventsListCategoriesModel {
  EventsListCategoriesModel({
    this.totalRecords,
    this.page,
  });

  int? totalRecords;
  List<PageEventCategorie>? page;

  factory EventsListCategoriesModel.fromJson(Map<String, dynamic> json) => EventsListCategoriesModel(
        totalRecords: json["totalRecords"] == null ? null : json["totalRecords"],
        page: json["page"] == null ? null : List<PageEventCategorie>.from(json["page"].map((x) => PageEventCategorie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalRecords": totalRecords == null ? null : totalRecords,
        "page": page == null ? null : List<dynamic>.from(page!.map((x) => x.toJson())),
      };
}

class PageEventCategorie {
  PageEventCategorie(
      {this.id,
      this.name,
      this.dateTimeEvent,
      this.allowExtraCapacity,
      this.featured,
      this.description,
      this.placeId,
      this.placeName,
      this.logoUrl,
      this.bannerUrl,
      this.state,
      this.categories,
      this.totalLikes,
      this.urlConverterBanner,
      this.urlConverterLogo,
      this.price});

  int? id;
  String? name;
  DateTime? dateTimeEvent;
  bool? allowExtraCapacity;
  bool? featured;
  String? description;
  int? placeId;
  String? placeName;
  String? logoUrl;
  String? bannerUrl;
  int? state;
  String? categories;
  int? totalLikes;
  String? urlConverterBanner;
  String? urlConverterLogo;
  String? price;

  factory PageEventCategorie.fromJson(Map<String, dynamic> json) => PageEventCategorie(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        dateTimeEvent: json["dateTimeEvent"] == null ? null : DateTime.parse(json["dateTimeEvent"]),
        allowExtraCapacity: json["allowExtraCapacity"] == null ? null : json["allowExtraCapacity"],
        featured: json["featured"] == null ? null : json["featured"],
        description: json["description"] == null ? null : json["description"],
        placeId: json["placeID"] == null ? null : json["placeID"],
        placeName: json["placeName"] == null ? null : json["placeName"],
        logoUrl: json["logoUrl"] == null ? null : json["logoUrl"],
        bannerUrl: json["bannerUrl"] == null ? null : json["bannerUrl"],
        state: json["state"] == null ? null : json["state"],
        categories: json["categories"] == null ? null : json["categories"],
        totalLikes: json["totalLikes"] == null ? null : json["totalLikes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "dateTimeEvent": dateTimeEvent == null ? null : dateTimeEvent?.toIso8601String(),
        "allowExtraCapacity": allowExtraCapacity == null ? null : allowExtraCapacity,
        "featured": featured == null ? null : featured,
        "description": description == null ? null : description,
        "placeID": placeId == null ? null : placeId,
        "placeName": placeName == null ? null : placeName,
        "logoUrl": logoUrl == null ? null : logoUrl,
        "bannerUrl": bannerUrl == null ? null : bannerUrl,
        "state": state == null ? null : state,
        "categories": categories == null ? null : categories,
        "totalLikes": totalLikes == null ? null : totalLikes,
      };
}
