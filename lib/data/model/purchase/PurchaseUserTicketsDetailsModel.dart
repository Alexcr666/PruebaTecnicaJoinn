// To parse this JSON data, do
//
//     final purchaseUserTicketsDetailsModel = purchaseUserTicketsDetailsModelFromJson(jsonString);

import 'dart:convert';

PurchaseUserTicketsDetailsModel purchaseUserTicketsDetailsModelFromJson(var str) => PurchaseUserTicketsDetailsModel.fromJson(str);

String purchaseUserTicketsDetailsModelToJson(PurchaseUserTicketsDetailsModel data) => json.encode(data.toJson());

class PurchaseUserTicketsDetailsModel {
  PurchaseUserTicketsDetailsModel({
    this.id,
    this.userId,
    this.userIdentification,
    this.userFullName,
    this.userEmail,
    this.datePurchase,
    this.tickets,
    this.taxes,
    this.pathImages,
  });

  int? id;
  int? userId;
  String? userIdentification;
  String? userFullName;
  String? userEmail;
  DateTime? datePurchase;
  List<Ticket>? tickets;
  List<Tax>? taxes;
  dynamic? pathImages;

  factory PurchaseUserTicketsDetailsModel.fromJson(Map<String, dynamic> json) => PurchaseUserTicketsDetailsModel(
        id: json["id"] == null ? null : json["id"],
        userId: json["userID"] == null ? null : json["userID"],
        userIdentification: json["userIdentification"] == null ? null : json["userIdentification"],
        userFullName: json["userFullName"] == null ? null : json["userFullName"],
        userEmail: json["userEmail"] == null ? null : json["userEmail"],
        datePurchase: json["datePurchase"] == null ? null : DateTime.parse(json["datePurchase"]),
        tickets: json["tickets"] == null ? null : List<Ticket>.from(json["tickets"].map((x) => Ticket.fromJson(x))),
        taxes: json["taxes"] == null ? null : List<Tax>.from(json["taxes"].map((x) => Tax.fromJson(x))),
        pathImages: json["pathImages"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "userID": userId == null ? null : userId,
        "userIdentification": userIdentification == null ? null : userIdentification,
        "userFullName": userFullName == null ? null : userFullName,
        "userEmail": userEmail == null ? null : userEmail,
        "datePurchase": datePurchase == null ? null : datePurchase?.toIso8601String(),
        "tickets": tickets == null ? null : List<dynamic>.from(tickets!.map((x) => x.toJson())),
        "taxes": taxes == null ? null : List<dynamic>.from(taxes!.map((x) => x.toJson())),
        "pathImages": pathImages,
      };
}

class Tax {
  Tax({
    this.id,
    this.purchaseId,
    this.taxId,
    this.taxName,
    this.percent,
    this.value,
  });

  int? id;
  int? purchaseId;
  int? taxId;
  String? taxName;
  double? percent;
  int? value;

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        id: json["id"] == null ? null : json["id"],
        purchaseId: json["purchaseID"] == null ? null : json["purchaseID"],
        taxId: json["taxID"] == null ? null : json["taxID"],
        taxName: json["taxName"] == null ? null : json["taxName"],
        percent: json["percent"] == null ? null : json["percent"].toDouble(),
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "purchaseID": purchaseId == null ? null : purchaseId,
        "taxID": taxId == null ? null : taxId,
        "taxName": taxName == null ? null : taxName,
        "percent": percent == null ? null : percent,
        "value": value == null ? null : value,
      };
}

class Ticket {
  Ticket({
    this.id,
    this.userId,
    this.userFullName,
    this.placeId,
    this.placeName,
    this.eventId,
    this.eventName,
    this.localityId,
    this.localityName,
    this.amount,
    this.unitPrice,
    this.datePurchase,
  });

  int? id;
  int? userId;
  String? userFullName;
  int? placeId;
  String? placeName;
  int? eventId;
  String? eventName;
  int? localityId;
  String? localityName;
  int? amount;
  double? unitPrice;
  DateTime? datePurchase;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json["id"] == null ? null : json["id"],
        userId: json["userID"] == null ? null : json["userID"],
        userFullName: json["userFullName"] == null ? null : json["userFullName"],
        placeId: json["placeID"] == null ? null : json["placeID"],
        placeName: json["placeName"] == null ? null : json["placeName"],
        eventId: json["eventID"] == null ? null : json["eventID"],
        eventName: json["eventName"] == null ? null : json["eventName"],
        localityId: json["localityID"] == null ? null : json["localityID"],
        localityName: json["localityName"] == null ? null : json["localityName"],
        amount: json["amount"] == null ? null : json["amount"],
        unitPrice: json["unitPrice"] == null ? null : json["unitPrice"].toDouble(),
        datePurchase: json["datePurchase"] == null ? null : DateTime.parse(json["datePurchase"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "userID": userId == null ? null : userId,
        "userFullName": userFullName == null ? null : userFullName,
        "placeID": placeId == null ? null : placeId,
        "placeName": placeName == null ? null : placeName,
        "eventID": eventId == null ? null : eventId,
        "eventName": eventName == null ? null : eventName,
        "localityID": localityId == null ? null : localityId,
        "localityName": localityName == null ? null : localityName,
        "amount": amount == null ? null : amount,
        "unitPrice": unitPrice == null ? null : unitPrice,
        "datePurchase": datePurchase == null ? null : datePurchase?.toIso8601String(),
      };
}
