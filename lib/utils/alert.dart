import 'package:another_flushbar/flushbar.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:intl/intl.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:redux/redux.dart';

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:redux/redux.dart';

class AlertWidget {
  showProgressGlobal(var context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      useRootNavigator: false,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: 40,
                        // child: Image.asset(Assets().assetsLoadingGif),
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Cargando",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColors().textColorGeneral),
                        // style: styleText(18, AppColors.primaryColor, true),
                      ),
                      Container(
                        height: 70,
                        width: 30,
                      ),
                    ],
                  ),
                )));
      },
    );
  }

  errorAlert(var context) {
    showDialog(
      //   barrierDismissible: false,
      context: context,
      useRootNavigator: false,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 70,
                        width: 50,
                        // child: Image.asset(Assets().assetsLoadingGif),
                        margin: EdgeInsets.only(right: 20),
                      ),
                      Text(
                        "error",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                        // style: styleText(18, AppColors.primaryColor, true),
                      ),
                      Container(
                        height: 70,
                        width: 30,
                      ),
                    ],
                  ),
                )));
      },
    );
  }

  Widget widgetOptionText2(String fecha) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                fecha.toLowerCase(),
              )),
          SizedBox(
            child: SizedBox(),
          ),
        ],
      ),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10) //
            //        <--- border radius here
            ),
      ),
    );
  }

  message(BuildContext context, String message) async {
    /* await Flushbar(
      title: "Información",
      message: message,
      duration: Duration(seconds: 3),
    ).show(context);*/
  }

  messageInfo(BuildContext context, String message) async {
    await Flushbar(
      title: "Información",
      message: message,
      duration: Duration(seconds: 3),
    ).show(context);
  }
}
