import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/entry_field.dart';
import 'package:dj_mania/Constants/constants.dart';
import 'package:dj_mania/Drawer/Events/dj_info.dart';
import 'package:dj_mania/Drawer/Events/eventList.dart';
import 'package:dj_mania/Drawer/Events/shopers/shoperDetails.dart';
import 'package:dj_mania/Drawer/app_drawer.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/OrderMapBloc/order_map_bloc.dart';
import 'package:dj_mania/OrderMapBloc/order_map_state.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/Theme/colors.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:dj_mania/data/model/event/EventsListCategoriesModel.dart';
import 'package:dj_mania/data/model/event/eventDetailsModel.dart';
import 'package:dj_mania/data/model/event/listEventDetailsModel.dart';
import 'package:dj_mania/data/model/place/PlaceListCategoriesModel.dart';
import 'package:dj_mania/data/model/place/placeDetails.dart';
import 'package:dj_mania/data/model/place/placeListDetailsModel.dart';
import 'package:dj_mania/data/model/place/placeModelListHome.dart';
import 'package:dj_mania/utils/utils.dart';
import 'package:dj_mania/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:string_similarity/string_similarity.dart';
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
import 'package:dj_mania/data/model/categories/categoriesListModel.dart';
import 'package:dj_mania/data/model/event/eventListModel.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
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

class CategorieEvents extends StatefulWidget {
  CategorieEvents({key, required this.categorie});

  final String categorie;
  @override
  _CategorieEventsState createState() => _CategorieEventsState();
}

class Shopers {
  String image;
  String title;
  String date;
  String location;
  String price;
  String categorie;

  Shopers(this.image, this.title, this.date, this.location, this.price, this.categorie);
}

late BuildContext _context;

class _CategorieEventsState extends State<CategorieEvents> with TickerProviderStateMixin {
  late TabController _tabController;

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

            store.dispatch(getPlaceCategoriesAction(_context, id.toString()));
          }

          async();

          //stateSelectCategorie = title!;
          //setState(() {});
        },
        child: Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
                color: stateSelectCategorie != title ? AppColors().textColorGeneral.withOpacity(0.5) : AppColors().textColorGeneral),
            borderRadius: BorderRadius.all(Radius.circular(10) //                 <--- border radius here
                ),
          ),
          child: Text(
            title!,
            style: TextStyle(
                fontSize: 15.0,
                color: stateSelectCategorie == title ? AppColors().textColorGeneral : AppColors().textColorGeneral.withOpacity(0.5)),
          ),
        ));
  }

  String stateSelectCategorie = "";
  String searchEvent = "";

  @override
  Widget build(BuildContext context) {
    _context = context;
    var locale = AppLocalizations.of(context);
    List<Shopers> events = [
      Shopers("https://cdn.pixabay.com/photo/2017/09/12/00/40/roller-skating-2740936_1280.jpg", 'Roller disco', '12 de julio', 'Cartagena',
          '80.000', "Disco"),
      Shopers("https://cdn.pixabay.com/photo/2017/12/29/12/41/bar-3047514_1280.jpg", 'lovumba', '30 de enero', 'Barranquilla', '120.000',
          "Disco"),
      Shopers("https://cdn.pixabay.com/photo/2018/06/17/10/38/artist-3480274_1280.jpg", 'ene', '20 de agosto', 'Medellin', '210.000',
          "Cultural"),
    ];

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
        appBar: AppWidgetSize().appBar(title: "Categorie: " + widget.categorie.toString()),
        body: SafeArea(
            //   margin: EdgeInsets.only(left: 20, right: 20),
            child: ListView(
          children: [
            bodyEvents(events),
          ],
        )));
  }

  Widget bodyEvents(var events) {
    return ListView(
      shrinkWrap: true,
      children: [
        /*  stateSelectCategorie != ""
            ? ReduxHome.store!.state.postsState.eventsListCategoriesModel == null
                ? AppWidgetSize().loadingWidget()
                : ReduxHome.store!.state.postsState.eventsListCategoriesModel!.page == null
                    ? AppWidgetSize().noResult()
                    : ReduxHome.store!.state.postsState.eventsListCategoriesModel!.page!.length == 0
                        ? Text("No hay resultados", style: TextStyle(fontSize: 15.0, color: Colors.white))
                        : Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                // cacheExtent: 9999,
                                // physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: ReduxHome.store!.state.postsState.eventsListCategoriesModel!.page!.length,
                                itemBuilder: (context, index) {
                                  PageEventCategorie eventCategorie =
                                      ReduxHome.store!.state.postsState.eventsListCategoriesModel!.page![index];
                                  Widget data = itemEventCategoriesSearch(context, eventCategorie);
                                  return data;
                                }))
            :*/
        SizedBox(
          height: 10.sp,
        ),
        /*  ReduxHome.store!.state.postsState.listEventDetails!.length == 0
            ? Text("No hay resultados", style: TextStyle(fontSize: 15.0, color: AppColors().textColorGeneral))
            : Expanded(
                child: ListView.builder(
                    //  physics: ClampingScrollPhysics(),
                    // cacheExtent: 9999,
                    physics: NeverScrollableScrollPhysics(),
                    // scrollDirection: Axis.vertical,

                    shrinkWrap: true,
                    itemCount: ReduxHome.store!.state.postsState.listEventDetails!.length,
                    itemBuilder: (context, index) {
                      Widget data = AppWidgetSize().itemEventSearch(context, ReduxHome.store!.state.postsState.listEventDetails![index]);
                      ListEventDetailsModel dataResult = ReduxHome.store!.state.postsState.listEventDetails![index];

                      searchCategorie() {
                        if (stateSelectCategorie == "All") {
                          data = AppWidgetSize().itemEventSearch(context, dataResult);
                        } else {
                          if (stateSelectCategorie == dataResult.name) {
                            data = AppWidgetSize().itemEventSearch(context, dataResult);
                          } else {
                            data = SizedBox();
                          }
                        }
                      }

                      if (searchEvent.trim().length == 0) {
                        if (stateSelectCategorie == "") {
                          data = AppWidgetSize().itemEventSearch(context, dataResult);
                        } else {
                          searchCategorie();
                        }
                      } else {
                        print("prueba34: " + (searchEvent.toLowerCase().similarityTo(dataResult.name!.toLowerCase()).toString()));
                        if (searchEvent.toLowerCase().similarityTo(dataResult.name!.toLowerCase()) >= 0.2) {
                          if (stateSelectCategorie == "") {
                            data = AppWidgetSize().itemEventSearch(context, dataResult);
                          } else {
                            searchCategorie();
                          }
                        } else {
                          data = SizedBox();
                        }
                      }
                      if (dataResult.featured == true) {
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
        ReduxHome.store!.state.postsState.listEventDetails == null
            ? AppWidgetSize().loadingWidget()
            : ReduxHome.store!.state.postsState.listEventDetails!.length == 0
                ? Text("No hay resultados", style: TextStyle(fontSize: 15.0, color: AppColors().textColorGeneral))
                : Expanded(
                    child: ListView.builder(
                        //  physics: ClampingScrollPhysics(),
                        // cacheExtent: 9999,
                        // scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: ReduxHome.store!.state.postsState.listEventDetails!.length,
                        itemBuilder: (context, index) {
                          Widget data =
                              AppWidgetSize().itemEventSearch(context, ReduxHome.store!.state.postsState.listEventDetails![index]);
                          ListEventDetailsModel dataResult = ReduxHome.store!.state.postsState.listEventDetails![index];

                          searchCategorie() {
                            if (widget.categorie == dataResult.name) {
                              data = AppWidgetSize().itemEventSearch(context, dataResult);
                            } else {
                              data = SizedBox();
                            }
                          }

                          searchCategorie();
                          /*  Widget result = SizedBox();
                          if (dataResult.featured == false) {
                            DateTime now = DateTime.now();
                            int resultDay = now.difference(dataResult.dateTimeEvent! /*.add(Duration(days: 31))*/ !).inDays;
                            print("resultado: " + resultDay.toString());

                            bool daysExclusive2 = false;
                            if (resultDay <= 7) {
                              result = data;
                            }
                          } else {}
                          return result;*/
                          return data;

                          /*return Text(
                                                  "data",
                                                  style: TextStyle(color: Colors.white),
                                                );*/
                        }),
                  ),*/
        ReduxHome.store!.state.postsState.listEventDetails == null
            ? AppWidgetSize().loadingWidget()
            : ReduxHome.store!.state.postsState.listEventDetails!.length == 0
                ? Text("No hay resultados", style: TextStyle(fontSize: 15.0, color: AppColors().textColorGeneral))
                : Expanded(
                    child: ListView.builder(
                        //  physics: ClampingScrollPhysics(),
                        // cacheExtent: 9999,
                        // scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: ReduxHome.store!.state.postsState.listEventDetails!.length,
                        itemBuilder: (context, index) {
                          Widget data = SizedBox();
                          ListEventDetailsModel dataResult = ReduxHome.store!.state.postsState.listEventDetails![index];

                          searchCategorie() {
                            print("resultadoresponde: " + widget.categorie + " : " + dataResult.toJson().toString());
                            if (widget.categorie == dataResult.categories) {
                              data = AppWidgetSize().itemEventSearch(context, dataResult);
                            } else {
                              data = SizedBox();
                            }
                          }

                          Widget result = SizedBox();
                          if (dataResult.featured == false) {
                            DateTime now = DateTime.now();
                            int resultDay = now.difference(dataResult.dateTimeEvent! /*.add(Duration(days: 31))*/ !).inDays;
                            print("resultadoresponde: " + resultDay.toString());

                            bool daysExclusive2 = false;
                            if (resultDay <= 7) {
                            } else {
                              searchCategorie();
                            }
                          } else {}
                          return data;

                          /*return Text(
                                                  "data",
                                                  style: TextStyle(color: Colors.white),
                                                );*/
                        }),
                  )
      ],
    );
  }

  Widget itemListView(BuildContext context, PlaceListModel data) {
    String urlImage = "";
    PlaceDetailsModel data2 = PlaceDetailsModel();
    return GestureDetector(
      onTap: () {
        /* Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShopDetailPage(
                    data: data2,
                    imageUrl: urlImage,
                  )),
        );*/
        // Navigator.pushNamed(context, PageRoutes.eventDetail);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(color: Colors.white38, borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                /*  Column(
                  children: [
                    urlImage == ""
                        ? ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                            child: Image.network(
                              urlImage,
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ))
                        : SizedBox()
                  ],
                ),*/
                FutureBuilder(
                  future: endPointApi().getPlaceDetailsEndpoint(data.id.toString()),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot snapshot,
                  ) {
                    print(snapshot.connectionState);
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(height: 120);
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Text('Error');
                      } else if (snapshot.hasData) {
                        data2 = placeDetailsModelFromJson(snapshot.data!.data);
                        // EventDetailsModel? data = eventDetailsModelFromJson(jsonEncode(snapshot.data!.toString()));
                        //  print("prueba57" + snapshot.data!.data.toString());

                        //kkk
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*   urlImage == ""
                                ? SizedBox()
                                : */
                            data2!.bannerUrl.toString() == "null"
                                ? SizedBox()
                                : FutureBuilder<MyHttpResponse>(
                                    future: endPointApi().getUrlS3Endpoint(data2!.bannerUrl.toString()),
                                    builder: (
                                      BuildContext context,
                                      AsyncSnapshot<MyHttpResponse> snapshot,
                                    ) {
                                      print(snapshot.connectionState);
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return Container(height: 120);
                                      } else if (snapshot.connectionState == ConnectionState.done) {
                                        if (snapshot.hasError) {
                                          return Container(height: 120);
                                        } else if (snapshot.hasData) {
                                          urlImage = snapshot.data!.data.toString();
                                          /*  ReduxHome.store?.dispatch(
          SetPostsStateActionHome(
            PostsStateHome(listCategories: ),
          ),
        );*/
                                          return ClipRRect(
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                                              child: Image.network(
                                                snapshot.data!.data.toString(),
                                                height: 120,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ));
                                        } else {
                                          return Container(height: 120);
                                        }
                                      } else {
                                        return Container(height: 120);
                                      }
                                    },
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                                dense: true,
                                // leading: Image.asset(Assets.djPin, scale: 4, color: Color(0xff4B7AD0)),
                                title: Text(
                                  data.name.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontSize: 20, color: Theme.of(context).backgroundColor),
                                )),
                            ListTile(
                              dense: true,
                              // leading: Image.asset(Assets.djPin, scale: 4, color: Color(0xff4B7AD0)),
                              title: Text(
                                data2.address.toString(),
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14, color: Colors.white),
                              ),
                              subtitle: Text(data2.description.toString(),
                                  style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10, color: Colors.white)),
                              //trailing:
                              //  Text('2.3 km ', style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10, color: Colors.white)),
                            ),
                          ],
                        );

                        //print("prueba57" + snapshot.data.toString());
                      } else {
                        EventDetailsModel? data = eventDetailsModelFromJson(jsonEncode(snapshot.data!.toString()));
                        print("prueba57" + snapshot.data!.data.toString());

                        //kkk
                        return FutureBuilder<MyHttpResponse>(
                          future: endPointApi().getUrlS3Endpoint(data.bannerUrl.toString()),
                          builder: (
                            BuildContext context,
                            AsyncSnapshot<MyHttpResponse> snapshot,
                          ) {
                            print(snapshot.connectionState);
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Container(height: 120);
                            } else if (snapshot.connectionState == ConnectionState.done) {
                              if (snapshot.hasError) {
                                return Container(height: 120);
                              } else if (snapshot.hasData) {
                                return ClipRRect(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                                    child: Image.network(
                                      snapshot.data!.data.toString(),
                                      height: 175,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ));
                              } else {
                                return Container(height: 120);
                              }
                            } else {
                              return Container(height: 120);
                            }
                          },
                        );
                      }
                    } else {
                      return Container(height: 120);
                    }
                  },
                ),
                Container(
                  height: 120,
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

  Widget itemListViewItemCategorie(BuildContext context, PagePlaceCategorie? data) {
    String urlImage = "";

    return GestureDetector(
      onTap: () {
        /*  Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShopDetailPage(
                    data: data,
                  )),
        );*/
        // Navigator.pushNamed(context, PageRoutes.eventDetail);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(color: Colors.white38, borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                /*  Column(
                  children: [
                    urlImage == ""
                        ? ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                            child: Image.network(
                              urlImage,
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ))
                        : SizedBox()
                  ],
                ),*/

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                            height: 120,
                            width: 120,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: data!.urlConverterBanner.toString(),
                              placeholder: (context, url) => Container(
                                height: 120,
                              ),
                              errorWidget: (context, url, error) =>
                                  Container(height: 150, color: Colors.white30, width: double.infinity, child: Icon(Icons.error)),
                            ))),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          data.name.toString(),
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20, color: Theme.of(context).backgroundColor),
                        )),
                    ListTile(
                      dense: true,
                      // leading: Image.asset(Assets.djPin, scale: 4, color: Color(0xff4B7AD0)),
                      title: Text(
                        data.address.toString(),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14, color: Colors.white),
                      ),
                      subtitle: Text(data.description.toString(),
                          style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10, color: Colors.white)),
                      //trailing:
                      //  Text('2.3 km ', style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10, color: Colors.white)),
                    ),
                  ],
                ),
                Container(
                  height: 120,
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

  Widget itemListViewItem(BuildContext context, ListPlaceDetailsModel data) {
    String urlImage = "";

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShopDetailPage(
                    data: data,
                  )),
        );
        // Navigator.pushNamed(context, PageRoutes.eventDetail);
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 10),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                    height: 100.sp,
                    width: 85.sp,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: data.urlImageConverter.toString(),
                      placeholder: (context, url) => Container(height: 120, width: 120, color: Colors.white38),
                      errorWidget: (context, url, error) =>
                          Container(height: 100.sp, width: 85.sp, color: Colors.white30, child: Icon(Icons.error)),
                    ))),
            SizedBox(
              width: 10,
            ),

            /*  Column(
                  children: [
                    urlImage == ""
                        ? ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                            child: Image.network(
                              urlImage,
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ))
                        : SizedBox()
                  ],
                ),*/

            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: Text(
                  data.name.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: 20, color: AppColors().textColorGeneral, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  data.address.toString(),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14, color: AppColors().textColorGeneral),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(data.description.toString(),
                    style:
                        Theme.of(context).textTheme.caption!.copyWith(fontSize: 10, color: AppColors().textColorGeneral.withOpacity(0.5))),
                /* ListTile(
                  dense: true,
                  // leading: Image.asset(Assets.djPin, scale: 4, color: Color(0xff4B7AD0)),
                  title: Text(
                    data.address.toString(),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14, color: Colors.white),
                  ),
                  subtitle: Text(data.description.toString(),
                      style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10, color: Colors.white)),
                  //trailing:
                  //  Text('2.3 km ', style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10, color: Colors.white)),
                ),*/
              ],
            )),
          ],
        ),
      ),
    );
  }

  getEvents() {
    async() async {
      // BuildContext? context = null;
      Store<AppState> store = await createStore(api: endPointApi());

      store.dispatch(getPlacesAction(_context));
      store.dispatch(categoriesAction(_context, "2"));
    }

    //  async();
  }

  @override
  void initState() {
    Timer.run(() {
      _tabController = TabController(
        initialIndex: 0,
        length: 3,
        vsync: this,
      );
      setState(() {});
      getEvents();

      // you have a valid context here
    });
  }
}
