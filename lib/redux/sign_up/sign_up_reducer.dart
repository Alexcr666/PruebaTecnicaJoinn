import 'package:dj_mania/redux/sign_up/sign_up_actions.dart';
import 'package:dj_mania/redux/sign_up/sign_up_state.dart';

postsReducer(PostsStateSignUp prevState, SetPostsStateActionSignUp action) {
  final payload = action.postsState;
  return prevState.copyWith(
    isError: payload.isError,
    isLoading: payload.isLoading,
    initialCountry: payload.initialCountry,
    codeCountry: payload.codeCountry,

    totalTest: payload.totalTest,
    identificationListModel: payload.identificationListModel,
    // posts: payload.posts,
  );
}
