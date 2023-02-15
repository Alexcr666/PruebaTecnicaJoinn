import 'package:dj_mania/data/model/auth/identificationType.dart';
import 'package:meta/meta.dart';

@immutable
class PostsStateSignUp {
  final bool? isError;
  final bool? isLoading;
  final String? codeCountry;
  final String? initialCountry;
  final int? totalTest;
  final List<IdentificationListModel>? identificationListModel;

  PostsStateSignUp({
    this.isError,
    this.isLoading,
    this.codeCountry,
    this.initialCountry,
    this.totalTest,
    this.identificationListModel,

    //this.posts,
  });

  factory PostsStateSignUp.initial() => PostsStateSignUp(
        isLoading: false,
        isError: false,
        codeCountry: "+57",
        initialCountry: "CO",
        totalTest: 0,
        identificationListModel: null,
      );

  PostsStateSignUp copyWith({
    bool? isError,
    bool? isLoading,
    String? codeCountry,
    String? initialCountry,
    int? totalTest,
    List<IdentificationListModel>? identificationListModel,
  }) {
    return PostsStateSignUp(
      isError: isError,
      isLoading: isLoading,
      codeCountry: codeCountry,
      initialCountry: initialCountry,
      totalTest: totalTest,
      identificationListModel: identificationListModel,
    );
  }
}
