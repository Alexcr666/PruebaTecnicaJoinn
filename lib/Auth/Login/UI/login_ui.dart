import 'dart:convert';
import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:crypto/crypto.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Auth/Registration/UI/registration_ui.dart';
import 'package:dj_mania/Auth/Verification/UI/verification_ui.dart';
import 'package:dj_mania/Auth/authService.dart';
import 'package:dj_mania/Auth/login_navigator.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Components/entry_field.dart';
import 'package:dj_mania/Drawer/Events/events.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/app/app_colors.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'login_interactor.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blur/blur.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/entry_field.dart';
import 'package:dj_mania/Constants/constants.dart';
import 'package:dj_mania/Drawer/Calendar/calendarPage.dart';
import 'package:dj_mania/Drawer/Events/allEvents/allEvents2.dart';
import 'package:dj_mania/Drawer/Events/dj_info.dart';
import 'package:dj_mania/Drawer/Events/event_detail.dart';
import 'package:dj_mania/Drawer/Events/shopers/shoperPage.dart';
import 'package:dj_mania/Drawer/Profile/my_profile.dart';
import 'package:dj_mania/Drawer/app_drawer.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/OrderMapBloc/order_map_bloc.dart';
import 'package:dj_mania/OrderMapBloc/order_map_state.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/Theme/colors.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:string_similarity/string_similarity.dart';
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
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

enum signInMethod { apple, google, database }

class LoginUI extends StatefulWidget {
  // final LoginInteractor loginInteractor;

  // LoginUI(this.loginInteractor);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final TextEditingController _numberController = TextEditingController();

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  late signInMethod signInWith;
  bool newUser = false;
  var _formKey = GlobalKey<FormState>();
  //late UserInfo user;
  //Apple INFO
  late String appleIdToken;
  var appleEmailController = TextEditingController();
  var appleNameController = TextEditingController();
  var appleLastnameController = TextEditingController();

  bool errorAppleFormMessage = false;
/*
  late User appleCurrentUser;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithGoogle() async {
    //cambiado
    // Trigger the authentication flow
    try {
      final googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return null;
      }

      // Obtain the auth details from the request
      final googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      var userCred = await auth.signInWithCredential(credential);
      // Once signed in, return the UserCredential
      print(userCred);
      newUser = userCred.additionalUserInfo!.isNewUser;
      // widget.loginInteractor.loginWithPhone('', _numberController.text);
      print("paso");
      /*Navigator.pushNamed(context, LoginRoutes.verification);
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EventsPage()),
      );*/
      return userCred;
    } catch (e) {
      print("Error de Google: $e");
      /* Navigator.pushNamed(context, LoginRoutes.verification);
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EventsPage()),
      );*/
      // widget.loginInteractor.loginWithPhone('', _numberController.text);
    }

    return null;
  }

  Future<UserCredential> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    //cambiado
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    var userCred;

    // Request credential for the currently signed in Apple account.
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      appleIdToken = appleCredential.identityToken!;

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      // Sign in the user with Firebase. If the nonce we generated earlier does
      // not match the nonce in `appleCredential.identityToken`, sign in will fail.
      //return await auth.signInWithCredential(oauthCredential);

      userCred = await auth.signInWithCredential(oauthCredential);
      // Once signed in, return the UserCredential
      print(userCred);
      newUser = userCred.additionalUserInfo.isNewUser;
    } catch (e) {
      print(e);
    }

    return userCred;
  }*/
/*
  AlertDialog appleCompleteDataForm(FirebaseAuth auth) {
    return AlertDialog(
        content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text("Por favor ingresa un correo y tu nombre para relacionar tus datos dentro de la app"),
        ),
        SizedBox(height: 20.0),
        Flexible(
            child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(hintText: "E-Mail"),
          controller: appleEmailController,
        )),
        Flexible(
            child: TextField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(hintText: "Nombre"),
          controller: appleNameController,
        )),
        Flexible(
            child: TextField(
                keyboardType: TextInputType.name, decoration: InputDecoration(hintText: "Apellido"), controller: appleLastnameController)),
        SizedBox(
          height: 20.0,
        ),
        Flexible(
            child: errorAppleFormMessage
                ? Text(
                    "Verifica, los datos ingresados. \nEl correo debe ser válido y el nombre y apellido no deben estar vacíos",
                    //  style: styleText(14, Colors.red, false),
                  )
                : Container()),
        Flexible(
          child: Row(children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  /*  var validationResult = validateAppleSigninForm(
                      email: appleEmailController.text, nombre: appleNameController.text, apellido: appleLastnameController.text);
                  if (validationResult == false) {
                    errorAppleFormMessage = true;
                  } else {
                    var m = auth.currentUser;
                /*    print(m);
                    try {
                      await appleCurrentUser.updateDisplayName(appleNameController.text);
                      await appleCurrentUser.updateEmail(appleEmailController.text);
                    } catch (e) {
                      print(e);
                    }
                    Navigator.of(context, rootNavigator: true).pop(validationResult);*/
                  }*/
                },
                child: Text("Aceptar"),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop(false);
                    },
                    child: Text("Cancelar")))
          ]),
        )
      ],
    ));
  }*/

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
/*
  Future signInProgressDialog(BuildContext context, {User? user}) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          if (signInWith == signInMethod.database) {
            return Text("hola");
          } else if (signInWith == signInMethod.google) {
            print("paso2");
            return Text("hola");
          } else if (signInWith == signInMethod.apple) {
            return Text("hola");
          } else {
            return Container();
          }
        });
  }*/

  bool get activeBoutton {
    return loadingFacebook;
  }
/*
  registerFacebook() async {
    print("prueba510");
    // final status = await Permission.storage.request();
    final user = await authS.facebook();
    if (user != null) {
      print("token: " + user.fbAccessToken.toString());
      // widget.optionChange(SingOption.FACEBOOK, user: user);
    }
  }*/

  bool loadingFacebook = false;
  /*final authS = AuthService();

  singFacebook() async {
    try {
      setState(() {
        loadingFacebook = true;
      });
      final user = await authS.facebook();
      print("prueba38");
      if (user != null) {
        //  await authS.login(user.email, '', user.fbAccessToken);
        print("token: " + user.fbAccessToken.toString());
        Navigator.pushNamedAndRemoveUntil(context, "welcome", (r) => false);
      }
    } on SocketException {
      /* Flushbar(
      duration: Duration(seconds: 3),
      title: "This is simple flushbar",
      message: "Hey, you are a registered user now.",
    )..show(context);
      Get.snackbar('Error de conexión',
          'Compruebe su conexión a internet y vuelva a intentarlo',
          backgroundColor: SpmColors.red.withOpacity(.5),
          duration: Duration(seconds: 1));*/
    }
    if (mounted)
      setState(() {
        loadingFacebook = false;
      });
  }*/

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: AppColors().backgroundColor,
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        Assets.logo,
                        scale: 2,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                      EntryField(
                        hintText: "Email",
                        labelText: "Email",
                        initialValue: '',
                        controller: _controllerEmail,
                        fillColor: Theme.of(context).backgroundColor,
                      ),
                      SizedBox(height: 10),
                      EntryField(
                        hintText: "Password",
                        labelText: "Password",
                        controller: _controllerPassword,
                        initialValue: '',
                        fillColor: Theme.of(context).backgroundColor,
                      ),
                      SizedBox(height: 20.0),
                      CustomButton(
                        onTap: () {
                          // widget.loginInteractor.loginWithPhone('', _numberController.text);
                          async() async {
                            //  BuildContext? context = null;
                            Store<AppState> store = await createStore(api: endPointApi());

                            store.dispatch(LoginAction(
                                context: context,
                                provider: 1,
                                email: _controllerEmail.text,
                                password: _controllerPassword.text,
                                success: () {
                                  //  Navigator.pushNamed(context, LoginRoutes.verification);
                                  //   Navigator.pop(context);
                                  /*   Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => EventsPage()),
                                );*/
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => EventsPage()), (route) => false);

                                  // widget.loginInteractor.loginWithPhone('', _numberController.text);
                                }));
                          }

                          async();
                        },
                        color: AppColors.primaryColor,
                        textColor: Colors.white,
                        label: "Login",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        label: "Sign Up",
                        color: AppColors().textColorGeneral.withOpacity(0.1),
                        textColor: AppColors.primaryColor,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegistrationUI()),
                          );
                          //ReduxLogin.store.dispatch("ANY");
                          //  signInWithGoogle();
                          //widget.loginInteractor.loginWithGoogle();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        label: locale.google,
                        icon: Image.asset(Assets.googleIcon, scale: 3),
                        color: Theme.of(context).backgroundColor,
                        textColor: Theme.of(context).scaffoldBackgroundColor,
                        onTap: () {
                          signInWith = signInMethod.google;

                          //ReduxLogin.store.dispatch("ANY");
                          //  signInWithGoogle();
                          //widget.loginInteractor.loginWithGoogle();
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                          onTap: () {
                            /// Navigator.pushNamed(context, LoginRoutes.verification);
                            //   Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RecuperatePasswordUI()),
                            );
                            //   Navigator.pushNamed(context, LoginRoutes.registration);
                            //   widget.loginInteractor.loginWithPhone('', _numberController.text);
                          },
                          child: Text(
                            "Recover password",
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors().textColorGeneral, fontSize: 14.sp),
                          )),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
