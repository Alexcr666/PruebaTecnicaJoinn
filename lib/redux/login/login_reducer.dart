import 'package:dj_mania/redux/login/login_actions.dart';
import 'package:dj_mania/redux/login/login_state.dart';
import 'package:dj_mania/redux/sign_up/sign_up_actions.dart';
import 'package:dj_mania/redux/sign_up/sign_up_state.dart';

PostsStateLogin postsReducerLogin(PostsStateLogin prevState, SetPostsStateActionLogin action) {
  final payload = action.postsState;
  return prevState.copyWith(
    isError: payload.isError,
    isLoading: payload.isLoading,
    userLoginModel: payload.userLoginModel,
    userModelIdModel: payload.userModelIdModel,
    listIdentificationModel: payload.listIdentificationModel,
    imageUserProfile: payload.imageUserProfile,
    //  userLoginModel: payload.userLoginModel,
    // posts: payload.posts,
  );
}
