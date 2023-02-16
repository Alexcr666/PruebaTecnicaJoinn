import 'dart:async';
import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:badges/badges.dart';
import 'package:blur/blur.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/carStore.dart';
import 'package:dj_mania/Components/entry_field.dart';
import 'package:dj_mania/Constants/constants.dart';
import 'package:dj_mania/Drawer/Calendar/calendarPage.dart';
import 'package:dj_mania/Drawer/Camera/cameraPage.dart';
import 'package:dj_mania/Drawer/Events/book_your_tickets.dart';
import 'package:dj_mania/Drawer/Events/dj_info.dart';
import 'package:dj_mania/Drawer/Events/eventList.dart';
import 'package:dj_mania/Drawer/Events/event_detail.dart';
import 'package:dj_mania/Drawer/Events/shopers/shoperPage.dart';
import 'package:dj_mania/Drawer/MyTickets/my_tickets.dart';
import 'package:dj_mania/Drawer/Profile/my_profile.dart';
import 'package:dj_mania/Drawer/app_drawer.dart';
import 'package:dj_mania/Drawer/wallet/home.dart';
import 'package:dj_mania/Drawer/wallet/home_widget.dart';

import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/OrderMapBloc/order_map_bloc.dart';
import 'package:dj_mania/OrderMapBloc/order_map_state.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/Theme/colors.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:string_similarity/string_similarity.dart';
import 'dart:async';
import 'dart:convert';
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
import 'package:dj_mania/data/model/categories/categoriesListModel.dart';
import 'package:dj_mania/data/model/event/eventDetailsModel.dart';
import 'package:dj_mania/data/model/event/eventListModel.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:string_similarity/string_similarity.dart';

import '../../map_utils.dart';

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

import '../../map_utils.dart';

bool initLoadingData = false;

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

BuildContext? _context;

class _EventsPageState extends State<EventsPage> {
  int _selectedScreenIndex = 0;
  final List _screens = [
    {"screen": EventsPage(), "title": "Screen A Title"},
    {"screen": DJInfoPage(), "title": "Screen B Title"}
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  List<Widget> _pages = <Widget>[
    ForYouEvents(),
    ForYouShopers() /*AllEventsPage(), */ /*MyTicketsPage(), TableEventsExample()*/ /* QRViewExample()*/,
    MyTicketsPage(),
    MyProfile()
  ];

  // int _selectedIndex = 0; //New

//New
  void _onItemTapped(int index) {
    print("click");
    ReduxHome.store?.dispatch(
      SetPostsStateActionHome(
        PostsStateHome(selectedIndexTab: index),
      ),
    );
    print("selected: " + index.toString());
    if (index == 1) {
      execute() async {
        Store<AppState> store = await createStore(api: endPointApi());
        store.dispatch(categoriesAction(_context!, "2"));
      }

      execute();
    }

    /* setState(() {
      _selectedIndex = index;
    });*/
    // getEvents();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    var locale = AppLocalizations.of(context)!;
    return StoreProvider<AppStateHome>(
        store: ReduxHome.store!,
        child: StoreConnector<AppStateHome, dynamic>(
            converter: (store) => store.state.postsState,
            builder: (context, value) {
              return DefaultTabController(
                length: 2,
                child: Scaffold(
                  backgroundColor: AppColors().backgroundColor,
                  bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: AppColors().backgroundColor,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.white.withOpacity(0.5),

                    currentIndex: ReduxHome.store!.state.postsState.selectedIndexTab!, //New
                    onTap: _onItemTapped,
                    items: [
                      BottomNavigationBarItem(
                          backgroundColor: AppColors().backgroundColor,
                          icon: Icon(
                            Icons.home,
                            size: 32,
                            color: ReduxHome.store!.state.postsState.selectedIndexTab != 0 ? AppColors().icon : AppColors.primaryColor,
                          ),
                          //  label: "Events",
                          label: ""),
                      BottomNavigationBarItem(
                          backgroundColor: AppColors().backgroundColor,
                          icon: Icon(
                            Icons.search_outlined,
                            size: 32,
                            color: ReduxHome.store!.state.postsState.selectedIndexTab != 1 ? AppColors().icon : AppColors.primaryColor,
                          ),
                          // label: "Search",
                          label: ""),
                      /*  BottomNavigationBarItem(
              icon: Icon(
                Icons.event_available_outlined,
                color: _selectedIndex != 2 ? Colors.white12 : Colors.white,
                size: 32,
              ),
              label: "Events nearby",
            ),*/

                      /* BottomNavigationBarItem(
                          backgroundColor: AppColors().backgroundColor,
                          icon: Icon(
                            Icons.qr_code,
                            color: ReduxHome.store!.state.postsState.selectedIndexTab != 2 ? AppColors().icon : AppColors.primaryColor,
                            size: 36,
                          ),
                          //label: "Tickets",
                          label: ""),*/
                      BottomNavigationBarItem(
                          backgroundColor: AppColors().backgroundColor,
                          icon: Icon(
                            CupertinoIcons.ticket,
                            color: ReduxHome.store!.state.postsState.selectedIndexTab != 2 ? AppColors().icon : AppColors.primaryColor,
                            size: 36,
                          ),
                          // label: "Calendar",
                          label: ""),
                      BottomNavigationBarItem(
                          backgroundColor: AppColors().backgroundColor,
                          icon: Icon(
                            Icons.person_outline,
                            color: ReduxHome.store!.state.postsState.selectedIndexTab != 3 ? AppColors().icon : AppColors.primaryColor,
                            size: 36,
                          ),
                          label: ""
                          //  label: "Profile",
                          ),
                      /* BottomNavigationBarItem(
                        backgroundColor: Colors.black,
                        icon: Icon(
                          Icons.person_outline_outlined,
                          color: ReduxHome.store!.state.postsState.selectedIndexTab != 4 ? Colors.white12 : Colors.white,
                          size: 36,
                        ),
                        label: "Profile",
                      )*/
                    ],
                  ),
                  drawer: AppDrawer(),
                  /*appBar: AppBar(
                    backgroundColor: Colors.black,
                    centerTitle: true,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(child: SizedBox()),
                            
                          ],
                        )
                      ],
                    ),
                    /* flexibleSpace: Image.asset(
            Assets.header,
            fit: BoxFit.fill,
          ),*/
                    /*  actions: [
              GestureDetector(
                child: FadedScaleAnimation(
                  Icon(
                    Icons.map,
                    size: 20,
                    color: Theme.of(context).backgroundColor,
                  ),
                  durationInMilliseconds: 400,
                ),
              ),
              FadedScaleAnimation(
                IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 20,
                    color: Theme.of(context).backgroundColor,
                  ),
                  onPressed: () {},
                ),
                durationInMilliseconds: 400,
              ),
            ]*/
                  )*/
                  body: TabBarView(children: [
                    FadedSlideAnimation(
                      /*ForYouEvents()*/
                      Container(
                          margin: EdgeInsets.only(top: 1),
                          child: Center(
                            child: _pages.elementAt(ReduxHome.store!.state.postsState.selectedIndexTab!), //New
                          )),
                      beginOffset: Offset(0, 0.3),
                      endOffset: Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
                    ),
                    FadedSlideAnimation(
                      Center(
                        child: _pages.elementAt(ReduxHome.store!.state.postsState.selectedIndexTab!), //New
                      ),
                      beginOffset: Offset(0, 0.3),
                      endOffset: Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
                    ),
                  ]),
                ),
              );
            }));
  }

  getEvents() {
    async() async {
      // BuildContext? context = null;
      Store<AppState> store = await createStore(api: endPointApi());

      store.dispatch(getEventsAction(_context!));
      store.dispatch(categoriesAction(_context!, "1"));
      print("listlike2: ");
      store.dispatch(getListLikesAction(_context!));
      store.dispatch(getPlacesAction(_context!));

      store.dispatch(getUserIdAction(context: _context!, id: ReduxLogin.store!.state.postsState.userLoginModel!.id.toString()));
      store.dispatch(getIdentificationTypeAction(context));
      getEventsForDaySet();
      // store.dispatch(categoriesAction(_context, "2"));
    }

    if (initLoadingData == false) {
      initLoadingData = true;

      async();
    }
  }

  @override
  void initState() {
    Timer.run(() {
      getEvents();
      print("execute");

      // you have a valid context here
    });
  }
}
