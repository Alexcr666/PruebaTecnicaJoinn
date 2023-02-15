import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';

import 'package:dj_mania/redux/login/login_actions.dart';
import 'package:dj_mania/redux/login/login_reducer.dart';
import 'package:dj_mania/redux/login/login_state.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeActions.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeReducer.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeState.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dj_mania/redux/sign_up/sign_up_state.dart';
import 'package:meta/meta.dart';

import 'package:redux/redux.dart';

AppStateHome appReducerHome(AppStateHome state, dynamic action) {
  final nextPostsState = postsReducerHome(state.postsState, action);

  return state.copyWith(postsState: nextPostsState);
}

@immutable
class AppStateHome {
  final PostsStateHome postsState;

  AppStateHome({
    required this.postsState,
  });

  AppStateHome copyWith({
    required PostsStateHome postsState,
  }) {
    return AppStateHome(
      postsState: postsState,
    );
  }
}

class ReduxHome {
  static Store<AppStateHome>? _store;

  static Store<AppStateHome>? get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final postsStateInitial = PostsStateHome.initial();

    _store = Store<AppStateHome>(
      appReducerHome,
      middleware: [],
      initialState: AppStateHome(postsState: postsStateInitial),
    );
  }
}
