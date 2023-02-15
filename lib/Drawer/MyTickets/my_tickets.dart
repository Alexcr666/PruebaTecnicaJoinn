import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/my_ticket.dart';
import 'package:dj_mania/Components/mytickets.dart';
import 'package:dj_mania/Drawer/app_drawer.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:dj_mania/data/model/purchase/PurchaseFilterModel.dart';
import 'package:dj_mania/data/model/purchase/PurchaseUserTicketsDetailsModel.dart';
import 'package:dj_mania/data/model/purchase/PurchaseUserTicketsModel.dart';
import 'package:flutter/material.dart';
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
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
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
import 'package:sizer/sizer.dart';

class MyTicketsPage extends StatefulWidget {
  @override
  _MyTicketsPageState createState() => _MyTicketsPageState();
}

class _MyTicketsPageState extends State<MyTicketsPage> {
  @override
  Widget build(BuildContext context) {
    Future<Null> _refreshLocalGallery() async {
      print('refreshing stocks...');

      getTicketsUser();
    }

    Widget ticketDisable() {
      return StoreProvider<AppStateHome>(
          store: ReduxHome.store!,
          child: StoreConnector<AppStateHome, dynamic>(
              converter: (store) => store.state.postsState,
              //  distinct: false,
              builder: (context, value) {
                return ListView(
                  children: [
                    SizedBox(
                      height: 10.sp,
                    ),
                    ReduxHome.store!.state.postsState.purchaseFiltersModel == null
                        ? CircularProgressIndicator()
                        : ReduxHome.store!.state.postsState.purchaseFiltersModel!.length == 0
                            ? AppWidgetSize().noResult()
                            : ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                reverse: true,
                                itemCount: ReduxHome.store!.state.postsState.purchaseFiltersModel!.length,
                                itemBuilder: (context, index) {
                                  PurchaseFiltersModel data = ReduxHome.store!.state.postsState.purchaseFiltersModel![index];

                                  var date = DateFormat('kk:mm a');

                                  return Column(children: [
                                    ListTile(
                                      leading: AppWidgetSize().imageUrlS3(data.eventLogoUrl.toString()),
                                      title: Text(
                                        data.eventName.toString().replaceAll("EventName.", "").replaceAll("_", " "),
                                        style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 14.sp),
                                      ),
                                    ),
                                    ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        reverse: true,
                                        itemCount: data.localities!.length,
                                        itemBuilder: (context, index) {
                                          Locality dataLocality = data.localities![index];

                                          return Column(
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  dataLocality.name.toString().replaceAll("Name.", "").replaceAll("_", " "),
                                                  style: TextStyle(color: AppColors.primaryColor),
                                                ),
                                              ),
                                              ListView.builder(
                                                  physics: BouncingScrollPhysics(),
                                                  shrinkWrap: true,
                                                  reverse: true,
                                                  itemCount: dataLocality.tikets!.length,
                                                  itemBuilder: (context, index) {
                                                    Tiket dataTicket = dataLocality.tikets![index];

                                                    return Column(
                                                      children: [
                                                        MyTicketList(
                                                          data: dataTicket,
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                            ],
                                          );
                                        }),
                                  ]);
                                })
                  ],
                  /*  Container(
                        color: AppColors().backgroundColor,
                        child: new Center(
                            child: ReduxHome.store!.state.postsState.purchaseUserTicketsModel == null
                                ? CircularProgressIndicator()
                                : ReduxHome.store!.state.postsState.purchaseUserTicketsModel!.page == null
                                    ? AppWidgetSize().noResult()
                                    : ReduxHome.store!.state.postsState.purchaseUserTicketsModel!.page!.length == 0
                                        ? Text("No hay resultados", style: TextStyle(fontSize: 15.0, color: AppColors().textColorGeneral))
                                        : Expanded(
                                            child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10.sp,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                      "Total tickets: " +
                                                          ReduxHome.store!.state.postsState.purchaseUserTicketsModel!.page!.length
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: AppColors().textColorGeneral,
                                                          fontWeight: FontWeight.bold)),
                                                ],
                                              ),
                                              ListView.builder(
                                                  physics: BouncingScrollPhysics(),
                                                  shrinkWrap: true,
                                                  reverse: true,
                                                  itemCount: ReduxHome.store!.state.postsState.purchaseUserTicketsModel!.page!.length,
                                                  itemBuilder: (context, index) {
                                                    PageTicketPurchase data =
                                                        ReduxHome.store!.state.postsState.purchaseUserTicketsModel!.page![index];
                                                    return Column(
                                                      children: [
                                                        ListTile(
                                                          title: Text(
                                                            data.dataDetails!.tickets![0].eventName.toString(),
                                                            style: TextStyle(color: AppColors.primaryColor),
                                                          ),
                                                        ),
                                                        ListView.builder(
                                                            physics: BouncingScrollPhysics(),
                                                            shrinkWrap: true,
                                                            itemCount: data.dataDetails!.tickets!.length,
                                                            itemBuilder: (context, index) {
                                                              Ticket dataTicket = data.dataDetails!.tickets![index];

                                                              var date = DateFormat('kk:mm a');
                                                              return MyTicketList(
                                                                dataTicket: dataTicket,
                                                                pageTicketPurchase: data,
                                                                title: dataTicket.eventName.toString(),
                                                                location: dataTicket.localityName.toString(),
                                                                date: DateFormat(DateFormat.YEAR_MONTH_DAY, 'Es')
                                                                    .format(data.datePurchase!.toUtc()),
                                                                time: date.format(data.datePurchase!.toUtc()),
                                                              );
                                                            }),
                                                      ],
                                                    );
                                                  }),
                                            ],
                                          )))),



                                          */
                );
              }));
    }

    var locale = AppLocalizations.of(context)!;

    return Scaffold(
        backgroundColor: AppColors().backgroundColor,
        //drawer: AppDrawer(),
        /*appBar: AppBar(
                  backgroundColor: AppColors().backgroundColorAppBar,
                  title: Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 25, color: AppColors.secondaryTextColor, fontWeight: FontWeight.bold),
                  ),
                ),*/
        appBar: AppWidgetSize().appBar(title: "My Tickets"),
        body: DefaultTabController(
            length: 2,
            child: SafeArea(
                //   margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          getEvents();
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /* FadedScaleAnimation(
                              Text(
                                'DECEMBER 16, 9:10 PM',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white.withOpacity(0.4), letterSpacing: 1.5),
                              ),
                              durationInMilliseconds: 400,
                            ),*/
                            /* FadedScaleAnimation(
                              Text(
                                'Explore establishment',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white, letterSpacing: 1.5),
                              ),
                              durationInMilliseconds: 400,
                            ),*/
                          ],
                        )),
                    AppWidgetSize().itemProfile(context),

                    /* ReduxHome.store!.state.postsState.userModelIdModel!.imageUrl == null
                        ? CircleAvatar(
                            radius: 25.0,
                            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                            backgroundColor: Colors.transparent,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Container(
                                height: 50,
                                width: 50,
                                child:
                                    AppWidgetSize().imageUrlS3(ReduxHome.store!.state.postsState.userModelIdModel!.imageUrl.toString()))),*/
                  ],
                ),*/

                /* Opacity(
                    opacity: 0.2,
                    child: EntryField(
                      labelText: "",
                      initialValue: 'Search',
                    )),*/

                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 38,
                  child: TabBar(
                    tabs: [
                      Text('Available'.toUpperCase(),
                          style: TextStyle(color: AppColors().textColorGeneral.withOpacity(0.5), fontSize: 12.sp)),
                      Text('Consumed'.toUpperCase(),
                          style: TextStyle(color: AppColors().textColorGeneral.withOpacity(0.5), fontSize: 12.sp)),
                    ],
                    indicator: ContainerTabIndicator(
                      widthFraction: 1,
                      color: AppColors.primaryColor,
                      height: 3,
                      padding: const EdgeInsets.only(top: 17),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                ),
                Expanded(
                  //  height: 100,
                  child: TabBarView(
                    children: [
                      ticketDisable(),
                      ticketDisable(),
                    ],
                  ),
                ),
              ],
            ))));
  }
/*
   /*StoreProvider<AppStateHome>(
        store: ReduxHome.store!,
        child: StoreConnector<AppStateHome, dynamic>(
            converter: (store) => store.state.postsState,
            distinct: false,
            builder: (context, value) {
              return*/
        Scaffold(
            backgroundColor: AppColors().backgroundColor,

            //drawer: AppDrawer(),
            appBar: AppBar(
              elevation: 0,
              centerTitle: false,
              backgroundColor: AppColors().backgroundColorAppBar,
              title: Text(
                locale.myTickets!,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: AppColors().textColorGeneral, fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            body: Column(
              children: [
                //Text(ReduxHome.store!.state.postsState.purchaseUserTicketsModel!.page.toString()),

                SizedBox(
                  height: 40,
                  child: TabBar(
                    tabs: [
                      Text('Disable'.toUpperCase(),
                          style: TextStyle(color: AppColors().textColorGeneral.withOpacity(0.5), fontSize: 12.sp)),
                      Text('Consumed'.toUpperCase(),
                          style: TextStyle(color: AppColors().textColorGeneral.withOpacity(0.5), fontSize: 12.sp)),
                    ],
                    indicator: ContainerTabIndicator(
                      widthFraction: 0.6,
                      color: AppColors.primaryColor,
                      height: 2,
                      padding: const EdgeInsets.only(top: 18),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                ),
                Expanded(
                  //  height: 100,
                  child: TabBarView(
                    children: [ticketDisable(), ticketDisable()],
                  ),
                ),
              ],
            ));
    //  }///));
  }*/

  @override
  void initState() {
    getTicketsUser();
  }

  getTicketsUser() {
    async() async {
      // BuildContext? context = null;
      Store<AppState> store = await createStore(api: endPointApi());
      print("getticket" + ReduxLogin.store!.state.postsState.userLoginModel!.id.toString());
      store.dispatch(getPurchaseFilterAction(context, "1"));
      // store.dispatch(getTicketsUserAction(context, ReduxLogin.store!.state.postsState.userLoginModel!.id.toString()));
      // store.dispatch(categoriesAction(_context, "2"));
    }

    async();
  }
}
