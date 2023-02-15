import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Drawer/MyTickets/my_tickets.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/Routes/routes.dart';

import 'package:dj_mania/data/model/auth/UserLoginModel.dart';
import 'package:dj_mania/data/model/auth/UserModelId.dart';
import 'package:dj_mania/redux/login/store.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:dj_mania/sharedPreferences/sharePreferences.dart';
import 'package:dj_mania/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:dj_mania/redux/settingApp/settingsHomeActions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Components/entry_field.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/data/model/auth/identificationType.dart';
import 'package:dj_mania/redux/sign_up/sign_up_actions.dart';
import 'package:dj_mania/services/endPoint.dart';
import 'package:flutter/material.dart';

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

class Tile {
  String? title;
  String? subtitle;
  Function onTap;

  Tile(this.title, this.subtitle, this.onTap);
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    List<Tile> tiles = [];
    if (ReduxLogin.store!.state.postsState.userLoginModel!.roles![0] == 1) {
      tiles = [
        Tile(locale.events, locale.listOfAllEvents, () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pushNamed(context, PageRoutes.eventsPage);
        }),
        /*  Tile(locale.myDjs, locale.djsYouFollow, () {
        Navigator.pushNamed(context, PageRoutes.myDJays);
      }),*/
        /* Tile(locale.myTickets, locale.listOfEventBooked, () {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pushNamed(context, PageRoutes.myTicketsPage);
      }),*/
        /*  Tile(locale.changeLanguage, locale.changeLanguage, () {
        Navigator.pushNamed(context, PageRoutes.languagePage);
      }),*/
        Tile(locale.tnC, locale.knowAboutCompanypolicies, () {
          Navigator.pushNamed(context, PageRoutes.tncPage);
        }),
        Tile("Dashboard", locale.knowAboutCompanypolicies, () {
          async() async {
            // BuildContext? context = null;
            Store<AppState> store = await createStore(api: endPointApi());

            store.dispatch(getContractsAction(context!, "2"));

            // store.dispatch(categoriesAction(_context, "2"));
          }

          async();
          /* Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdminApp()),
          );*/
        }),
        Tile("My Tickets", locale.getYourQuestionsAnswered, () {
          //  Navigator.pushNamed(context, PageRoutes.faqPage);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyTicketsPage()),
          );
        }),
        Tile(locale.logout, locale.signOutFromYourAccount, () {
          AppSharedPreference().clearDataUser(context).then((value) {
            // Phoenix.rebirth(context);
            //  Navigator.pushNamed(context, PageRoutes.loginPage);
          });
        }),
      ];
    } else {
      tiles = [
        Tile(locale.events, locale.listOfAllEvents, () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pushNamed(context, PageRoutes.eventsPage);
        }),
        /*  Tile(locale.myDjs, locale.djsYouFollow, () {
        Navigator.pushNamed(context, PageRoutes.myDJays);
      }),*/
        /* Tile(locale.myTickets, locale.listOfEventBooked, () {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pushNamed(context, PageRoutes.myTicketsPage);
      }),*/
        /*  Tile(locale.changeLanguage, locale.changeLanguage, () {
        Navigator.pushNamed(context, PageRoutes.languagePage);
      }),*/
        Tile(locale.tnC, locale.knowAboutCompanypolicies, () {
          Navigator.pushNamed(context, PageRoutes.tncPage);
        }),
        Tile("My Tickets", locale.getYourQuestionsAnswered, () {
          //  Navigator.pushNamed(context, PageRoutes.faqPage);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyTicketsPage()),
          );
        }),
        Tile(locale.logout, locale.signOutFromYourAccount, () {
          AppSharedPreference().clearDataUser(context).then((value) {
            // Phoenix.rebirth(context);
            //  Navigator.pushNamed(context, PageRoutes.loginPage);
          });
        }),
      ];
    }

    UserModelIdModel? dataUser2;
    if (ReduxHome.store!.state.postsState.userModelIdModel != null) {
      // print("prueba56:--- " + ReduxLogin.store!.state.postsState.userModelIdModel!.firstName.toString());
      dataUser2 = ReduxHome.store!.state.postsState.userModelIdModel;
    }
    UserLoginModel? dataUser;
    if (ReduxLogin.store!.state.postsState.userLoginModel != null) {
      dataUser = ReduxLogin.store!.state.postsState.userLoginModel;
    }
    //  UserLoginModel? dataUser = ReduxLogin.store!.state.postsState.userLoginModel;
    return Opacity(
      opacity: 0.9,
      child: Drawer(
        child: FadedSlideAnimation(
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                /* ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 24),
                      child: Container(
                        height: 150,
                        width: 100,
                        child: Image.asset(
                          Assets.profileImage,
                          scale: 3,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    )),*/
                /* dataUser2 == null
                    ? SizedBox()
                    : dataUser2!.imageUrl != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0, top: 24),
                              child: Container(
                                  margin: EdgeInsets.only(left: 70, right: 70, top: 20, bottom: 20),
                                  color: Colors.white24,
                                  height: 150,
                                  width: 100,
                                  child: SizedBox(
                                    height: 150,
                                    width: 100,
                                  )),
                            ))
                        : AppWidgetSize().imageUrlS3(dataUser2.imageUrl.toString()),*/

                SizedBox(
                  height: 80,
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    locale.hey!,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).backgroundColor),
                  ),
                  subtitle: Text(
                    dataUser == null ? "" : dataUser.firstName.toString(),
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).primaryColor, fontSize: 20),
                  ),
                ),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: tiles.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: tiles[index].onTap as void Function()?,
                        title: Text(
                          tiles[index].title!,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).backgroundColor, fontSize: 17),
                        ),
                        /* subtitle: Text(
                          tiles[index].subtitle!,
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Theme.of(context).hintColor, fontSize: 12),
                        ),*/
                      );
                    }),
              ],
            ),
          ),
          beginOffset: Offset(0, 0.3),
          endOffset: Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
        ),
      ),
    );
  }
}
