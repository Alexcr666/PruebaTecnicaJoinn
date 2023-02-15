// To parse this JSON data, do
//
//     final localityListModel = localityListModelFromJson(jsonString);

import 'dart:convert';

import 'package:dj_mania/data/model/locality/LocalityDetailsModel.dart';
import 'package:dj_mania/data/model/ticket/TicketListModel.dart';

List<LocalityListModel> localityListModelFromJson(var str) => List<LocalityListModel>.from(str.map((x) => LocalityListModel.fromJson(x)));

String localityListModelToJson(List<LocalityListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocalityListModel {
  LocalityListModel({
    this.id,
    this.name,
    this.dataDetails,
    this.ticketList,
    this.urlImageConverter,
  });

  String? id;
  String? name;
  LocalityDetailsModel? dataDetails;
  TicketLocalityListModel? ticketList;
  String? urlImageConverter;

  factory LocalityListModel.fromJson(Map<String, dynamic> json) => LocalityListModel(
        id: json["id"] == null ? null : json["id"].toString(),
        name: json["name"] == null ? null : json["name"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
