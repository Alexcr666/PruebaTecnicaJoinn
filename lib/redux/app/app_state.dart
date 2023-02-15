import 'package:dj_mania/redux/settingApp/settingsHomeState.dart';
import 'package:dj_mania/redux/sign_up/sign_up_state.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';

@immutable
class AppState extends Equatable {
  AppState({
    required this.signUpState,
    required this.settingHomeState,
  });

  final PostsStateSignUp signUpState;
  final PostsStateHome settingHomeState;

  static AppState rehydrationJSON(dynamic json) {
    return json != null
        ? AppState(
            signUpState: PostsStateSignUp(),
            settingHomeState: PostsStateHome(),
          )
        : AppState.initial();
  }

  Map<String, dynamic> toJson() => {
        //       'auth': authState.toJson(),
        //     'checkout': checkoutState.toJson(),
      };

  factory AppState.initial() {
    return AppState(
      signUpState: PostsStateSignUp(),
      settingHomeState: PostsStateHome(),
    );
  }

  AppState copyWith({
    required PostsStateSignUp signUpState,
    required PostsStateHome settingHomeState,
  }) =>
      AppState(
        signUpState: signUpState,
        settingHomeState: settingHomeState,
      );

  @override
  List<Object> get props => [
        signUpState,
        settingHomeState,
      ];
}
