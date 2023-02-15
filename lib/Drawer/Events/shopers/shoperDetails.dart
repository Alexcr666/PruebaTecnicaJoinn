import 'dart:async';
import 'dart:convert';

import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:blur/blur.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Constants/constants.dart';
import 'package:dj_mania/Drawer/Events/eventList.dart';
import 'package:dj_mania/Drawer/Events/events.dart';
import 'package:dj_mania/Drawer/Events/shopers/shoperPage.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/OrderMapBloc/order_map_bloc.dart';
import 'package:dj_mania/OrderMapBloc/order_map_state.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/Theme/colors.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:dj_mania/data/model/event/eventDetailsModel.dart';
import 'package:dj_mania/data/model/event/listEventDetailsModel.dart';
import 'package:dj_mania/data/model/place/placeDetails.dart';
import 'package:dj_mania/data/model/place/placeListDetailsModel.dart';
import 'package:dj_mania/data/model/place/placeModelListHome.dart';
import 'package:dj_mania/map_utils.dart';
import 'package:dj_mania/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:string_similarity/string_similarity.dart';
import 'dart:async';
import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blur/blur.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/entry_field.dart';
import 'package:dj_mania/Constants/constants.dart';
import 'package:dj_mania/Drawer/Events/dj_info.dart';
import 'package:dj_mania/Drawer/Events/shopers/shoperDetails.dart';
import 'package:dj_mania/Drawer/app_drawer.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/OrderMapBloc/order_map_bloc.dart';
import 'package:dj_mania/OrderMapBloc/order_map_state.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/Theme/colors.dart';
import 'package:dj_mania/data/model/place/placeModelListHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

class ShopDetailPage extends StatelessWidget {
  ShopDetailPage({key, required this.data});

  final ListPlaceDetailsModel data;
//  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapBloc>(
      create: (context) => OrderMapBloc()..loadMap(),
      child: ShopDetailBody(
        data: data,
        // imageUrl: imageUrl,
      ),
    );
  }
}

class ShopDetailBody extends StatefulWidget {
  ShopDetailBody({key, required this.data});

  final ListPlaceDetailsModel data;
//  final String imageUrl;
  @override
  _ShopDetailBodyState createState() => _ShopDetailBodyState();
}

class DJ {
  String image;
  String name;
  String time;

  DJ(this.image, this.name, this.time);
}

late BuildContext _context;

class _ShopDetailBodyState extends State<ShopDetailBody> {
  Completer<GoogleMapController> _mapController = Completer();
  GoogleMapController? mapStyleController;
  Set<Marker> _markers = {};
/*
  Widget itemEvent(BuildContext context, EventListHomeModel data) {
    String urlImage = "";

    return GestureDetector(
      onTap: () {
        /*Navigator.push(
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
                FutureBuilder(
                  future: endPointApi().getEventDetailsEndpoint(data.id.toString()),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox();
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Text('Error');
                      } else if (snapshot.hasData) {
                        EventDetailsModel? data = eventDetailsModelFromJson(snapshot.data!.data);
                        // EventDetailsModel? data = eventDetailsModelFromJson(jsonEncode(snapshot.data!.toString()));

                        //kkk
                        return data.bannerUrl.toString() == "null"
                            ? SizedBox()
                            : FutureBuilder<MyHttpResponse>(
                                future: endPointApi().getUrlS3Endpoint(data.bannerUrl.toString()),
                                builder: (
                                  BuildContext context,
                                  AsyncSnapshot<MyHttpResponse> snapshot,
                                ) {
                                  print(snapshot.connectionState);
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return SizedBox();
                                  } else if (snapshot.connectionState == ConnectionState.done) {
                                    if (snapshot.hasError) {
                                      return Text("error");
                                    } else if (snapshot.hasData) {
                                      urlImage = "";
                                      urlImage = snapshot.data!.data.toString();
                                      print("eventdetails---" + urlImage.toString());
                                      return ClipRRect(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                                          child: snapshot.data!.data.toString().length == 0
                                              ? AppWidgetSize().noImage()
                                              : Image.network(
                                                  snapshot.data!.data.toString(),
                                                  height: 175,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                ));
                                    } else {
                                      return const Text('Empty data');
                                    }
                                  } else {
                                    return Text('State: ${snapshot.connectionState}');
                                  }
                                },
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
                              return CircularProgressIndicator();
                            } else if (snapshot.connectionState == ConnectionState.done) {
                              if (snapshot.hasError) {
                                return Text("error");
                              } else if (snapshot.hasData) {
                                return ClipRRect(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                                    child: snapshot.data!.data.toString() == "null"
                                        ? AppWidgetSize().noImage()
                                        : Image.network(
                                            snapshot.data!.data.toString(),
                                            height: 175,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ));
                              } else {
                                return const Text('Empty data');
                              }
                            } else {
                              return Text('State: ${snapshot.connectionState}');
                            }
                          },
                        );
                      }
                    } else {
                      return Text('State: ${snapshot.connectionState}');
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
                  height: 175,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
                    Colors.black38,
                    transparentColor,
                    transparentColor,
                  ])),
                ),
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  start: 12,
                  bottom: 12,
                  child: Text(
                    data.name.toString(),
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20, color: Theme.of(context).backgroundColor),
                  ),
                )
              ],
            ),
            ListTile(
              dense: true,
              leading: Image.asset(Assets.djPin, scale: 4, color: Color(0xff4B7AD0)),
              title: Text(
                data.name.toString(),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14, color: Colors.white),
              ),
              subtitle: Text('2202, Marion St. Bass Hill, Amsterdam',
                  style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10, color: Colors.white)),
              trailing: Text('2.3 km ' + "", style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10, color: Colors.white)),
            ),
            SizedBox(
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 5,
                  ),
                  /* ListView.builder(
                    padding: EdgeInsets.only(bottom: 12),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: dJays.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Blur(
                                blur: index == dJays.length - 1 ? 0.4 : 0,
                                blurColor: Theme.of(context).scaffoldBackgroundColor,
                                colorOpacity: index == dJays.length - 1 ? 0.4 : 0,
                                child: CircleAvatar(
                                  radius: 10,
                                  child: Image.asset(dJays[index]),
                                ),
                              ),
                            ),
                            index == dJays.length - 1
                                ? Text(
                                    '5+',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(fontSize: 11, color: Theme.of(context).backgroundColor),
                                  )
                                : SizedBox.shrink()
                          ],
                        ),
                      );
                    }),*/
                  Spacer(
                    flex: 6,
                  ),
                  Text(
                    '\$ ' + "100",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).primaryColor, fontSize: 18),
                  ),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }*/

  Widget itemCategorie({String? title}) {
    return GestureDetector(
        onTap: () {
          if (title == stateSelectCategorie) {
            stateSelectCategorie = "";
          } else {
            stateSelectCategorie = title!;
          }
          setState(() {});
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
                color: stateSelectCategorie != title ? AppColors().textColorGeneral.withOpacity(0.5) : AppColors().textColorGeneral),
          ),
        ));
  }

  String stateSelectCategorie = "";
  String searchEvent = "";
  List<Event> events = [
    Event("https://cdn.pixabay.com/photo/2015/11/22/19/04/crowd-1056764_1280.jpg", 'Electro space', "21 june | 11:00 - 4:00", "200.000",
        "Live dj"),
    Event("https://cdn.pixabay.com/photo/2017/07/21/23/57/concert-2527495_1280.jpg", 'Mix latino', "12 feb | 1:00 - 4:00", "10.000",
        "Electro"),
    Event("https://cdn.pixabay.com/photo/2018/06/17/10/38/artist-3480274_1280.jpg", 'Party mix night', "30 sept | 3:00 - 4:00", "5.000",
        "Sport"),
  ];

  Widget searchEvent2() {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadedScaleAnimation(
                      GestureDetector(
                          onTap: () {
                            async() async {
                              // BuildContext? context = null;
                              Store<AppState> store = await createStore(api: endPointApi());
                              store.dispatch(
                                  getEventsCalendarAction(context, startDate: "", endDate: "", placeId: /*"7"*/ widget.data.id.toString()));
                              // store.dispatch(getPlacesAction(_context));
                              //store.dispatch(categoriesAction(_context, "2"));
                            }

                            async();
                          },
                          child: Text(
                            'Events',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26, color: AppColors().textColorGeneral, letterSpacing: 1.5),
                          )),
                      durationInMilliseconds: 400,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            /* Opacity(
                    opacity: 0.2,
                    child: EntryField(
                      labelText: "",
                      initialValue: 'Search',
                    )),*/
            TextField(
              onChanged: (text) {
                print('First text field: $text');
                searchEvent = text;
                setState(() {});
              },
              style: TextStyle(fontSize: 17.0, color: AppColors().textColorGeneral),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: AppColors().textfield,
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors().textColorGeneral.withOpacity(0.5),
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors().textColorGeneral.withOpacity(0.5),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "CATEGORY",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 14, color: AppColors().textColorGeneral, letterSpacing: 2),
            ),
            SizedBox(
              height: 10,
            ),
            ReduxHome.store!.state.postsState.listCategories == null
                ? SizedBox()
                : ReduxHome.store!.state.postsState.listCategories!.length == 0
                    ? Text("No hay resultados" + ReduxHome.store!.state.postsState.listCategories!.length.toString(),
                        style: TextStyle(fontSize: 15.0, color: AppColors().textColorGeneral))
                    : Container(
                        height: 50,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,

                            // physics: BouncingScrollPhysics(),
                            itemCount: ReduxHome.store!.state.postsState.listCategories!.length,
                            itemBuilder: (context, index) {
                              ListCategoriesModel data = ReduxHome.store!.state.postsState.listCategories![index];
                              return itemCategorie(title: data.name.toString());
                            })),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            /*  if (_anchoredBanner != null)
              Container(
                width: _anchoredBanner!.size.width.toDouble(),
                height: _anchoredBanner!.size.height.toDouble(),
                child: AdWidget(ad: _anchoredBanner!),
              ),*/
            ReduxHome.store!.state.postsState.listEventsCalendarStore == null
                ? AppWidgetSize().loadingWidget()
                : ReduxHome.store!.state.postsState.listEventsCalendarStore!.length == 0
                    ? Text("No hay resultados", style: TextStyle(fontSize: 15.0, color: AppColors().textColorGeneral))
                    : Expanded(
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: ReduxHome.store!.state.postsState.listEventsCalendarStore!.length,
                            itemBuilder: (context, index) {
                              Widget data = itemEvent(context, ReduxHome.store!.state.postsState.listEventsCalendarStore![index]);
                              ListEventDetailsModel dataResult = ReduxHome.store!.state.postsState.listEventsCalendarStore![index];
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

                              return data;
                              //   return SizedBox();
                            }),
                      ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    var locale = AppLocalizations.of(context)!;
    List<DJ> djLineUp = [
      DJ(Assets.dj1, 'Skrillix', '12:00-13:30'),
      DJ(Assets.dj2, 'Chainsmokers', '14:35-15:30'),
      DJ(Assets.dj3, 'Deadmau5', '12:00-13:30'),
      DJ(Assets.dj4, 'David Guetta', '12:00-13:30'),
      DJ(Assets.dj5, 'Skrillix', '12:00-13:30'),
    ];
    List<String> avatars = [
      Assets.avatar1,
      Assets.avatar2,
      Assets.avatar3,
      Assets.avatar4,
      Assets.avatar1,
      Assets.avatar2,
      Assets.avatar3,
      Assets.avatar4,
      Assets.avatar2,
    ];
    return SafeArea(
        child: StoreProvider<AppStateHome>(
            store: ReduxHome.store!,
            child: StoreConnector<AppStateHome, dynamic>(
                converter: (store) => store.state.postsState,
                builder: (context, value) {
                  return Scaffold(
                    backgroundColor: AppColors().backgroundColor,
                    body: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                        ),
                        PositionedDirectional(
                          top: 0,
                          bottom: 0,
                          end: 0,
                          start: 0,
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Padding(
                              padding: EdgeInsets.only(top: 0, bottom: 0),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 240,
                                    foregroundDecoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Colors.transparent, Colors.transparent, Colors.transparent, Colors.transparent],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: [0, 0.2, 0.1, 1],
                                      ),
                                    ),
                                    child: Image.network(widget.data.urlImageConverter.toString(), fit: BoxFit.cover),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 14, 20, 0),
                                    //   decoration: BoxDecoration(color: Colors.black),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(80),
                                                ),
                                                child: AppWidgetSize().imageUrlS3(widget.data.logoUrl.toString())),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Flexible(
                                                child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                GestureDetector(
                                                    onTap: () {},
                                                    child: Text(
                                                      widget.data.name.toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(fontSize: 30, color: AppColors().textColorGeneral),
                                                    )),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                FadedScaleAnimation(
                                                  Text(
                                                    widget.data.address.toString(),
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14,
                                                        color: AppColors().textColorGeneral.withOpacity(0.4)),
                                                  ),
                                                  durationInMilliseconds: 400,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                FadedScaleAnimation(
                                                  Text(
                                                    widget.data.capacity.toString(),
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14,
                                                        color: AppColors().textColorGeneral.withOpacity(0.4)),
                                                  ),
                                                  durationInMilliseconds: 400,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          widget.data.description.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(fontSize: 15, color: AppColors().textColorGeneral),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        FadedScaleAnimation(
                                          Text(
                                            'LOCATION',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color: AppColors().textColorGeneral,
                                                letterSpacing: 2),
                                          ),
                                          durationInMilliseconds: 400,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          leading: Image.asset(
                                            Assets.djPin,
                                            scale: 5,
                                            color: AppColors().textColorGeneral,
                                          ),
                                          title: Text(
                                            widget.data.address.toString(),
                                            style: Theme.of(context).textTheme.caption!.copyWith(
                                                fontSize: 13.sp, color: AppColors().textColorGeneral, fontWeight: FontWeight.bold),
                                          ),
                                          trailing: Text(
                                            "",
                                            style: Theme.of(context).textTheme.caption!.copyWith(
                                                  fontSize: 12,
                                                  color: AppColors().textColorGeneral,
                                                ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(20.0),
                                            child: Container(
                                              height: 250,
                                              width: MediaQuery.of(context).size.width,
                                              child: BlocBuilder<OrderMapBloc, OrderMapState>(builder: (context, state) {
                                                // print('polyyyy' + state.polylines.toString() + widget.data.latitude.toString());
                                                return GoogleMap(
                                                  zoomControlsEnabled: false,
                                                  // polylines: state.polylines,
                                                  mapType: MapType.normal,
                                                  initialCameraPosition: CameraPosition(
                                                    target: widget.data.latitude == "null"
                                                        ? LatLng(37.42796133580664, -122.085749655962)
                                                        : LatLng(double.parse(widget.data.latitude.toString()),
                                                            double.parse(widget.data.longitude.toString())),
                                                    zoom: 14.4746,
                                                  ),
                                                  markers: _markers,
                                                  onMapCreated: (GoogleMapController controller) async {
                                                    _mapController.complete(controller);
                                                    mapStyleController = controller;
                                                    //   mapStyleController!.setMapStyle(mapStyle);
                                                    setState(() {
                                                      _markers.add(
                                                        Marker(
                                                          markerId: MarkerId('mark1'),
                                                          position: LatLng(double.parse(widget.data.latitude.toString()),
                                                              double.parse(widget.data.longitude.toString())),
                                                          icon: markerss.first,
                                                        ),
                                                      );
                                                    });
                                                  },
                                                );
                                              }),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 14, 20, 14),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          locale.eventOn!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(fontSize: 12, color: AppColors().textColorGeneral),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              size: 18,
                                              color: AppColors().textColorGeneral,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Capacity: " + widget.data.capacity.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(fontSize: 12, color: AppColors().textColorGeneral),
                                            ),
                                            // Image.network()

                                            /* Text(
                                "Capacity: " + widget.data.logoUrl.toString(),
                                style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12, color: Colors.white),
                              ),*/
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(height: 700, child: searchEvent2()),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  /*   Container(
                      padding: EdgeInsets.only(bottom: 14),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.black),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20),
                            title: Text(
                              locale.djLineUp!,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16, color: Colors.white),
                            ),
                            trailing: Text(
                              locale.viewAll!,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Theme.of(context).primaryColor),
                            ),
                          ),
                          /*  SizedBox(
                            height: 110,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsetsDirectional.only(start: 20),
                                itemCount: djLineUp.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, PageRoutes.djInfoPage);
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                              borderRadius: BorderRadius.circular(8),
                                              child: Image.asset(
                                                djLineUp[index].image,
                                                height: 70,
                                                width: 70,
                                                fit: BoxFit.fill,
                                              )),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            djLineUp[index].name,
                                            style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 11),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            djLineUp[index].time,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(fontSize: 11, color: Theme.of(context).hintColor),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )*/
                        ],
                      ),
                    ),*/
                                  SizedBox(
                                    height: 8,
                                  ),
                                  /* Container(
                      padding: EdgeInsets.only(bottom: 14, top: 14, left: 20, right: 20),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.black),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            '987 ' + locale.peopleAreAttending!,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                              ),
                              for (int x = 0; x < avatars.length; x++)
                                PositionedDirectional(
                                  start: (26 * x).toDouble(),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(avatars[x]),
                                  ),
                                ),
                              PositionedDirectional(
                                start: (26 * avatars.length).toDouble(),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.black87,
                                        Colors.black54,
                                        Colors.black87,
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '978+',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(color: Theme.of(context).backgroundColor, fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),*/
                                  SizedBox(
                                    height: 80,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        /* PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(12)), color: Color(0xff212121)),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadedScaleAnimation(
                        Text(
                          'PRICE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white.withOpacity(0.4), letterSpacing: 1.5),
                        ),
                        durationInMilliseconds: 400,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$ 130.00',
                        style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  Spacer(),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PageRoutes.selectSeatPage);
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xff4B7AD0),
                              Color(0xffba6dcc),
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: Text("BUY A TICKET", style: TextStyle(fontSize: 16, letterSpacing: 1.5)),
                    ),
                  )
                  /* CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutes.selectSeatPage);
                    },
                    icon: Image.asset(
                      Assets.ticketIcon,
                      scale: 2.5,
                    ),
                    label: "BUI A TICKET",
                  ),*/
                ],
              ),
            ),
          ),*/
                        PositionedDirectional(
                            top: 50,
                            start: 10,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  );
                })));
  }

  getEvents() {
    async() async {
      // BuildContext? context = null;
      Store<AppState> store = await createStore(api: endPointApi());
      store.dispatch(getEventsCalendarAction(context, startDate: "", endDate: "", placeId: widget.data.id.toString()));
      store.dispatch(getPlacesAction(_context));
      store.dispatch(categoriesAction(_context, "2"));
    }

    async();
  }

  @override
  void initState() {
    Timer.run(() {
      rootBundle.loadString('assets/map_style.txt').then((string) {
        mapStyle = string;
      });
      getEvents();
      super.initState();

      // you have a valid context here
    });
  }
}
