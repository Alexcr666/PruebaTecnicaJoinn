import 'dart:io';

import 'package:dj_mania/data/model/auth/UserLoginModel.dart';
import 'package:dj_mania/data/model/auth/UserModelId.dart';
import 'package:dj_mania/data/model/auth/identificationType.dart';
import 'package:meta/meta.dart';

@immutable
class PostsStateLogin {
  final bool? isError;
  final bool? isLoading;
  final UserLoginModel? userLoginModel;
  final UserModelIdModel? userModelIdModel;
  final List<IdentificationListModel>? listIdentificationModel;

  final File? imageUserProfile;
  //final LoginResponseModel userLoginModel;

  // final List<modelFavorites> posts;

  PostsStateLogin({
    this.isError,
    this.isLoading,
    this.userLoginModel,
    this.userModelIdModel,
    this.listIdentificationModel,
    this.imageUserProfile,
    //  this.userLoginModel,
    //this.posts,
  });

  factory PostsStateLogin.initial() => PostsStateLogin(
        isLoading: false,
        isError: false,
        userLoginModel: UserLoginModel(),
        userModelIdModel: UserModelIdModel(),
        listIdentificationModel: null,
        imageUserProfile: null,
        //   userLoginModel: null,
        // posts: const [],
      );

  PostsStateLogin copyWith({
    bool? isError,
    bool? isLoading,
    UserLoginModel? userLoginModel,
    UserModelIdModel? userModelIdModel,
    List<IdentificationListModel>? listIdentificationModel,
    File? imageUserProfile,

    //  @required LoginResponseModel userLoginModel,
    //  @required List<modelFavorites> posts,
  }) {
    return PostsStateLogin(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      userLoginModel: userLoginModel ?? this.userLoginModel,
      userModelIdModel: userModelIdModel ?? this.userModelIdModel,
      listIdentificationModel: listIdentificationModel ?? this.listIdentificationModel,
      imageUserProfile: imageUserProfile ?? this.imageUserProfile,
      //userLoginModel: userLoginModel ?? this.userLoginModel,

      //posts: posts ?? this.posts,
    );
  }
}
