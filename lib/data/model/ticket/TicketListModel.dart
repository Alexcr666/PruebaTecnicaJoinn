// To parse this JSON data, do
//
//     final ticketLocalityListModel = ticketLocalityListModelFromJson(jsonString);

import 'dart:convert';

TicketLocalityListModel ticketLocalityListModelFromJson(var str) => TicketLocalityListModel.fromJson(str);

String ticketLocalityListModelToJson(TicketLocalityListModel data) => json.encode(data.toJson());

class TicketLocalityListModel {
  TicketLocalityListModel({
    this.totalRecords,
    this.page,
  });

  int? totalRecords;
  List<PageTicket>? page;

  factory TicketLocalityListModel.fromJson(Map<String, dynamic> json) => TicketLocalityListModel(
        totalRecords: json["totalRecords"] == null ? null : json["totalRecords"],
        page: json["page"] == null ? null : List<PageTicket>.from(json["page"].map((x) => PageTicket.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalRecords": totalRecords == null ? null : totalRecords,
        "page": page == null ? null : List<dynamic>.from(page!.map((x) => x.toJson())),
      };
}

class PageTicket {
  PageTicket({
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
    this.datePurchase,
    this.urlImageConverter,
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
  DateTime? datePurchase;
  String? urlImageConverter;

  factory PageTicket.fromJson(Map<String, dynamic> json) => PageTicket(
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
        "datePurchase": datePurchase == null ? null : datePurchase!.toIso8601String(),
      };
}
