// To parse this JSON data, do
//
//     final ticketListQrModel = ticketListQrModelFromJson(jsonString);

import 'dart:convert';

List<TicketListQrModel> ticketListQrModelFromJson(var str) => List<TicketListQrModel>.from(str.map((x) => TicketListQrModel.fromJson(x)));

String ticketListQrModelToJson(List<TicketListQrModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TicketListQrModel {
  TicketListQrModel({
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
  String? eventName;
  DateTime? dateTimeEvent;
  int? localityId;
  String? localityName;
  int? position;
  String? hash;

  factory TicketListQrModel.fromJson(Map<String, dynamic> json) => TicketListQrModel(
        id: json["id"] == null ? null : json["id"],
        userId: json["userID"] == null ? null : json["userID"],
        eventId: json["eventID"] == null ? null : json["eventID"],
        eventName: json["eventName"] == null ? null : json["eventName"],
        dateTimeEvent: json["dateTimeEvent"] == null ? null : DateTime.parse(json["dateTimeEvent"]),
        localityId: json["localityID"] == null ? null : json["localityID"],
        localityName: json["localityName"] == null ? null : json["localityName"],
        position: json["position"] == null ? null : json["position"],
        hash: json["hash"] == null ? null : json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "userID": userId == null ? null : userId,
        "eventID": eventId == null ? null : eventId,
        "eventName": eventName == null ? null : eventName,
        "dateTimeEvent": dateTimeEvent == null ? null : dateTimeEvent?.toIso8601String(),
        "localityID": localityId == null ? null : localityId,
        "localityName": localityName == null ? null : localityName,
        "position": position == null ? null : position,
        "hash": hash == null ? null : hash,
      };
}
