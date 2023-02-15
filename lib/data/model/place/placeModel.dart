// To parse this JSON data, do
//
//     final placeModel = placeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PlaceModel placeModelFromJson(String str) => PlaceModel.fromJson(json.decode(str));

String placeModelToJson(PlaceModel data) => json.encode(data.toJson());

class PlaceModel {
  PlaceModel({
    required this.amount,
    required this.base,
    required this.date,
    required this.rates,
  });

  int amount;
  String base;
  DateTime? date;
  Rates? rates;

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        amount: json["amount"] == null ? null : json["amount"],
        base: json["base"] == null ? null : json["base"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        rates: json["rates"] == null ? null : Rates.fromJson(json["rates"]),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount == null ? null : amount,
        "base": base == null ? null : base,
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "rates": rates == null ? null : rates!.toJson(),
      };
}

class Rates {
  Rates({
    required this.usd,
  });

  double usd;

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
        usd: json["USD"] == null ? null : json["USD"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd == null ? null : usd,
      };
}
