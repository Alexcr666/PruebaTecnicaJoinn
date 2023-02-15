import 'package:dj_mania/redux/common_actions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:dj_mania/redux/login/login_state.dart';

import 'package:redux/redux.dart';

class RecoveryPasswordAction extends ErrorAction {
  RecoveryPasswordAction(BuildContext context, this.email) : super(context);
  final String email;
}

class GetCityAction extends ErrorAction {
  GetCityAction(
    BuildContext context,
  ) : super(context);
}

class getUserIdAction extends ErrorAction {
  getUserIdAction({required BuildContext context, required this.id}) : super(context);

  final String id;
}

class updatePasswordAction extends ErrorAction {
  updatePasswordAction({BuildContext? context, this.id, this.password}) : super(context!);

  final String? id;
  final String? password;
}

class RecoveryPasswordResetAction extends ErrorAction {
  RecoveryPasswordResetAction({required BuildContext context, required this.password, required this.passwordConfirm}) : super(context);

  final String password;
  final String passwordConfirm;
}

class LoginAction extends ErrorAction {
  LoginAction({required BuildContext context, required this.provider, required this.email, required this.password, required this.success})
      : super(context);
  final String email;
  final String password;
  final int provider;
  final Function success;
}

class LoginActionRecoverPasswordToken extends ErrorAction {
  LoginActionRecoverPasswordToken(BuildContext context, this.id, this.token) : super(context);
  final String id;
  final String token;
}

class getIdentificationTypeAction extends ErrorAction {
  getIdentificationTypeAction(BuildContext context) : super(context);
}

class updateProfileUserAction extends ErrorAction {
  updateProfileUserAction(
      {BuildContext? context,
      this.id,
      this.provider,
      this.identificationTypeId,
      this.identification,
      this.email,
      this.firstName,
      this.imageUrl,
      this.lastname,
      this.password,
      this.phoneNumber})
      : super(context!);
  final String? id;
  final String? provider;
  final String? identificationTypeId;
  final String? identification;
  final String? firstName;
  final String? lastname;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final String? imageUrl;
}

class addUser extends ErrorAction {
  addUser(BuildContext context, this.name, this.lastname, this.email, this.password) : super(context);
  final String name;
  final String lastname;
  final String email;
  final String password;
}

class LoginActionSaveNewPassword extends ErrorAction {
  LoginActionSaveNewPassword(BuildContext context, this.id, this.token) : super(context);
  final String id;
  final String token;
}

@immutable
class SetPostsStateActionLogin {
  final PostsStateLogin postsState;

  SetPostsStateActionLogin(this.postsState);
}
