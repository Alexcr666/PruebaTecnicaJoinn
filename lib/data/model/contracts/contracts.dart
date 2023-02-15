// To parse this JSON data, do
//
//     final contractsModel = contractsModelFromJson(jsonString);

import 'dart:convert';

List<ContractsModel> contractsModelFromJson(var str) => List<ContractsModel>.from(str.map((x) => ContractsModel.fromJson(x)));

String contractsModelToJson(List<ContractsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContractsModel {
  ContractsModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory ContractsModel.fromJson(Map<String, dynamic> json) => ContractsModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
