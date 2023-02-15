import 'package:dj_mania/redux/sign_up/sign_up_actions.dart';
import 'package:dj_mania/redux/sign_up/sign_up_reducer.dart';
import 'package:dj_mania/redux/sign_up/sign_up_state.dart';
import 'package:meta/meta.dart';

import 'package:redux/redux.dart';

AppStateSignUp appReducerFavorite(AppStateSignUp state, dynamic action) {
  if (action is SetPostsStateActionSignUp) {
    final nextPostsState = postsReducer(state.postsState, action);

    return state.copyWith(postsState: nextPostsState);
  }

  return state;
}

@immutable
class AppStateSignUp {
  final PostsStateSignUp postsState;

  AppStateSignUp({
    required this.postsState,
  });

  AppStateSignUp copyWith({
    required PostsStateSignUp postsState,
  }) {
    return AppStateSignUp(
      postsState: postsState,
    );
  }
}

class ReduxSignUp {
  static Store<AppStateSignUp>? _store;

  static Store<AppStateSignUp>? get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final postsStateInitial = PostsStateSignUp.initial();

    _store = Store<AppStateSignUp>(
      appReducerFavorite,
      middleware: [],
      initialState: AppStateSignUp(postsState: postsStateInitial),
    );
  }
}
