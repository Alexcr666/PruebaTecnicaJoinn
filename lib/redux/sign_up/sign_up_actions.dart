import 'package:dj_mania/redux/common_actions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:dj_mania/redux/sign_up/sign_up_state.dart';

import 'package:redux/redux.dart';

class UserUpdateAction extends ErrorAction {
  UserUpdateAction(
      {BuildContext? context,
      this.email,
      this.password,
      this.name,
      this.lastname,
      this.identification,
      this.identificationType,
      this.phone,
      this.imageUrl,
      this.state})
      : super(context!);
  final String? email;
  final String? password;
  final String? imageUrl;
  final String? state;
  final String? name;
  final String? identificationType;
  final String? identification;
  final String? phone;

  final String? lastname;
}

class UserSignUpAction extends ErrorAction {
  UserSignUpAction(
      {BuildContext? context,
      this.email,
      this.password,
      this.name,
      this.lastname,
      this.identification,
      this.identificationType,
      this.phone,
      this.imageUrl,
      this.state})
      : super(context!);
  final String? email;
  final String? password;
  final String? imageUrl;
  final String? state;
  final String? name;
  final String? identificationType;
  final String? identification;
  final String? phone;

  final String? lastname;
}

class UserUpdatePassword extends ErrorAction {
  UserUpdatePassword(BuildContext context, this.id, this.password) : super(context);
  final String id;
  final String password;
}

class identificationTypeAction extends ErrorAction {
  identificationTypeAction(BuildContext context) : super(context);
}

class UserSignUpActionComplete extends ErrorAction {
  UserSignUpActionComplete(BuildContext context, this.id, this.mobile, this.names, this.surnames, this.isoCountry, this.postalCode,
      this.city, this.address, this.adress2ndLine, this.birthdate, this.locationId, this.levelLocation, this.pin)
      : super(context);
  final int id;
  final String mobile;
  final String names;
  final String surnames;
  final String isoCountry;
  final String postalCode;
  final String city;
  final String address;
  final String adress2ndLine;
  final String birthdate;
  final int locationId;
  final int levelLocation;
  final String pin;
}

class UserSignUpActionValidateSms extends ErrorAction {
  UserSignUpActionValidateSms(BuildContext context, this.number, this.sms, this.codePhone, this.id) : super(context);
  final String number;
  final String sms;
  final String codePhone;
  final String id;
}

class UserSignUpActionValidateSmsEmail extends ErrorAction {
  UserSignUpActionValidateSmsEmail(BuildContext context, this.id, this.token, this.phone) : super(context);
  final String id;
  final String token;
  final String phone;
}

class UserSignUpActionRepeatSms extends ErrorAction {
  UserSignUpActionRepeatSms(BuildContext context, this.number) : super(context);
  final String number;
}

class UserSignUpActionRepeatSmsEmail extends ErrorAction {
  UserSignUpActionRepeatSmsEmail(BuildContext context, this.number, this.mobileApp, this.language) : super(context);
  final String number;
  final bool mobileApp;
  final String language;
}

class UserSignUpActionRecoverPassword extends ErrorAction {
  UserSignUpActionRecoverPassword(BuildContext context, this.email, this.language) : super(context);
  final String email;
  final String language;
}

class UserSignUpStackUser extends ErrorAction {
  UserSignUpStackUser(BuildContext context, this.id, this.phone, this.email) : super(context);
  final String id;
  final String phone;
  final String email;
}

class UserSignUpActionRecoverPasswordToken extends ErrorAction {
  UserSignUpActionRecoverPasswordToken(BuildContext context, this.id, this.token) : super(context);
  final String id;
  final String token;
}

class UserLocationIp extends ErrorAction {
  UserLocationIp(BuildContext context) : super(context);
}

class UserCountryHome extends ErrorAction {
  UserCountryHome(BuildContext context, this.country) : super(context);
  final String country;
}

class UserCountryHomeLocation extends ErrorAction {
  UserCountryHomeLocation(BuildContext context, this.country) : super(context);
  final String country;
}

class UserSignUpActionSaveNewPassword extends ErrorAction {
  UserSignUpActionSaveNewPassword(BuildContext context, this.id, this.token) : super(context);
  final String id;
  final String token;
}

@immutable
class SetPostsStateActionSignUp {
  final PostsStateSignUp postsState;

  SetPostsStateActionSignUp(this.postsState);
}
