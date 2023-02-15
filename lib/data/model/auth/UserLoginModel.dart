// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

import 'dart:convert';

UserLoginModel userLoginModelFromJson(var str) => UserLoginModel.fromJson(str);

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
  UserLoginModel({
    this.id,
    this.identification,
    this.provider,
    this.firstName,
    this.lastName,
    this.email,
    this.token,
    this.state,
    this.roles,
  });

  int? id;
  String? identification;
  String? provider;
  String? firstName;
  String? lastName;
  String? email;
  String? token;
  int? state;
  List<int>? roles;

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        id: json["id"] == null ? null : json["id"],
        identification: json["identification"] == null ? null : json["identification"],
        provider: json["provider"] == null ? null : json["provider"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        email: json["email"] == null ? null : json["email"],
        token: json["token"] == null ? null : json["token"],
        state: json["state"] == null ? null : json["state"],
        roles: json["roles"] == null ? null : List<int>.from(json["roles"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "identification": identification == null ? null : identification,
        "provider": provider == null ? null : provider,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "token": token == null ? null : token,
        "state": state == null ? null : state,
        "roles": roles == null ? null : List<dynamic>.from(roles!.map((x) => x)),
      };
}
