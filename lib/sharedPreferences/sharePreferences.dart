import 'dart:convert';

import 'package:dj_mania/Auth/Login/UI/login_ui.dart';
import 'package:dj_mania/Auth/login_navigator.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/data/model/auth/UserLoginModel.dart';
import 'package:dj_mania/main.dart';
import 'package:dj_mania/redux/login/login_actions.dart';
import 'package:dj_mania/redux/login/login_state.dart';
import 'package:dj_mania/redux/login/store.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  Future setDataUser(UserLoginModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String value = json.encode(user);
    prefs.setString("userActive", value);
  }

  Future clearDataUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("userActive");
    UserLoginModel dataResult = UserLoginModel();

    ReduxLogin.store?.dispatch(
      SetPostsStateActionLogin(
        PostsStateLogin(userLoginModel: dataResult),
      ),
    );
    userIdToken = "";
    //Navigator.pop(context);

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => LoginUI()), (route) => false);
    //Navigator.pushNamed(context, PageRoutes.loginPage);

    //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyApp()), (route) => false);

    //prefs.setString("userActive", value);
  }

  Future<UserLoginModel> getDataUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString("userActive");
    UserLoginModel valuedata = json.decode(value!);
    return valuedata;
  }
}
