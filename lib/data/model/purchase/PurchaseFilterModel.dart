// To parse this JSON data, do
//
//     final purchaseFiltersModel = purchaseFiltersModelFromJson(jsonString);

import 'dart:convert';

List<PurchaseFiltersModel> purchaseFiltersModelFromJson(var str) =>
    List<PurchaseFiltersModel>.from(str.map((x) => PurchaseFiltersModel.fromJson(x)));

String purchaseFiltersModelToJson(List<PurchaseFiltersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PurchaseFiltersModel {
  PurchaseFiltersModel({
    this.eventId,
    this.eventName,
    this.eventLogoUrl,
    this.placeId,
    this.placeName,
    this.placeLogo,
    this.placeBanner,
    this.datetimeEvent,
    this.totalSold,
    this.placeCapacity,
    this.localities,
  });

  int? eventId;
  EventName? eventName;
  dynamic? eventLogoUrl;
  int? placeId;
  String? placeName;
  String? placeLogo;
  String? placeBanner;
  DateTime? datetimeEvent;
  int? totalSold;
  int? placeCapacity;
  List<Locality>? localities;

  factory PurchaseFiltersModel.fromJson(Map<String, dynamic> json) => PurchaseFiltersModel(
        eventId: json["eventID"],
        eventName: eventNameValues.map![json["eventName"]],
        eventLogoUrl: json["eventLogoUrl"],
        placeId: json["placeID"],
        placeName: json["placeName"],
        placeLogo: json["placeLogo"],
        placeBanner: json["placeBanner"],
        datetimeEvent: DateTime.parse(json["datetimeEvent"]),
        totalSold: json["totalSold"],
        placeCapacity: json["placeCapacity"],
        localities: List<Locality>.from(json["localities"].map((x) => Locality.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "eventID": eventId,
        "eventName": eventNameValues.reverse![eventName],
        "eventLogoUrl": eventLogoUrl,
        "placeID": placeId,
        "placeName": placeName,
        "placeLogo": placeLogo,
        "placeBanner": placeBanner,
        "datetimeEvent": datetimeEvent!.toIso8601String(),
        "totalSold": totalSold,
        "placeCapacity": placeCapacity,
        "localities": List<dynamic>.from(localities!.map((x) => x.toJson())),
      };
}

enum EventName { EVENTO1_ROSE, EVENT_1, DJ_RADY_EVENT }

final eventNameValues =
    EnumValues({"DJ Rady Event": EventName.DJ_RADY_EVENT, "Evento1_Rose": EventName.EVENTO1_ROSE, "Event 1": EventName.EVENT_1});

class Locality {
  Locality({
    this.id,
    this.eventId,
    this.name,
    this.capacity,
    this.totalSold,
    this.tikets,
  });

  int? id;
  int? eventId;
  Name? name;
  int? capacity;
  int? totalSold;
  List<Tiket>? tikets;

  factory Locality.fromJson(Map<String, dynamic> json) => Locality(
        id: json["id"],
        eventId: json["eventID"],
        name: nameValues.map![json["name"]],
        capacity: json["capacity"],
        totalSold: json["totalSold"],
        tikets: List<Tiket>.from(json["tikets"].map((x) => Tiket.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "eventID": eventId,
        "name": nameValues.reverse![name],
        "capacity": capacity,
        "totalSold": totalSold,
        "tikets": List<dynamic>.from(tikets!.map((x) => x.toJson())),
      };
}

enum Name { LOCALI_ROSE1, SVFV, LOCALIDAD_101, LOCALIDAD_2, LOCALIDAD_3, LOCALITY_SHOW }

final nameValues = EnumValues({
  "Localidad 101": Name.LOCALIDAD_101,
  "Localidad 2": Name.LOCALIDAD_2,
  "Localidad 3": Name.LOCALIDAD_3,
  "Locality show": Name.LOCALITY_SHOW,
  "Locali_Rose1": Name.LOCALI_ROSE1,
  "SVFV": Name.SVFV
});

class Tiket {
  Tiket({
    this.id,
    this.userId,
    this.eventId,
    this.eventName,
    this.dateTimeEvent,
    this.localityId,
    this.localityName,
    this.position,
    this.hash,
  });

  int? id;
  int? userId;
  int? eventId;
  EventName? eventName;
  DateTime? dateTimeEvent;
  int? localityId;
  Name? localityName;
  int? position;
  String? hash;

  factory Tiket.fromJson(Map<String, dynamic> json) => Tiket(
        id: json["id"],
        userId: json["userID"],
        eventId: json["eventID"],
        eventName: eventNameValues.map![json["eventName"]],
        dateTimeEvent: DateTime.parse(json["dateTimeEvent"]),
        localityId: json["localityID"],
        localityName: nameValues.map![json["localityName"]],
        position: json["position"],
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userID": userId,
        "eventID": eventId,
        "eventName": eventNameValues.reverse![eventName],
        "dateTimeEvent": dateTimeEvent!.toIso8601String(),
        "localityID": localityId,
        "localityName": nameValues.reverse![localityName],
        "position": position,
        "hash": hash,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
