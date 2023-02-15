import 'dart:convert';

import 'package:dj_mania/TEST/test.dart';
import 'package:flutter/material.dart';

import 'package:dj_mania/Auth/Login/UI/login_ui.dart';
import 'package:dj_mania/Drawer/Events/events.dart';
import 'package:dj_mania/data/model/auth/UserLoginModel.dart';
import 'package:dj_mania/map_utils.dart';
import 'package:dj_mania/redux/login/login_actions.dart';
import 'package:dj_mania/redux/login/login_state.dart';
import 'package:dj_mania/redux/login/store.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:dj_mania/redux/sign_up/store.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'Locale/language_cubit.dart';
import 'Locale/locale.dart';
import 'Routes/routes.dart';

String userIdToken = "";

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Colors.white, // status bar color
  ));
  print("ejecuto");
  await ReduxSignUp.init();
  await ReduxLogin.init();
  await ReduxHome.init();

  WidgetsFlutterBinding.ensureInitialized();
  PaintingBinding.instance!.imageCache!.maximumSizeBytes = 1024 * 1024 * 300;
  //await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  MapUtils.getMarkerPic();
  String? value = prefs.getString("userActive");
  UserLoginModel dataResult;
  if (prefs.getString("userActive") != null) {
    dataResult = userLoginModelFromJson(json.decode(value!));

    ReduxLogin.store?.dispatch(
      SetPostsStateActionLogin(
        PostsStateLogin(userLoginModel: dataResult),
      ),
    );
    userIdToken = dataResult.token.toString();
    // print("pruebalogin601: " + ReduxLogin.store!.state.postsState.userLoginModel!.token.toString());
  }

  runApp(Phoenix(
      child: BlocProvider<LanguageCubit>(
    create: (context) => LanguageCubit(),
    child: MyApp(),
  )));
  // MobileAds.instance.initialize();
}
//void main() => runApp(MyAppTest());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) => Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: ThemeData(fontFamily: 'harmonia'),
          // color: Colors.black,

          localizationsDelegates: [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en'),
            const Locale('ar'),
            const Locale('id'),
            const Locale('fr'),
            const Locale('pt'),
            const Locale('es'),
          ],
          //  theme: appTheme,
          locale: locale,
          debugShowCheckedModeBanner: false,
          home: userIdToken != "" ? EventsPage() : LoginUI(),
          routes: PageRoutes().routes(),
        );
      }),
    );
  }
}
