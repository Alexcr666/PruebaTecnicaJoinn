import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:badges/badges.dart';
import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/carStore.dart';
import 'package:dj_mania/Components/entry_field.dart';
import 'package:dj_mania/Constants/constants.dart';
import 'package:dj_mania/Drawer/Calendar/calendarPage.dart';
import 'package:dj_mania/Drawer/Events/allEvents/allEvents2.dart';
import 'package:dj_mania/Drawer/Events/dj_info.dart';
import 'package:dj_mania/Drawer/Events/event_detail.dart';
import 'package:dj_mania/Drawer/Events/shopers/shoperPage.dart';
import 'package:dj_mania/Drawer/Profile/my_profile.dart';
import 'package:dj_mania/Drawer/app_drawer.dart';
import 'package:dj_mania/Drawer/pay/payTickets.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/OrderMapBloc/order_map_bloc.dart';
import 'package:dj_mania/OrderMapBloc/order_map_state.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/Theme/colors.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:dj_mania/data/model/categories/categoriesListModel.dart';
import 'package:dj_mania/data/model/event/EventsListCategoriesModel.dart';
import 'package:dj_mania/data/model/event/eventDetailsModel.dart';
import 'package:dj_mania/data/model/event/eventListModel.dart';
import 'package:dj_mania/data/model/event/listEventDetailsModel.dart';
import 'package:dj_mania/data/model/place/placeDetails.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:dj_mania/utils/utils.dart';
import 'package:dj_mania/widget/widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:intl/intl.dart';
import 'package:page_view_indicators/step_page_indicator.dart';
import 'package:scroll_indicator/scroll_indicator.dart';
//import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';
import 'package:sizer/sizer.dart';
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

class ForYouEvents extends StatefulWidget {
  @override
  _ForYouEventsState createState() => _ForYouEventsState();
}

late BuildContext _context;
int totalIndicator = 0;

class Event {
  String image;
  String title;
  String date;
  String price;
  String categorie;

  Event(this.image, this.title, this.date, this.price, this.categorie);
}

class _ForYouEventsState extends State<ForYouEvents> {
  @override
  void dispose() {
    super.dispose();
  }

  String stateSelectCategorie = "";
  String stateSelectCategorieId = "";
  Widget itemCategorie({String? title, String? id}) {
    return GestureDetector(
        onTap: () {
          if (title == stateSelectCategorie) {
            stateSelectCategorie = "";
          } else {
            stateSelectCategorie = title!;
          }
          setState(() {});

          async() async {
            // BuildContext? context = null;
            Store<AppState> store = await createStore(api: endPointApi());

            store.dispatch(getEventsCategoriesAction(_context, idCategorie: id.toString(), type: "1"));
          }

          async();
        },
        child: Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: stateSelectCategorie != title ? Colors.white30 : Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10) //                 <--- border radius here
                ),
          ),
          child: Text(
            title!,
            style: TextStyle(fontSize: 15.0, color: stateSelectCategorie != title ? Colors.white30 : Colors.white),
          ),
        ));
  }

  ScrollController scrollController = ScrollController();
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  String searchEvent = "";
  late PageController _controller = PageController();
  int resultNumberFilter2 = 0;
  int resultNumberFilter3 = 0;
  @override
  Widget build(BuildContext context) {
    _context = context;
    var locale = AppLocalizations.of(context);

    return StoreProvider<AppStateHome>(
        store: ReduxHome.store!,
        child: StoreConnector<AppStateHome, dynamic>(
            converter: (store) => store.state.postsState,
            builder: (context, value) {
              List<ListEventDetailsModel>? listEventDetails = [];
              int total = 0;

              getPosition() {
                for (var i = 0; i < ReduxHome.store!.state.postsState.listEventDetails!.length; i++) {
                  if (ReduxHome.store!.state.postsState.listEventDetails![i].featured == true) {
                    total += 1;

                    listEventDetails!.add(ReduxHome.store!.state.postsState.listEventDetails![i]);
                    print("totalResponse: " + total.toString());
                  }
                }
              }

              if (ReduxHome.store!.state.postsState.listEventDetails != null) {
                getPosition();
              }

              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      //dark
                      color: AppColors().backgroundColor,
                      child: ListView(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                              color: AppColors().backgroundColorAppBar,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context!,
                                          MaterialPageRoute(builder: (context) => PayTicketsPage()),
                                        );
                                        // getEvents();
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          FadedScaleAnimation(
                                            Row(
                                              children: [
                                                Image.asset(
                                                  Assets.logo,
                                                  height: 45,
                                                  width: 45,
                                                  color: AppColors.primaryColor,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'JOINN',
                                                  style: TextStyle(fontSize: 30, color: AppColors.secondaryTextColor, letterSpacing: 1.5),
                                                ),
                                              ],
                                            ),
                                            durationInMilliseconds: 400,
                                          ),
                                        ],
                                      )),
                                  ReduxHome.store!.state.postsState.dataListCar == null
                                      ? GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context!,
                                              MaterialPageRoute(builder: (context) => CarStorePage()),
                                            );
                                          },
                                          child: Icon(CupertinoIcons.ticket, size: 40, color: AppColors().icon))
                                      : GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context!,
                                              MaterialPageRoute(builder: (context) => CarStorePage()),
                                            );
                                          },
                                          child: Badge(
                                            badgeColor: AppColors.primaryColor,
                                            badgeContent: Text(ReduxHome.store!.state.postsState.dataListCar!.length.toString()),
                                            child: Icon(CupertinoIcons.ticket, size: 40, color: AppColors().icon),
                                          ),
                                        ),
                                  // AppWidgetSize().itemProfile(context),

                                  /* CircleAvatar(
                                radius: 25.0,
                                backgroundImage: NetworkImage(ReduxHome.store!.state.postsState.userModelIdModel!.imageUrl.toString()),
                                backgroundColor: Colors.transparent,
                              )*/
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Exclusivos ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(fontSize: 19.sp, color: AppColors().textColorGeneral, fontWeight: FontWeight.bold),
                                      )),

                                  /* stateSelectCategorie != ""
                                  ? ReduxHome.store!.state.postsState.eventsListCategoriesModel == null
                                      ? AppWidgetSize().loadingWidget()
                                      : ReduxHome.store!.state.postsState.eventsListCategoriesModel!.page == null
                                          ? AppWidgetSize().noResult()
                                          : ReduxHome.store!.state.postsState.eventsListCategoriesModel!.page!.length == 0
                                              ? Text("No hay resultados", style: TextStyle(fontSize: 15.0, color: Colors.white))
                                              : Container(
                                                  height: 100,
                                                  width: double.infinity,
                                                  child: ListView.builder(
                                                      scrollDirection: Axis.horizontal,
                                                      // cacheExtent: 9999,
                                                      // physics: BouncingScrollPhysics(),
                                                      shrinkWrap: true,
                                                      itemCount: ReduxHome.store!.state.postsState.eventsListCategoriesModel!.page!.length,
                                                      itemBuilder: (context, index) {
                                                        PageEventCategorie eventCategorie =
                                                            ReduxHome.store!.state.postsState.eventsListCategoriesModel!.page![index];
                                                        Widget data = itemEventCategories(context, eventCategorie);
                                                        return data;
                                                      }))*/
                                  /* :*/ ReduxHome.store!.state.postsState.listEventDetails == null
                                      ? AppWidgetSize().loadingWidget()
                                      : ReduxHome.store!.state.postsState.listEventDetails!.length == 0
                                          ? Text("No hay resultados", style: TextStyle(fontSize: 15.0, color: AppColors().textColorGeneral))
                                          : Container(
                                              height: MediaQuery.of(context).size.height - 200,
                                              width: double.infinity,
                                              child: PageView.builder(
                                                  physics: ClampingScrollPhysics(),
                                                  // cacheExtent: 9999,
                                                  onPageChanged: (int index) {
                                                    _currentPageNotifier.value = index;
                                                  },
                                                  controller: _pageController,
                                                  //   controller: scrollController,
                                                  scrollDirection: Axis.horizontal,
                                                  // physics: BouncingScrollPhysics(),
                                                  // shrinkWrap: true,
                                                  itemCount: listEventDetails!.length,
                                                  itemBuilder: (context, index) {
                                                    Widget data = itemEvent(context, listEventDetails![index]);
                                                    ListEventDetailsModel dataResult = listEventDetails![index];

                                                    /*   searchCategorie() {
                                                  if (stateSelectCategorie == "All") {
                                                    data = itemEvent(context, dataResult);
                                                  } else {
                                                    if (stateSelectCategorie == dataResult.name) {
                                                      data = itemEvent(context, dataResult);
                                                    } else {
                                                      data = SizedBox();
                                                    }
                                                  }
                                                }

                                                if (searchEvent.trim().length == 0) {
                                                  if (stateSelectCategorie == "") {
                                                    data = itemEvent(context, dataResult);
                                                  } else {
                                                    searchCategorie();
                                                  }
                                                } else {
                                                  print("prueba34: " +
                                                      (searchEvent.toLowerCase().similarityTo(dataResult.name!.toLowerCase()).toString()));
                                                  if (searchEvent.toLowerCase().similarityTo(dataResult.name!.toLowerCase()) >= 0.2) {
                                                    if (stateSelectCategorie == "") {
                                                      data = itemEvent(context, dataResult);
                                                    } else {
                                                      searchCategorie();
                                                    }
                                                  } else {
                                                    data = SizedBox();
                                                  }
                                                }*/
                                                    if (dataResult.featured == true) {
                                                      totalIndicator += 1;
                                                      return data;
                                                    } else {
                                                      return SizedBox();
                                                    }

                                                    /*return Text(
                                                  "data",
                                                  style: TextStyle(color: Colors.white),
                                                );*/
                                                  }),
                                            ),
                                  Row(
                                    children: [
                                      Expanded(child: SizedBox()),
                                      Container(
                                        padding: const EdgeInsets.all(16.0),
                                        child: StepPageIndicator(
                                          stepColor: AppColors.primaryColor,
                                          itemCount: total,
                                          currentPageNotifier: _currentPageNotifier,
                                          size: 16,
                                          onPageSelected: (int index) {
                                            if (_currentPageNotifier.value > index) _pageController.jumpToPage(index);
                                          },
                                        ),
                                      ),
                                      Expanded(child: SizedBox()),
                                    ],
                                  ),
                                  SizedBox(height: 14.sp),
                                  AppWidgetSize().divider(),
                                  SizedBox(height: 14.sp),
                                  Container(
                                      margin: EdgeInsets.only(left: 10, right: 20),
                                      child: Text(
                                        "Destacados ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(fontSize: 19.sp, color: AppColors().textColorGeneral, fontWeight: FontWeight.bold),
                                      )),
                                  SizedBox(height: 10),
                                  ReduxHome.store!.state.postsState.listEventDetails == null
                                      ? AppWidgetSize().loadingWidget()
                                      : ReduxHome.store!.state.postsState.listEventDetails!.length == 0
                                          ? Text("No hay resultados", style: TextStyle(fontSize: 15.0, color: AppColors().textColorGeneral))
                                          : Container(
                                              height: 240.sp,
                                              width: double.infinity,
                                              child: ListView.builder(
                                                  physics: ClampingScrollPhysics(),
                                                  scrollDirection: Axis.horizontal,
                                                  // physics: BouncingScrollPhysics(),
                                                  // shrinkWrap: true,
                                                  itemCount: ReduxHome.store!.state.postsState.listEventDetails!.length,
                                                  itemBuilder: (context, index) {
                                                    Widget data = itemEventGridView(
                                                        context, ReduxHome.store!.state.postsState.listEventDetails![index], false);
                                                    ListEventDetailsModel dataResult =
                                                        ReduxHome.store!.state.postsState.listEventDetails![index];
                                                    DateTime now = DateTime.now();
                                                    int resultDay =
                                                        now.difference(dataResult.dateTimeEvent! /*.add(Duration(days: 31))*/ !).inDays;
                                                    print("resultado: " + resultDay.toString());

                                                    bool daysExclusive2 = false;

                                                    if (resultDay <= 7) {
                                                      resultNumberFilter2 += 1;
                                                      return data;
                                                    } else {
                                                      if ((index + 1) == ReduxHome.store!.state.postsState.listEventDetails!.length) {
                                                        if (resultNumberFilter2 == 0) {
                                                          return AppWidgetSize().noResult();
                                                        } else {
                                                          return SizedBox();
                                                        }
                                                      } else {
                                                        return SizedBox();
                                                      }
                                                      // return SizedBox();
                                                    }

                                                    /*return Text(
                                                  "data",
                                                  style: TextStyle(color: Colors.white),
                                                );*/
                                                  })),
                                  SizedBox(height: 14.sp),
                                  AppWidgetSize().divider(),
                                  SizedBox(height: 14.sp),
                                  Container(
                                    margin: EdgeInsets.only(left: 10, right: 20),
                                    child: Text("Hoy ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(fontSize: 19.sp, color: AppColors().textColorGeneral, fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(height: 10),
                                  ReduxHome.store!.state.postsState.listEventDetails == null
                                      ? AppWidgetSize().loadingWidget()
                                      : ReduxHome.store!.state.postsState.listEventDetails!.length == 0
                                          ? Text("No hay resultados", style: TextStyle(fontSize: 15.0, color: AppColors().textColorGeneral))
                                          : Container(
                                              height: 190.sp,
                                              width: double.infinity,
                                              child: ListView.builder(
                                                  physics: ClampingScrollPhysics(),
                                                  scrollDirection: Axis.horizontal,
                                                  // physics: BouncingScrollPhysics(),
                                                  // shrinkWrap: true,
                                                  itemCount: ReduxHome.store!.state.postsState.listEventDetails!.length,
                                                  itemBuilder: (context, index) {
                                                    Widget data = itemEventGridView(
                                                        context, ReduxHome.store!.state.postsState.listEventDetails![index], true);
                                                    ListEventDetailsModel dataResult =
                                                        ReduxHome.store!.state.postsState.listEventDetails![index];

                                                    DateTime? dateData = dataResult.dateTimeEvent;
                                                    DateTime now = DateTime.now();

                                                    print("resulthoy: " +
                                                        (index + 1).toString() +
                                                        " : " +
                                                        ReduxHome.store!.state.postsState.listEventDetails!.length.toString());
                                                    if (dateData!.year.toString() == now.year.toString() &&
                                                        dateData!.month.toString() == now.month.toString() &&
                                                        dateData!.day.toString() == now.day.toString()) {
                                                      resultNumberFilter3 += 1;
                                                      return data;
                                                    } else {
                                                      if ((index + 1) == ReduxHome.store!.state.postsState.listEventDetails!.length) {
                                                        if (resultNumberFilter3 == 0) {
                                                          return AppWidgetSize().noResult();
                                                        } else {
                                                          return SizedBox();
                                                        }
                                                      } else {
                                                        return SizedBox();
                                                      }
                                                    }

                                                    /*return Text(
                                                  "data",
                                                  style: TextStyle(color: Colors.white),
                                                );*/
                                                  })),
                                ],
                              ))
                        ],
                      ));
                },
              );
            }));
  }
}

Widget itemEventCalendar(BuildContext context, EventListHomeModel data, {bool? calendar}) {
  String urlImage = "";
  Widget itemInfoEvent(PlaceDetailsModel? data2, bool info) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              info != true ? "" : data.name.toString(),
              style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20, color: Theme.of(context).backgroundColor),
            ),
            Expanded(child: SizedBox()),
            Text(
              info != true ? "" : '\$ ' + "100",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).primaryColor, fontSize: 18),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        ListTile(
          dense: true,
          leading: Image.asset(Assets.djPin, scale: 4, color: Color(0xff4B7AD0)),
          title: Text(
            info != true ? "" : data2!.name.toString(),
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14, color: Colors.white),
          ),
          subtitle: Text(info != true ? "" : data2!.address.toString(),
              style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10, color: Colors.white)),
          //   trailing: Text('2.3 km ' + "",
          //     style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10, color: Colors.white)),
        ),
      ],
    );
  }

  return GestureDetector(
    onTap: () {
      /* Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EventDetailPage(
                  data: data,
                  urlImage: urlImage,
                )),
      );*/
      // Navigator.pushNamed(context, PageRoutes.eventDetail);
      // kkk
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(color: Colors.white38, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              /* Column(
                children: [
                  urlImage == ""
                      ? Image.network(
                          urlImage,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : SizedBox()
                ],
              ),*/
              FutureBuilder(
                future: endPointApi().getEventDetailsEndpoint(data.id.toString()),
                builder: (
                  BuildContext context,
                  AsyncSnapshot snapshot,
                ) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      height: 150,
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Container(height: 150, child: Text('Error'));
                    } else if (snapshot.hasData) {
                      EventDetailsModel? data = eventDetailsModelFromJson(snapshot.data!.data);
                      // EventDetailsModel? data = eventDetailsModelFromJson(jsonEncode(snapshot.data!.toString()));

                      //kkk

                      return /*data.bannerUrl.toString() == "null"
                          ? SizedBox()
                          : */
                          Column(
                        children: [
                          FutureBuilder(
                            future: endPointApi().getPlaceDetailsEndpoint(data.placeId.toString()),
                            builder: (
                              BuildContext context,
                              AsyncSnapshot snapshot,
                            ) {
                              print(snapshot.connectionState);
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return SizedBox();
                              } else if (snapshot.connectionState == ConnectionState.done) {
                                if (snapshot.hasError) {
                                  return const Text('Error');
                                } else if (snapshot.hasData) {
                                  PlaceDetailsModel data2 = placeDetailsModelFromJson(snapshot.data!.data);

                                  return itemInfoEvent(data2, true);
                                } else {
                                  PlaceDetailsModel data2 = placeDetailsModelFromJson(snapshot.data!.data);

                                  return itemInfoEvent(data2, true);
                                }
                              } else {
                                return itemInfoEvent(null, false);
                              }
                            },
                          ),
                        ],
                      );

                      //print("prueba57" + snapshot.data.toString());
                    } else {
                      EventDetailsModel? data = eventDetailsModelFromJson(jsonEncode(snapshot.data!.toString()));
                      print("prueba57" + snapshot.data!.data.toString());

                      //kkk
                      return /*urlImage == ""
                          ? ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                              child: snapshot.data!.data.toString() == "null"
                                  ? AppWidgetSize().noImage()
                                  : Image.network(
                                      snapshot.data!.data.toString(),
                                      height: 175,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ))
                          : */

                          Column(
                        children: [
                          //   Container(height: 150),
                          FutureBuilder(
                            future: endPointApi().getPlaceDetailsEndpoint(data.placeId.toString()),
                            builder: (
                              BuildContext context,
                              AsyncSnapshot snapshot,
                            ) {
                              print(snapshot.connectionState);
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return SizedBox();
                              } else if (snapshot.connectionState == ConnectionState.done) {
                                if (snapshot.hasError) {
                                  return const Text('Error');
                                } else if (snapshot.hasData) {
                                  PlaceDetailsModel data2 = placeDetailsModelFromJson(snapshot.data!.data);

                                  return itemInfoEvent(data2, true);
                                } else {
                                  PlaceDetailsModel data2 = placeDetailsModelFromJson(snapshot.data!.data);

                                  return itemInfoEvent(data2, true);
                                }
                              } else {
                                return itemInfoEvent(null, false);
                              }
                            },
                          ),
                        ],
                      );
                    }
                  } else {
                    return Container(height: 150);
                  }
                },
              ),
              /*  ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                  child: Image.network(
                    data.id.toString(),
                    height: 175,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),*/
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
                  Colors.black38,
                  transparentColor,
                  transparentColor,
                ])),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget itemEventGridView(BuildContext context, ListEventDetailsModel data, bool size, {bool? calendar}) {
  String urlImage = "";
  String title = "";
  if (data.price.toString() == "null") {
    print("execute1");
    title = "0";
  } else {
    title = data.price.toString();
    print("execute2");
  }
  Widget itemInfoEvent(PlaceDetailsModel? data2, bool info) {
    return Container(
        child: Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              info != true ? "" : data.name.toString(),
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontSize: 17, color: AppColors().textColorGeneral, fontWeight: FontWeight.bold),
            ),
            Text(
              info != true ? "0" : '\$ ' + converterMoney(title.toString()).toString(),
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.primaryColor, fontSize: 12.sp),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              info != true ? "" : DateFormat(DateFormat.YEAR_MONTH_DAY, 'Es').format(data.dateTimeEvent!.toUtc()).toString(),
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors().textColorGeneral.withOpacity(0.5), fontSize: 10.sp),
            )
            /*Text(
              info != true ? "" : data2!.name.toString(),
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white30, fontSize: 13),
            ),*/
          ],
        ),
        /* ListTile(
          //dense: true,
          //   leading: Image.asset(Assets.djPin, scale: 4, color: Color(0xff4B7AD0)),
          title: Text(
            info != true ? "" : data2!.name.toString(),
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 10, color: Colors.white),
          ),
          subtitle: Text(info != true ? "" : data2!.address.toString(),
              style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 8, color: Colors.white)),
        ),*/
      ],
    ));
  }

  return Container(
      width: size == true ? 130.sp : 170.sp,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EventDetailPage(
                      data: data,
                      price: title.toString(),
                    )),
          );
          // Navigator.pushNamed(context, PageRoutes.eventDetail);
          // kkk
        },
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  data.urlImageConverter == ""
                      ? Container(height: 150, child: AppWidgetSize().noImage())
                      : Container(
                          height: size == true ? 140.sp : 190.sp,
                          width: size == true ? 150.sp : 170.sp,
                          child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: data.urlImageConverter.toString(),
                                placeholder: (context, url) => Container(
                                  height: 130,
                                  width: double.infinity,
                                  color: AppColors.imageBackground,
                                ),
                                errorWidget: (context, url, error) => Container(
                                  height: 150,
                                  width: double.infinity,
                                  child: Icon(Icons.error),
                                  color: AppColors.imageBackground,
                                ),
                              )),
                        ),
                  itemInfoEvent(data.placeDetailsModel, true),
                ],
              ),
            ],
          ),
        ),
      ));
}

Widget itemEvent(BuildContext context, ListEventDetailsModel data, {bool? calendar}) {
  String urlImage = "";
  String title = "";
  if (data.price.toString() == "null") {
    print("execute1");
    title = "0";
  } else {
    title = data.price.toString();
    print("execute2");
  }
  print("urlgrid: " + data.urlImageConverter.toString());
  Widget itemInfoEvent(PlaceDetailsModel? data2, bool info) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /*CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(data.placeDetailsModel!.logoUrl.toString()),
              backgroundColor: AppColors.imageBackground,
            ),*/

            Flexible(
                child: Row(
              children: [
                Container(
                    height: 60,
                    width: 60,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        child: AppWidgetSize().imageUrlS3(data.placeDetailsModel!.logoUrl.toString()))),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      info != true ? "" : data.name.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontSize: 13.sp, color: AppColors().textColorGeneral, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text(
                      info != true ? "" : DateFormat(DateFormat.YEAR_MONTH_DAY, 'Es').format(data.dateTimeEvent!.toUtc()).toString(),
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 9.sp, color: AppColors().textColorGeneral.withOpacity(0.5)),
                    ),
                  ],
                )
              ],
            )),
            Text(
              info != true ? "0" : '\$ ' + converterMoney(title.toString()).toString(),
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors().textColorGeneral, fontSize: 18),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          info != true ? "" : data2!.name.toString(),
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14, color: AppColors().textColorGeneral),
        ),
        SizedBox(
          height: 5,
        ),
        Text(info != true ? "" : data.description.toString(),
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 11.sp, color: AppColors().textColorGeneral)),

        /*ListTile(
          //dense: true,
          //   leading: Image.asset(Assets.djPin, scale: 4, color: Color(0xff4B7AD0)),
          title: Text(
            info != true ? "" : data2!.name.toString(),
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14, color: Colors.white),
          ),
          subtitle: Text(info != true ? "" : data2!.address.toString(),
              style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10, color: Colors.white)),
        ),*/
      ],
    ));
  }

  return Container(
      width: MediaQuery.of(context).size.width - 40,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EventDetailPage(
                      data: data,
                      price: title.toString(),
                    )),
          );
          // Navigator.pushNamed(context, PageRoutes.eventDetail);
          // kkk
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  calendar == true
                      ? SizedBox()
                      : /* ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                          child:*/
                      /*     data.urlImageConverter == ""
                          ? Container(height: 150, child: AppWidgetSize().noImage())
                          : */
                      ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Container(
                              // color: Colors.white30,
                              height: MediaQuery.of(context).size.height - 360,
                              width: double.infinity,
                              child: CachedNetworkImage(
                                // imageUrl:  "https://joinnbuckettest.s3.amazonaws.com/event/banner_2/3.jpg?AWSAccessKeyId=AKIAY2NUS2H2Y4GVZ3GK&Expires=1666932541&Signature=snMuQVzW1xSHRiGbp71cI7JFcio%3D",

                                width: double.infinity,
                                fit: BoxFit.cover,
                                imageUrl: data.urlImageConverter.toString(),
                                placeholder: (context, url) => Container(
                                  height: 300,
                                  color: AppColors.imageBackground,
                                ),
                                errorWidget: (context, url, error) => Container(
                                  height: 150,
                                  width: double.infinity,
                                  child: Icon(Icons.error),
                                  color: AppColors.imageBackground,
                                ),
                              ))),
                  itemInfoEvent(data.placeDetailsModel, true),
                ],
              ),
            ],
          ),
        ),
      ));
}

Widget itemEventCategories(BuildContext context, PageEventCategorie data, {bool? calendar}) {
  /* String urlImage = "";
  String title = "";
  if (data.price.toString() == "null") {
    print("execute1");
    title = "0";
  } else {
    title = data.price.toString();
    print("execute2");
  }
  
  Widget itemInfoEvent() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              data.name.toString(),
              style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20, color: Theme.of(context).backgroundColor),
            ),
            Expanded(child: SizedBox()),
            Text(
              converterMoney(title.toString()).toString(),
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).primaryColor, fontSize: 18),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        ListTile(
          dense: true,
          leading: Image.asset(Assets.djPin, scale: 4, color: Color(0xff4B7AD0)),
          title: Text(
            data!.name.toString(),
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14, color: Colors.white),
          ),
          subtitle: Text(data!.name.toString(), style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10, color: Colors.white)),
          //   trailing: Text('2.3 km ' + "",
          //     style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10, color: Colors.white)),
        ),
      ],
    );
  }

  return GestureDetector(
    onTap: () {
      /* Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EventDetailPage(
                  data: data,
                  price: title.toString(),
                )),
      );*/
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(color: AppColors().textColorGeneral, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  calendar == true
                      ? SizedBox()
                      : /*ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                          child: */
                      data.urlConverterBanner == ""
                          ? Container(height: MediaQuery.of(context).size.height - 300, child: AppWidgetSize().noImage())
                          : Container(
                              height: MediaQuery.of(context).size.height - 300,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: data.urlConverterBanner.toString(),
                                placeholder: (context, url) => Container(height: MediaQuery.of(context).size.height - 300),
                                errorWidget: (context, url, error) => Container(height: 150, child: Icon(Icons.error)),
                              ),
                            ),
                  itemInfoEvent(),
                ],
              ),
              calendar == true
                  ? SizedBox()
                  : Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
                        Colors.black38,
                        transparentColor,
                        transparentColor,
                      ])),
                    ),
            ],
          ),
        ],
      ),
    ),
  );*/
  String urlImage = data.urlConverterLogo.toString();
  String title = data.name.toString();
  if (data.price.toString() == "null") {
    print("execute1");
    title = "0";
  } else {
    title = data.price.toString();
    print("execute2");
  }
  DateTime now = DateTime.now();
  int resultDay = now.difference(data.dateTimeEvent! /*.add(Duration(days: 31))*/ !).inDays;
  print("resultado: " + resultDay.toString());
  bool? daysExclusive = data.featured;
  bool daysExclusive2 = false;
  if (resultDay <= 7) {
    daysExclusive2 = true;
  }

  Widget itemInfoEvent(bool info) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          info != true ? "" : data.name.toString() /* + ": " + data.featured.toString()*/,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontSize: 14.sp, color: data.featured == true ? Colors.grey : AppColors().textColorGeneral, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          info != true ? "0" : '\$ ' + converterMoney(title.toString()).toString(),
          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.primaryColor, fontSize: 12.sp),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          info != true ? "" : DateFormat(DateFormat.YEAR_MONTH_DAY, 'Es').format(data.dateTimeEvent!.toUtc()).toString(),
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 14, color: data.featured == true ? Colors.grey : AppColors().textColorGeneral.withOpacity(0.5)),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          info != true ? "" : data!.name.toString(),
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 14, color: data.featured == true ? Colors.grey : AppColors().textColorGeneral.withOpacity(0.5)),
        ),
        Text(info != true ? "" : data!.placeName.toString(),
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontSize: 10, color: data.featured == true ? Colors.grey : AppColors().textColorGeneral.withOpacity(0.5))),
        /*  ListTile(
            //dense: true,
            //   leading: Image.asset(Assets.djPin, scale: 4, color: Color(0xff4B7AD0)),
            title: Text(
              info != true ? "" : data2!.name.toString(),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14, color: Colors.white),
            ),
            subtitle: Text(info != true ? "" : data2!.address.toString(),
                style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10, color: Colors.white)),
          ),*/
      ],
    ));
  }

  return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: data.featured == true
                ? Colors.yellow
                : daysExclusive2 == true
                    ? Colors.redAccent
                    : Colors.transparent,
            width: 2),
        color: data.featured == true ? AppColors().textColorGeneral : Colors.transparent,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),

      // color: AppColors().textColorGeneral,
      child: GestureDetector(
        onTap: () {
          /* Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EventDetailPage(
                        data: data,
                        price: title.toString(),
                      )),
            );*/
          // Navigator.pushNamed(context, PageRoutes.eventDetail);
          // kkk
        },
        child: Container(
          child: Row(
            children: [
              data.urlConverterBanner == ""
                  ? Container(height: 100.sp, width: 85.sp, child: AppWidgetSize().noImage())
                  : Container(
                      height: 100.sp,
                      width: 85.sp,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: data.urlConverterBanner.toString(),
                            placeholder: (context, url) => Container(
                                  height: 100,
                                  width: 100,
                                  color: Colors.white30,
                                ),
                            errorWidget: (context, url, error) => Container(
                                  height: 150,
                                  color: Colors.white30,
                                  width: double.infinity,
                                  child: Icon(Icons.error),
                                )),
                      )),
              SizedBox(
                width: 20,
              ),
              itemInfoEvent(true),
            ],
          ),
        ),
      ));
}

getEvents() {
  async() async {
    // BuildContext? context = null;
    Store<AppState> store = await createStore(api: endPointApi());

    store.dispatch(getEventsAction(_context));
    store.dispatch(categoriesAction(_context, "1"));
  }

  // async();
}

@override
void initState() {
  Timer.run(() {
    getEvents();

    // you have a valid context here
  });
}

class AllEventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapBloc>(
      create: (context) => OrderMapBloc()..loadMap(),
      child: AllEventsBody(),
    );
  }
}
