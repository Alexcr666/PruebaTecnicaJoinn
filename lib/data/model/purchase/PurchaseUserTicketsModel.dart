// To parse this JSON data, do
//
//     final purchaseUserTicketsModel = purchaseUserTicketsModelFromJson(jsonString);

import 'dart:convert';

import 'package:dj_mania/data/model/purchase/PurchaseUserTicketsDetailsModel.dart';

PurchaseUserTicketsModel purchaseUserTicketsModelFromJson(var str) => PurchaseUserTicketsModel.fromJson(str);

String purchaseUserTicketsModelToJson(PurchaseUserTicketsModel data) => json.encode(data.toJson());

class PurchaseUserTicketsModel {
  PurchaseUserTicketsModel({
    this.totalRecords,
    required this.page,
  });

  int? totalRecords;
  List<PageTicketPurchase> page;

  factory PurchaseUserTicketsModel.fromJson(Map<String, dynamic> json) => PurchaseUserTicketsModel(
        totalRecords: json["totalRecords"] == null ? null : json["totalRecords"],
        page: List<PageTicketPurchase>.from(json["page"].map((x) => PageTicketPurchase.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalRecords": totalRecords == null ? null : totalRecords,
        "page": page == null ? null : List<dynamic>.from(page!.map((x) => x.toJson())),
      };
}

class PageTicketPurchase {
  PageTicketPurchase({
    this.id,
    this.userId,
    this.userIdentification,
    this.userFullName,
    this.userEmail,
    this.datePurchase,
    this.tickets,
    this.taxes,
    this.pathImages,
    this.dataDetails,
  });

  int? id;
  int? userId;
  String? userIdentification;
  String? userFullName;
  String? userEmail;
  DateTime? datePurchase;
  dynamic? tickets;
  dynamic? taxes;
  dynamic? pathImages;
  PurchaseUserTicketsDetailsModel? dataDetails;

  factory PageTicketPurchase.fromJson(Map<String, dynamic> json) => PageTicketPurchase(
        id: json["id"] == null ? null : json["id"],
        userId: json["userID"] == null ? null : json["userID"],
        userIdentification: json["userIdentification"] == null ? null : json["userIdentification"],
        userFullName: json["userFullName"] == null ? null : json["userFullName"],
        userEmail: json["userEmail"] == null ? null : json["userEmail"],
        datePurchase: json["datePurchase"] == null ? null : DateTime.parse(json["datePurchase"]),
        tickets: json["tickets"],
        taxes: json["taxes"],
        pathImages: json["pathImages"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "userID": userId == null ? null : userId,
        "userIdentification": userIdentification == null ? null : userIdentification,
        "userFullName": userFullName == null ? null : userFullName,
        "userEmail": userEmail == null ? null : userEmail,
        "datePurchase": datePurchase == null ? null : datePurchase?.toIso8601String(),
        "tickets": tickets,
        "taxes": taxes,
        "pathImages": pathImages,
      };
}
