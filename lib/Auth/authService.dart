/*import 'dart:convert';
import 'dart:core';

import 'package:dj_mania/data/model/userModel.dart';
import 'package:flutter/cupertino.dart';

//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:intl/intl.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
class AuthService {
  Future<UserModel?> facebook() async {
    // try {
    // FacebookAuth.instance.logOut();
    final LoginResult result = await FacebookAuth.instance.login(permissions: ['public_profile', 'email', 'user_birthday']);
    final userData = await FacebookAuth.instance.getUserData(fields: "name,email,picture.width(200),birthday,first_name,last_name");

    if (result.status == LoginStatus.success) return UserModel.fromFacebookJson({...userData, "fbAccessToken": result.accessToken?.token});
    return null;
    /* }catch(err) {
      print("prueba45"+err.toString());
      Get.snackbar('Error de conexión', 'Compruebe su conexión a internet y vuelva a intentarlo', backgroundColor: SpmColors.red.withOpacity(.5), duration: Duration(seconds: 1));
      return null;
    }*/
  }
/*
  Future<UserModel?> facebook() async{
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['public_profile', 'email'],
      );
     /* print(result.status);
      print(result.message);
      print(result.accessToken?.token);*/
      final userData = await FacebookAuth.instance.getUserData(
          fields:
          "name,email,picture.width(200),birthday,first_name,last_name");
     // print(userData);
      return UserModel.fromFacebookJson(
         {...userData, "fbAccessToken": result.accessToken?.token});
    }catch(err) {
      print(err);
      return null;
    }
  }*/
  /* Future<UserModel?> facebook() async {
    try {
      //cambiado
   // FacebookAuth.instance.logOut();
/*
      final facebookLogin = FacebookLogin();
      final result = await facebookLogin.logInWithReadPermissions(['email']);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          _sendTokenToServer(result.accessToken.token);
          _showLoggedInUI();
          break;
        case FacebookLoginStatus.cancelledByUser:
          _showCancelledMessage();
          break;
        case FacebookLoginStatus.error:
          _showErrorOnUI(result.errorMessage);
          break;
      }*/
/*
try {
  final LoginResult result = await FacebookAuth.instance
      .login(permissions: ['public_profile', 'email', 'user_birthday']);
  print("prueba600"+result.message.toString());
}catch(e){
  print("prueba600"+e.toString());
}
      final userData = await FacebookAuth.instance.getUserData(
          fields:
              "name,email,picture.width(200),birthday,first_name,last_name");
      //if (result.status == LoginStatus.success)
        //return UserModel.fromFacebookJson(
          //  {...userData, "fbAccessToken": result.accessToken?.token});*/
      return null;
    } catch (err) {
      return null;
    }
  }
*/

  //GET USER

  Future<void> logout() async {
    try {
      // FacebookAuth.instance.logOut();
    } catch (e) {}
    // return _box.remove('user');
  }

  static set user(UserModel? user) {}
}
*/