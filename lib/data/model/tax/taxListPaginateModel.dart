// To parse this JSON data, do
//
//     final taxModel = taxModelFromJson(jsonString);

import 'dart:convert';

TaxModel taxModelFromJson(var str) => TaxModel.fromJson(str);

String taxModelToJson(TaxModel data) => json.encode(data.toJson());

class TaxModel {
  TaxModel({
    this.totalRecords,
    this.page,
  });

  int? totalRecords;
  List<PageTax>? page;

  factory TaxModel.fromJson(Map<String, dynamic> json) => TaxModel(
        totalRecords: json["totalRecords"],
        page: List<PageTax>.from(json["page"].map((x) => PageTax.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalRecords": totalRecords,
        "page": List<dynamic>.from(page!.map((x) => x.toJson())),
      };
}

class PageTax {
  PageTax({
    this.id,
    this.name,
    this.description,
    this.percent,
    this.state,
  });

  int? id;
  String? name;
  String? description;
  double? percent;
  int? state;

  factory PageTax.fromJson(Map<String, dynamic> json) => PageTax(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        percent: json["percent"].toDouble(),
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "percent": percent,
        "state": state,
      };
}
