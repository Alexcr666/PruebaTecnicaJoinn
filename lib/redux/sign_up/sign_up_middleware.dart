import 'dart:async';

import 'package:dj_mania/Drawer/Events/events.dart';
import 'package:dj_mania/data/model/auth/identificationType.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeActions.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeState.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:flutter/material.dart';

import 'package:dj_mania/services/endPoint.dart';
import 'package:redux/redux.dart';
import 'package:dj_mania/app/app_settings.dart';

import 'package:dj_mania/redux/app/app_state.dart';
import 'package:dj_mania/redux/login/login_actions.dart';
import 'package:dj_mania/redux/login/login_state.dart';
import 'package:dj_mania/redux/login/store.dart';
import 'package:dj_mania/redux/sign_up/sign_up_state.dart';
import 'package:dj_mania/redux/sign_up/store.dart';
import 'package:dj_mania/redux/store.dart';

import 'package:dj_mania/utils/alert.dart';

import 'sign_up_actions.dart';

class SignUpMiddleware extends MiddlewareClass<AppState> {
  SignUpMiddleware(this.api);

  final endPointApi api;

  @override
  Future<void> call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    if (action is UserSignUpAction) {
      await _userSignUp(next, action, store);
    }
  }

  Future<void> _userSignUp(NextDispatcher next, UserSignUpAction action, Store<AppState> store) async {
    AlertWidget().showProgressGlobal(action.context);

    // try {
    var response = await api.addUser(
        password: action.password,
        phone: action.phone,
        lastname: action.lastname,
        state: action.state,
        name: action.name,
        email: action.email,
        identification: action.identification,
        identificationType: action.identificationType,
        imageUrl: action.imageUrl);

    // fuctionBack(action.context);

    // AlertWidget().message(action.context, response!.message);
    print("pruebaregistro: " + response!.data.toString());

    async() async {
      //  BuildContext? context = null;
      Store<AppState> store = await createStore(api: endPointApi());

      store.dispatch(LoginAction(
          context: action.context,
          provider: 1,
          email: action.email.toString(),
          password: action.password.toString(),
          success: () {
            //  Navigator.pushNamed(context, LoginRoutes.verification);
            //   Navigator.pop(context);
            /*   Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => EventsPage()),
                                );*/
            Navigator.pushAndRemoveUntil(action.context, MaterialPageRoute(builder: (_) => EventsPage()), (route) => false);

            // widget.loginInteractor.loginWithPhone('', _numberController.text);
          }));
    }

    async();
    /* async() async {
      // BuildContext? context = null;
      Store<AppState> store = await createStore(api: endPointApi());

      store.dispatch(getUserIdAction(context: action.context!, id: response.data.toString()));
      // store.dispatch(categoriesAction(_context, "2"));
    }

    async();*/
    /* } catch (e) {
      // fuctionBack(action.context);
      print(e.toString());

      AlertWidget().message(action.context, e.toString());
      //  Navigator.pushNamedAndRemoveUntil(
      //    action.context, homeRoutes, (r) => false);
    }*/
  }

  Future<void> _userUpdate(NextDispatcher next, UserSignUpAction action, Store<AppState> store) async {
    //showProgressGlobal(action.context);

    try {
      var response = await api.getIdentificationType();

      // fuctionBack(action.context);

      if (response.data != null) {
        List<IdentificationListModel> data = identificationListModelFromJson(response.data);
        ReduxSignUp.store!.dispatch(
          SetPostsStateActionSignUp(
            PostsStateSignUp(identificationListModel: data),
          ),
        );
      } else {
        AlertWidget().message(action.context, response.message);
      }
    } catch (e) {
      // fuctionBack(action.context);

      AlertWidget().message(action.context, e.toString());
      //  Navigator.pushNamedAndRemoveUntil(
      //    action.context, homeRoutes, (r) => false);
    }
  }

  Future<void> _identificationType(NextDispatcher next, UserSignUpAction action, Store<AppState> store) async {
    //showProgressGlobal(action.context);

    try {
      var response = await api.getIdentificationType();

      // fuctionBack(action.context);

      if (response.data != null) {
        List<IdentificationListModel> data = identificationListModelFromJson(response.data);
        ReduxSignUp.store!.dispatch(
          SetPostsStateActionSignUp(
            PostsStateSignUp(identificationListModel: data),
          ),
        );
      } else {
        //AlertWidget().message(action.context, response.message);
      }
    } catch (e) {
      // fuctionBack(action.context);

      AlertWidget().message(action.context, e.toString());
      //  Navigator.pushNamedAndRemoveUntil(
      //    action.context, homeRoutes, (r) => false);
    }
  }
}
