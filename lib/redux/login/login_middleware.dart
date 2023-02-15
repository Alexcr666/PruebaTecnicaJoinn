import 'dart:async';

import 'package:dj_mania/Auth/Registration/UI/changePassword/changePassword.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/data/model/auth/UserModelId.dart';
import 'package:dj_mania/data/model/auth/identificationType.dart';
import 'package:dj_mania/services/endPoint.dart';
import 'package:dj_mania/services/endPointLogin.dart';
import 'package:dj_mania/sharedPreferences/sharePreferences.dart';
import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:dj_mania/app/app_settings.dart';

import 'package:dj_mania/redux/app/app_state.dart';
import 'package:dj_mania/redux/login/login_actions.dart';
import 'package:dj_mania/redux/login/login_state.dart';
import 'package:dj_mania/redux/login/store.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeActions.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeState.dart';
import 'package:dj_mania/redux/settingApp/store.dart';

//import 'package:dj_mania/ui/politUsed/termsAndConditions.dart';

import 'package:dj_mania/utils/alert.dart';
import 'package:dj_mania/utils/utils.dart';

import '../../data/model/auth/UserLoginModel.dart';

class LoginMiddleware extends MiddlewareClass<AppState> {
  LoginMiddleware(this.api);

  final endPointApi api;

  @override
  Future<void> call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
    if (ReduxLogin.store!.state.postsState.userLoginModel != null) {
      if (action is LoginAction) {
        await _Login(next, action, store);
      }
      /*   if (action is LoginActionRecoverPasswordToken) {
      await _LoginValidateToken(next, action, store);
    } */
      if (action is LoginActionSaveNewPassword) {
        await _LoginSaveNewPassword(next, action, store);
      }
      if (action is RecoveryPasswordAction) {
        await _RecoveryPasswordToken(next, action, store);
      }

      if (action is RecoveryPasswordResetAction) {
        await _RecoveryPasswordResetToken(next, action, store);
      }

      if (action is getUserIdAction) {
        await _getUserId(next, action, store);
      }

      if (action is GetCityAction) {
        //await _getCityUser(next, action, store);
      }

      if (action is updateProfileUserAction) {
        await _updateUser(next, action, store);
      }

      if (action is getIdentificationTypeAction) {
        await _getIdentificationTypeAction(next, action, store);
      }

      if (action is updatePasswordAction) {
        await _updatePasswordUser(next, action, store);
      }
    } else {
      Navigator.pushNamed(action.context, PageRoutes.loginPage);
    }
  }

  Future<void> _updatePasswordUser(NextDispatcher next, updatePasswordAction action, Store<AppState> store) async {
    AlertWidget().showProgressGlobal(action.context);
    //print("prueba45");
    try {
      var response = await endPointApiLogin().userUpdatePassword(password: action.password, id: action.id);

      //  print("prueba45" + response.data.toString());

      Navigator.pop(action.context);

      if (response.data != null) {
        AlertWidget().message(action.context, "Firme");
      } else {
        AlertWidget().message(action.context, response.message);
      }
    } catch (e) {
      print("error-----" + e.toString());
      Navigator.pop(action.context);
      controllerChangePassword.clear();
      controllerChangePasswordRepeat.clear();

      AlertWidget().message(action.context, "Contraseña cambiada");
      AppSharedPreference().clearDataUser(action.context).then((value) {
        // Phoenix.rebirth(context);
        // Navigator.pushNamed(action.context, PageRoutes.loginPage);
      });
    }
  }

  Future<void> _getIdentificationTypeAction(NextDispatcher next, getIdentificationTypeAction action, Store<AppState> store) async {
    //AlertWidget().showProgressGlobal(action.context);
    //print("prueba45");
    //  try {
    var response = await endPointApi().getIdentificationType2(action.context);

    //  print("prueba45" + response.data.toString());

    //Navigator.pop(action.context);

    if (response.data != null) {
      print("prueba45--2" + response.data.toString());
      List<IdentificationListModel>? data = identificationListModelFromJson(response.data);
      // print("prueba45---" + data.email.toString());
      ReduxLogin.store?.dispatch(
        SetPostsStateActionLogin(
          PostsStateLogin(listIdentificationModel: data),
        ),
      );
      print("prueba45---" + ReduxHome.store!.state.postsState.userModelIdModel!.email.toString());
    } else {
      AlertWidget().message(action.context, response.message);
    }
    //  } catch (e) {
    // print(e.toString());
    // Navigator.pop(action.context);
    AlertWidget().message(action.context, "Ha ocurrido un error, por favor inténtelo de nuevo más tarde");
    // }
  }

  Future<void> _updateUser(NextDispatcher next, updateProfileUserAction action, Store<AppState> store) async {
    AlertWidget().showProgressGlobal(action.context);
    //print("prueba45");
    try {
      var response = await endPointApiLogin().userUpdate(
          id: action.id,
          provider: action.provider,
          identificationTypeId: action.identificationTypeId,
          identification: action.identification,
          firstName: action.firstName,
          lastname: action.lastname,
          email: action.email,
          phoneNumber: action.phoneNumber,
          password: action.password,
          imageUrl: action.imageUrl,
          state: "1");
      //  print("prueba45" + response.data.toString());

      Navigator.pop(action.context);

      if (response!.statusCode == 200) {
        //  print("prueba45" + response!.data.toString());
        AlertWidget().messageInfo(action.context, "Cambios actualizados");
      } else {
        AlertWidget().messageInfo(action.context, "Ha ocurrido un error, por favor inténtelo de nuevo más tarde");
      }
    } catch (e) {
      print("erroractualizar----" + e.toString());
      Navigator.pop(action.context);
      AlertWidget().messageInfo(action.context, "Ha ocurrido un error, por favor inténtelo de nuevo más tarde");
    }
  }

  Future<void> _getUserId(NextDispatcher next, getUserIdAction action, Store<AppState> store) async {
    // AlertWidget().showProgressGlobal(action.context);
    //print("prueba45");
    try {
      var response = await endPointApiLogin().getUserId(id: action.id);
      //  print("prueba45" + response.data.toString());

      // Navigator.pop(action.context);

      if (response.data != null) {
        print("prueba45--2" + response.data.toString());
        UserModelIdModel data = userModelIdModelFromJson(response.data);
        print("prueba45---" + data.email.toString());
        ReduxHome.store?.dispatch(
          SetPostsStateActionHome(
            PostsStateHome(userModelIdModel: data),
          ),
        );
        print("prueba45---" + ReduxHome.store!.state.postsState.userModelIdModel!.email.toString());
      } else {
        AlertWidget().message(action.context, response.message);
      }
    } catch (e) {
      print(e.toString());
      //   Navigator.pop(action.context);
      AlertWidget().message(action.context, "Ha ocurrido un error, por favor inténtelo de nuevo más tarde");
    }
  }

  Future<void> _UpdateProfile(NextDispatcher next, updateProfileUserAction action, Store<AppState> store) async {
    /* try {
      var response = await api.updateProfileUser(
          id: action.id,
          address: action.address,
          birthday: action.birthday,
          gender: action.gender,
          identification: action.identification,
          phone: action.phone,
          weight: action.weight);
      print("prueba3" + response.message.toString());

      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          AlertWidget().message(action.context, response.message);

          break;
        case AppSettings.statusCodeError:
          if (response.data != null) {
            AlertWidget().message(action.context, "Actualizado");
          } else {
            AlertWidget().message(action.context, response.message);
          }
          // alertConfirmNumber2(action.context);
          // alertForgortPassword3(action.context);

          break;
        default:
          AlertWidget().message(action.context, response.message);
      }
    } catch (e) {
      print(e);
      AlertWidget().message(action.context,
          /* AppLocalizations.of(action.context).errornotification*/ "Ha ocurrido un error, por favor inténtelo de nuevo más tarde");
    }*/
  }

  Future<void> _RecoveryPasswordResetToken(NextDispatcher next, RecoveryPasswordResetAction action, Store<AppState> store) async {
    /* try {
      var response = await api.recoveryUserPassword(passwordConfirm: action.passwordConfirm, password: action.password);
      print("prueba3" + response.message.toString());

      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          AlertWidget().message(action.context, response.message);

          break;
        case AppSettings.statusCodeError:
          if (response.data != null) {
            AlertWidget().message(action.context, response.message);
          } else {
            AlertWidget().message(action.context, response.message);
          }
          // alertConfirmNumber2(action.context);
          // alertForgortPassword3(action.context);

          break;
        default:
          AlertWidget().message(action.context, response.message);
      }
    } catch (e) {
      print(e);
      AlertWidget().message(action.context,
          /* AppLocalizations.of(action.context).errornotification*/ "Ha ocurrido un error, por favor inténtelo de nuevo más tarde");
    }*/
  }

  Future<void> _RecoveryPasswordToken(NextDispatcher next, RecoveryPasswordAction action, Store<AppState> store) async {
    try {
      var response = await endPointApiLogin().recoverPassword(email: action.email);
      print("prueba3" + response.message.toString());

      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          AlertWidget().messageInfo(action.context, "Correo enviado");

          break;
        case AppSettings.statusCodeError:
          AlertWidget().message(action.context, response.message);

          // alertConfirmNumber2(action.context);
          // alertForgortPassword3(action.context);

          break;
        default:
          AlertWidget().message(action.context, response.message);
      }
    } catch (e) {
      print(e);
      AlertWidget().message(action.context,
          /* AppLocalizations.of(action.context).errornotification*/ "Ha ocurrido un error, por favor inténtelo de nuevo más tarde");
    }
  }

  // AlertWidget alertWidget = new AlertWidget();

  Future<void> _Login(NextDispatcher next, LoginAction action, Store<AppState> store) async {
    AlertWidget().showProgressGlobal(action.context);
    print("prueba45");
    try {
      var response = await endPointApiLogin().login(
        email: action.email,
        password: action.password,
        provider: "",
      );
      print("prueba45" + response.data.toString());

      Navigator.pop(action.context);

      if (response.data != null) {
        UserLoginModel data = userLoginModelFromJson(response.data);
        if (data.state == 1) {
          ReduxLogin.store?.dispatch(
            SetPostsStateActionLogin(
              PostsStateLogin(userLoginModel: data),
            ),
          );

          AppSharedPreference().setDataUser(data);
          /* Navigator.pushAndRemoveUntil<dynamic>(
                action.context,

                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => /*  intro1Page() */ TermsAndConditions(),
                ),
                (route) => false, //if you want to disable back feature set to false
              );*/
          action.success();
        } else {
          AlertWidget().message(action.context, "Cuenta desactivada");
        }
        // AlertWidget().message(action.context, "exito");
      } else {
        AlertWidget().message(action.context, response.message);
      }
    } catch (e) {
      print("errologin" + e.toString());
      Navigator.pop(action.context);
      //AlertWidget().errorAlert(action.context);

      AlertWidget().messageInfo(action.context, "Ha ocurrido un error, por favor inténtelo de nuevo más tarde");
    }
  }

  /* Future<void> _LoginValidateToken(NextDispatcher next,
      LoginActionRecoverPasswordToken action, Store<AppState> store) async {
    try {
      var response = await api.resetPasswordValidateToken(
        action.id,
        action.token,
      );
      print("prueba3" + response.message.toString());

      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          AlertWidget().message(action.context, response.message);

          break;
        case AppSettings.statusCodeError:
          if (response.data != null) {
            Navigator.pushNamed(action.context, homeRoutes,
                arguments: 'Data from home');
          } else {
            AlertWidget().message(action.context, response.message);
          }
          // alertConfirmNumber2(action.context);
          // alertForgortPassword3(action.context);

          break;
        default:
          AlertWidget().message(action.context, response.message);
      }
    } catch (e) {
      print(e);
      AlertWidget().message(action.context,
          /* AppLocalizations.of(action.context).errornotification*/ "Ha ocurrido un error, por favor inténtelo de nuevo más tarde");
    }
  }
 */
  Future<void> _LoginSaveNewPassword(NextDispatcher next, LoginActionSaveNewPassword action, Store<AppState> store) async {
    /*try {
      var response = await api.loginUser(
        action.id,
        action.token,
      );
      print("prueba3" + response.message.toString());
      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          AlertWidget().message(action.context, response.message);

          break;
        case 422:
          AlertWidget().message(action.context, response.message);

          break;
        default:
          AlertWidget().message(action.context, response.message);
      }
    } catch (e) {
      print(e);
      AlertWidget().message(action.context,
          /* AppLocalizations.of(action.context).errornotification*/ "Ha ocurrido un error, por favor inténtelo de nuevo más tarde");
    }*/
  }
}
