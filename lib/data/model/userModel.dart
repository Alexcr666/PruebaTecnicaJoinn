// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel(
      {this.active = true,
      required this.dateBirth,
      required this.email,
      required this.lastName,
      required this.name,
      // required this.provider,
      required this.username,
      this.terms,
      this.cellPhone,
      this.password,
      this.habeasData,
      this.country,
      this.createAt,
      this.emailVerified,
      this.id,
      this.imageProfile,
      this.matchingPassword,
      this.updateAt,
      this.rol = 'USER',
      this.fbAccessToken});

  final bool active;
  final int? cellPhone;
  final String? country;
  final int? createAt;
  final int dateBirth;
  final String email;
  final bool? emailVerified;
  final int? habeasData;
  final String? id;
  final String? imageProfile;
  final String lastName;
  final String? matchingPassword;
  final String name;
  final String? password;
  final int? terms;
  final int? updateAt;
  final String rol;
  final String username;
  //final UserProvider? provider;
  final String? fbAccessToken;

  UserModel copyWith({
    bool? active,
    int? cellPhone,
    String? country,
    int? createAt,
    int? dateBirth,
    String? email,
    bool? emailVerified,
    int? habeasData,
    String? id,
    String? imageProfile,
    String? lastName,
    String? matchingPassword,
    String? name,
    String? password,
    int? terms,
    int? updateAt,
    String? username,
    String? fbAccessToken,
    //  UserProvider? provider,
  }) =>
      UserModel(
        active: active ?? this.active,
        cellPhone: cellPhone ?? this.cellPhone,
        country: country ?? this.country,
        createAt: createAt ?? this.createAt,
        dateBirth: dateBirth ?? this.dateBirth,
        email: email ?? this.email,
        emailVerified: emailVerified ?? this.emailVerified,
        habeasData: habeasData ?? this.habeasData,
        id: id ?? this.id,
        imageProfile: imageProfile ?? this.imageProfile,
        lastName: lastName ?? this.lastName,
        matchingPassword: matchingPassword ?? this.matchingPassword,
        name: name ?? this.name,
        password: password ?? this.password,
        terms: terms ?? this.terms,
        updateAt: updateAt ?? this.updateAt,
        //  provider: provider ?? this.provider,
        username: username ?? this.username,
        fbAccessToken: fbAccessToken ?? this.fbAccessToken,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        active: json["active"],
        cellPhone: int.parse(json["cellPhone"].toString()),
        country: json["country"],
        createAt: json["createAt"],
        dateBirth: json["dateBirth"],
        email: json["email"],
        emailVerified: json["emailVerified"],
        habeasData: json["habeasData"],
        id: json["id"] ?? '0',
        imageProfile: json["imageProfile"],
        lastName: json["lastName"],
        matchingPassword: json["matchingPassword"],
        name: json["name"],
        password: json["password"],
        terms: json["terms"],
        updateAt: json["updateAt"],
        rol: json["rol"],
        // provider: providerValues.map[json["provider"]],
        username: json["username"],
        fbAccessToken: json["fbAccessToken"],
      );

  factory UserModel.fromFacebookJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        dateBirth: /*DateFormat('M/d/yyyy').parse(json['birthday']).millisecondsSinceEpoch*/ DateTime.now().microsecondsSinceEpoch,
        cellPhone: json["cellPhone"],
        imageProfile: json["picture"]['data']['url'],
        username: json["username"],
        //provider: providerValues.map[json["provider"]],
        fbAccessToken: json["fbAccessToken"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "cellPhone": cellPhone,
        "country": country,
        "createAt": createAt,
        "dateBirth": dateBirth,
        "email": email,
        "emailVerified": emailVerified,
        "habeasData": habeasData,
        "id": id ?? 0,
        "imageProfile": imageProfile,
        "lastName": lastName,
        "matchingPassword": matchingPassword,
        "name": name,
        "password": password,
        "terms": terms,
        "updateAt": updateAt,
        "username": username,
        //  "provider": providerValues.reverse[provider],
        "fbAccessToken": fbAccessToken,
      };

  Map<String, dynamic> toJsonForRegister() => {
        "cellPhone": cellPhone,
        "dateBirth": dateBirth,
        "email": email,
        "habeasData": habeasData,
        "lastName": lastName,
        "name": name,
        "password": password,
        "terms": terms,
        "rol": rol,
        "username": username,
        // "provider": providerValues.reverse[provider],
      };

  DateTime get dateBirthDateTime {
    return DateTime.fromMillisecondsSinceEpoch(dateBirth);
  }
}
