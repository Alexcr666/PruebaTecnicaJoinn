import 'package:dj_mania/redux/login/login_actions.dart';
import 'package:dj_mania/redux/login/login_reducer.dart';
import 'package:dj_mania/redux/login/login_state.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeActions.dart';

import 'package:dj_mania/redux/sign_up/sign_up_state.dart';
import 'package:meta/meta.dart';

import 'package:redux/redux.dart';

AppStateLogin appReducerLogin(AppStateLogin state, dynamic action) {
  // if (action is SetPostsStateActionLogin) {
  final nextPostsState = postsReducerLogin(state.postsState, action);

  return state.copyWith(postsState: nextPostsState);
  // }

  return state;
}

@immutable
class AppStateLogin {
  final PostsStateLogin postsState;

  AppStateLogin({
    required this.postsState,
  });

  AppStateLogin copyWith({
    required PostsStateLogin postsState,
  }) {
    return AppStateLogin(
      postsState: postsState,
    );
  }
}

class ReduxLogin {
  static Store<AppStateLogin>? _store;

  static Store<AppStateLogin>? get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final postsStateInitial = PostsStateLogin.initial();

    _store = Store<AppStateLogin>(
      appReducerLogin,
      middleware: [],
      initialState: AppStateLogin(postsState: postsStateInitial),
    );
  }

  /* static testMiddleware1(Store<AppStateLogin> store, dynamic action, NextDispatcher next) {
    print("Testing Middleware 1 $action");
  }*/
}
