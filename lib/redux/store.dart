import 'dart:async';

import 'package:dj_mania/redux/login/login_middleware.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeMiddleware.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeState.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:dj_mania/redux/sign_up/sign_up_middleware.dart';
import 'package:dj_mania/redux/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:dj_mania/services/endPoint.dart';

import 'package:redux/redux.dart';
////import 'package:redux_persist/redux_persist.dart';

import 'app/app_reducer.dart';
import 'app/app_state.dart';

/*Persistor<AppState> createPersistor(String key) => Persistor<AppState>(
    storage: new WebStorage(key),
    serializer: JsonSerializer<AppState>(AppState.rehydrationJSON));*/
@immutable
class AppStateCheckoutSlit {
  final PostsStateSignUp postsState;
  final PostsStateHome settingHomeState;

  AppStateCheckoutSlit({
    required this.postsState,
    required this.settingHomeState,
  });

  AppStateCheckoutSlit copyWith({
    required PostsStateSignUp postsState,
    required PostsStateHome settingHomeState,
  }) {
    return AppStateCheckoutSlit(
      postsState: postsState,
      settingHomeState: settingHomeState,
    );
  }
}

Future<Store<AppState>> createStore({required endPointApi api /* , Persistor<AppState> persistor */}) async {
  // var prefs = await SharedPreferences.getInstance();
  AppState initialState;
  //AppStateHome initialState;

  /*  try {
    initialState = await persistor.load();
  } catch (e) {
    initialState = AppState.initial();
  } */

  Store<AppState> store = Store(appReducer, initialState: AppState.initial(), distinct: true, middleware: [
    SignUpMiddleware(api),
    LoginMiddleware(api),
    SettingHomeMiddleware(api)

    //  persistor.createMiddleware(),
  ]);
  api.loadStore(store);
  return store;
}
