// To parse this JSON data, do
//
//     final userModelIdModel = userModelIdModelFromJson(jsonString);

import 'dart:convert';

UserModelIdModel userModelIdModelFromJson(var str) => UserModelIdModel.fromJson(str);

String userModelIdModelToJson(UserModelIdModel data) => json.encode(data.toJson());

class UserModelIdModel {
  UserModelIdModel({
    this.id,
    this.provider,
    this.identificationTypeId,
    this.identificationTypeName,
    this.identification,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.imageUrl,
    this.state,
    this.roles,
  });

  int? id;
  String? provider;
  int? identificationTypeId;
  String? identificationTypeName;
  String? identification;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? imageUrl;
  int? state;
  String? roles;

  factory UserModelIdModel.fromJson(Map<String, dynamic> json) => UserModelIdModel(
        id: json["id"] == null ? null : json["id"],
        provider: json["provider"] == null ? null : json["provider"],
        identificationTypeId: json["identificationTypeID"] == null ? null : json["identificationTypeID"],
        identificationTypeName: json["identificationTypeName"] == null ? null : json["identificationTypeName"],
        identification: json["identification"] == null ? null : json["identification"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        email: json["email"] == null ? null : json["email"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        state: json["state"] == null ? null : json["state"],
        roles: json["roles"] == null ? null : json["roles"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "provider": provider == null ? null : provider,
        "identificationTypeID": identificationTypeId == null ? null : identificationTypeId,
        "identificationTypeName": identificationTypeName == null ? null : identificationTypeName,
        "identification": identification == null ? null : identification,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "state": state == null ? null : state,
        "roles": roles == null ? null : roles,
      };
}
