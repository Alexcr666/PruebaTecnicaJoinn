import 'dart:async';
import 'dart:convert';

import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Drawer/Events/eventList.dart';
import 'package:dj_mania/Drawer/Events/events.dart';
import 'package:dj_mania/Drawer/Events/select_seat.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/OrderMapBloc/order_map_bloc.dart';
import 'package:dj_mania/OrderMapBloc/order_map_state.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:dj_mania/data/model/event/eventDetailsModel.dart';
import 'package:dj_mania/data/model/event/listEventDetailsModel.dart';
import 'package:dj_mania/data/model/place/placeDetails.dart';
import 'package:dj_mania/map_utils.dart';
import 'package:dj_mania/utils/utils.dart';
import 'package:dj_mania/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

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
import 'package:dj_mania/data/model/place/placeModelListHome.dart';
import 'package:dj_mania/map_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
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

class EventDetailPage extends StatelessWidget {
  EventDetailPage({key, required this.data, this.price});

  final ListEventDetailsModel data;

  final String? price;
  // final String urlImage;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapBloc>(
        create: (context) => OrderMapBloc()..loadMap(),
        child: EventDetailBody(
          data: data,
          //  urlImage: urlImage,
        ));
  }
}

bool likeEvent = false;

class EventDetailBody extends StatefulWidget {
  EventDetailBody({key, required this.data, this.price});

  final ListEventDetailsModel data;
  final String? price;

  @override
  _EventDetailBodyState createState() => _EventDetailBodyState();
}

class DJ {
  String image;
  String name;
  String time;

  DJ(this.image, this.name, this.time);
}

late BuildContext _context;

class _EventDetailBodyState extends State<EventDetailBody> {
  Completer<GoogleMapController> _mapController = Completer();
  GoogleMapController? mapStyleController;
  Set<Marker> _markers = {};

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  getEvents() {
    async() async {
      // BuildContext? context = null;
      Store<AppState> store = await createStore(api: endPointApi());

      // store.dispatch(getEventDetailsAction(_context, widget.data.id.toString()));
      store.dispatch(getLikesAction(_context, widget.data.id.toString()));
      //  store.dispatch(getTicketAction(_context!, "1", "0", "100"));
    }

    async();
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  checkLikeEvent() {
    for (var i = 0; i < ReduxHome.store!.state.postsState.listLikesEvents!.length; i++) {
      if (ReduxHome.store!.state.postsState.listLikesEvents![i].id == widget.data.id) {
        likeEvent = true;
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    Timer.run(() {
      _goToTheLake();
      likeEvent = false;
      getEvents();
      checkLikeEvent();
      //check
      /* rootBundle.loadString('assets/map_style.txt').then((string) {
        mapStyle = string;
      });*/
      super.initState();

      // you have a valid context here
    });
  }

  getMaps() {
    Widget item = SizedBox();

    try {
      item = ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: BlocBuilder<OrderMapBloc, OrderMapState>(builder: (context, state) {
                return GoogleMap(
                  zoomControlsEnabled: false,
                  // polylines: state.polylines,
                  mapType: MapType.normal,
                  initialCameraPosition: kGooglePlex,
                  markers: _markers,
                  onMapCreated: (GoogleMapController controller) async {
                    _mapController.complete(controller);
                    mapStyleController = controller;

                    setState(() {
                      /* _markers.add(
                        Marker(
                          markerId: MarkerId('mark1'),
                          position: LatLng(37.42796133580664, -122.085749655962),
                          icon: markerss.first,
                        ),
                      );*/
                    });
                  },
                );
              })));
    } catch (e) {
      item = SizedBox();
    }
    return item;
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    var locale = AppLocalizations.of(context)!;

    return SafeArea(
        child: StoreProvider<AppStateHome>(
            store: ReduxHome.store!,
            child: StoreConnector<AppStateHome, dynamic>(
                converter: (store) => store.state.postsState,
                builder: (context, value) {
                  /* EventDetailsModel? dataEvent;
              if (ReduxHome.store!.state.postsState.eventDetailsModel != null) {
                dataEvent = ReduxHome.store!.state.postsState.eventDetailsModel;
              }*/
                  return Scaffold(
                    backgroundColor: AppColors().backgroundColor,
                    body: /*ReduxHome.store!.state.postsState.eventDetailsModel == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(child: SizedBox()),
                              CircularProgressIndicator(),
                              Expanded(child: SizedBox()),
                            ],
                          )
                        ],
                      )
                    :*/
                        Stack(
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
                                    height: 330,
                                    width: double.infinity,
                                    foregroundDecoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Colors.transparent, Colors.transparent, Colors.transparent, Colors.transparent],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: [0, 0.2, 0.1, 1],
                                      ),
                                    ),
                                    child: widget.data.urlImageConverter.toString() == "null"
                                        ? AppWidgetSize().noImage()
                                        : Image.network(
                                            widget.data.urlImageConverter.toString(),
                                            fit: BoxFit.fill,
                                            errorBuilder: (BuildContext? context, Object? exception, StackTrace? stackTrace) {
                                              return AppWidgetSize().noImage();
                                            },
                                          ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.fromLTRB(0, 14, 20, 0),
                                      decoration: BoxDecoration(color: AppColors().backgroundColor),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  elevation: 0.0,
                                                  primary: Colors.red.withOpacity(0),
                                                ),
                                                onPressed: () {
                                                  Navigator.pushNamed(context, PageRoutes.selectSeatPage);
                                                },

                                                // color: Colors.transparent,
                                                // padding: const EdgeInsets.all(0.0),
                                                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: AppColors.primaryColor, width: 2),
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                    ),
                                                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                            width: 65,
                                                            height: 70,
                                                            child: Text(
                                                                //  dataEvent.dateTimeEvent.toUtc
                                                                DateFormat(DateFormat.YEAR_MONTH_DAY, 'Es')
                                                                    .format(widget.data.dateTimeEvent!.toUtc())
                                                                    .toString()
                                                                    .toUpperCase() /* dataEvent!.dateTimeEvent.toString()*/,
                                                                style: TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: AppColors().textColorGeneral,
                                                                ))),
                                                        //  Text("21", style: TextStyle(fontSize: 15, letterSpacing: 1.5)),
                                                      ],
                                                    )),
                                              ),
                                              Flexible(
                                                  child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        getEvents();
                                                      },
                                                      child: Text(
                                                        widget.data.name.toString(),
                                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                            fontSize: 25, color: AppColors().textColorGeneral, fontWeight: FontWeight.bold),
                                                      )),
                                                  FadedScaleAnimation(
                                                    Text(
                                                      widget.data.categories.toString(),
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold, fontSize: 14, color: AppColors().textColorGeneral),
                                                    ),
                                                    durationInMilliseconds: 400,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  /*  FadedScaleAnimation(
                                                    Text(
                                                      dataEvent!.dateTimeEvent.toString(),
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white.withOpacity(0.4)),
                                                    ),
                                                    durationInMilliseconds: 400,
                                                  ),*/
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                          /*Row(
                                            children: [
                                              RaisedButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(context, PageRoutes.selectSeatPage);
                                                },
                                                textColor: Colors.white,
                                                padding: const EdgeInsets.all(0.0),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                      color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                  child:
                                                      Text("INFO", style: TextStyle(fontSize: 15, color: Colors.black, letterSpacing: 1.5)),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              RaisedButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(context, PageRoutes.selectSeatPage);
                                                },
                                                // textColor: Colors.white.withOpacity(0.5),
                                                padding: const EdgeInsets.all(0.0),
                                                color: Colors.transparent,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                      color: Colors.white30, borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                  child: const Text("PARTICIPANT",
                                                      style: TextStyle(fontSize: 15, color: Colors.black, letterSpacing: 1.5)),
                                                ),
                                              )
                                            ],
                                          ),*/
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  widget.data!.description.toString() == "null"
                                                      ? "No hay descripcion"
                                                      : widget.data!.description.toString(),
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

                                                /*
                                          FutureBuilder(
                                              future: endPointApi().getPlaceDetailsEndpoint(
                                                  ReduxHome.store!.state.postsState.eventDetailsModel!.placeId.toString()),
                                              builder: (
                                                BuildContext context,
                                                AsyncSnapshot snapshot,
                                              ){
                                                print(snapshot.connectionState);
                                                if (snapshot.connectionState == ConnectionState.waiting) {
                                                  return SizedBox();
                                                } else if (snapshot.connectionState == ConnectionState.done) {
                                                  if (snapshot.hasError) {
                                                    return const Text('Error');
                                                  } else if (snapshot.hasData) {
                                                    PlaceDetailsModel data2 = placeDetailsModelFromJson(snapshot.data!.data);
                                                ClipRRect(
                                              borderRadius: BorderRadius.circular(20.0),
                                              child: Container(
                                                height: 250,
                                                width: MediaQuery.of(context).size.width,
                                                child: BlocBuilder<OrderMapBloc, OrderMapState>(builder: (context, state) {
                                                  print('polyyyy' + state.polylines.toString());
                                                  return GoogleMap(
                                                    zoomControlsEnabled: false,
                                                    // polylines: state.polylines,
                                                    mapType: MapType.normal,
                                                    initialCameraPosition: kGooglePlex,
                                                    markers: _markers,
                                                    onMapCreated: (GoogleMapController controller) async {
                                                      _mapController.complete(controller);
                                                      mapStyleController = controller;
                                                      mapStyleController!.setMapStyle(mapStyle);
                                                      setState(() {
                                                        _markers.add(
                                                          Marker(
                                                            markerId: MarkerId('mark1'),
                                                            position: LatLng(37.42796133580664, -122.085749655962),
                                                            icon: markerss.first,
                                                          ),
                                                        );
                                                      
                                                      });
                                                    },
                                                  );
                                                }),
                                              ));
                                                  }
                                                  return SizedBox();
                                                }
                                              }),*/

                                                FutureBuilder(
                                                  future: endPointApi().getPlaceDetailsEndpoint(widget.data.placeId.toString()),
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
                                                        // EventDetailsModel? data = eventDetailsModelFromJson(jsonEncode(snapshot.data!.toString()));
                                                        //  print("prueba57" + snapshot.data!.data.toString());

                                                        //kkk
                                                        return Column(
                                                          children: [
                                                            ListTile(
                                                              contentPadding: EdgeInsets.zero,
                                                              leading: Image.asset(
                                                                Assets.djPin,
                                                                color: AppColors.primaryColor,
                                                                scale: 5,
                                                              ),
                                                              title: Text(
                                                                data2.address.toString(),
                                                                style: Theme.of(context).textTheme.caption!.copyWith(
                                                                    fontSize: 14,
                                                                    color: AppColors().textColorGeneral,
                                                                    fontWeight: FontWeight.bold),
                                                              ),
                                                              trailing: Text(
                                                                "",
                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .caption!
                                                                    .copyWith(fontSize: 12, color: AppColors().textColorGeneral),
                                                              ),
                                                            ),
                                                            getMaps(),
                                                            /*  GoogleMap(
                                                  mapType: MapType.hybrid,
                                                  initialCameraPosition: _kGooglePlex,
                                                  onMapCreated: (GoogleMapController controller) {
                                                    _controller.complete(controller);
                                                  },
                                                ),*/
                                                          ],
                                                        );

                                                        //print("prueba57" + snapshot.data.toString());
                                                      } else {
                                                        PlaceDetailsModel data2 = placeDetailsModelFromJson(snapshot.data!.data);
                                                        // print("prueba57" + snapshot.data!.data.toString());

                                                        //kkk
                                                        return Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            /*  Container(
                                                    height: 250,
                                                    width: MediaQuery.of(context).size.width,
                                                    child: BlocBuilder<OrderMapBloc, OrderMapState>(builder: (context, state) {
                                                      print('polyyyy' + state.polylines.toString());
                                                      return GoogleMap(
                                                        zoomControlsEnabled: false,
                                                        // polylines: state.polylines,
                                                        mapType: MapType.normal,
                                                        initialCameraPosition: kGooglePlex,
                                                        /*  initialCameraPosition: CameraPosition(
                                                          target: /*LatLng(data2.latitude, data2.longitude)*/ kGooglePlex,
                                                          zoom: 14.4746,
                                                        ),*/
                                                        markers: _markers,
                                                        onMapCreated: (GoogleMapController controller) async {
                                                          /* _mapController.complete(controller);
                                                              mapStyleController = controller;
                                                              //mapStyleController!.setMapStyle(mapStyle);
                                                              setState(() {
                                                                _markers.add(
                                                                  Marker(
                                                                    markerId: MarkerId('mark1'),
                                                                    position: LatLng(data2.latitude, data2.longitude),
                                                                    icon: markerss.first,
                                                                  ),
                                                                );
                                                              });*/
                                                        },
                                                      );
                                                    })),*/
                                                            ListTile(
                                                              contentPadding: EdgeInsets.zero,
                                                              leading: Image.asset(
                                                                Assets.djPin,
                                                                scale: 5,
                                                              ),
                                                              title: Text(
                                                                data2.address.toString(),
                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .caption!
                                                                    .copyWith(fontSize: 12, color: AppColors().textColorGeneral),
                                                              ),
                                                              trailing: Text(
                                                                "",
                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .caption!
                                                                    .copyWith(fontSize: 12, color: AppColors().textColorGeneral),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      }
                                                    } else {
                                                      return Text('State: ${snapshot.connectionState}');
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                        ],
                                      )),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 14, 20, 14),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColors().backgroundColor),
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
                                              Icons.date_range,
                                              size: 18,
                                              color: AppColors.primaryColor,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              DateFormat(DateFormat.YEAR_MONTH_DAY, 'Es').format(widget.data.dateTimeEvent!.toUtc()),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(fontSize: 12, color: AppColors().textColorGeneral),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.access_time,
                                              size: 18,
                                              color: AppColors().textColorGeneral,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              DateFormat('hh:mm a').format(widget.data.dateTimeEvent!),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(fontSize: 12, color: AppColors().textColorGeneral),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  /* Container(
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
                                          SizedBox(
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
                                          )/
                                        ],
                                      ),
                                    ),*/
                                  SizedBox(
                                    height: 8,
                                  ),
                                  /*   Container(
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
                        PositionedDirectional(
                          bottom: 0,
                          start: 0,
                          end: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(12)), color: AppColors().backgroundColorAppBar),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FadedScaleAnimation(
                                      Text(
                                        'PRICE',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: AppColors().textColorGeneral.withOpacity(0.4),
                                            letterSpacing: 1.5),
                                      ),
                                      durationInMilliseconds: 400,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '\$ ' + converterMoney(widget.data.price.toString()),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(fontSize: 20, color: AppColors().textColorGeneral, fontWeight: FontWeight.bold),
                                    ),
                                    /*ReduxHome.store!.state.postsState.ticketLocalityListModel == null
                                          ? Text(
                                              '\$ ' + "0",
                                              style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 20, color: Colors.white),
                                            )
                                          : ReduxHome.store!.state.postsState.ticketLocalityListModel!.page!.length == 0
                                              ? Text(
                                                  '\$ ' + "0",
                                                  style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 20, color: Colors.white),
                                                )
                                              : Text(
                                                  '\$ ' +
                                                      ReduxHome.store!.state.postsState.ticketLocalityListModel!.page![0].amount.toString(),
                                                  style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 20, color: Colors.white),
                                                ),*/
                                  ],
                                ),
                                Spacer(),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0.0,
                                    primary: Colors.red.withOpacity(0),
                                  ),
                                  onPressed: () {
                                    //  Navigator.pushNamed(context, PageRoutes.selectSeatPage);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SelectSeatPage(
                                                data: widget.data,
                                                urlImage: widget.data.urlImageConverter.toString(),
                                              )),
                                    );
                                  },

                                  //  textColor: Colors.white,
                                  // padding: const EdgeInsets.all(0.0),
                                  ///shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: <Color>[
                                            AppColors.primaryColor,
                                            AppColors.primaryColor,
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
                        ),
                        PositionedDirectional(
                            top: 30,
                            start: 10,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: AppColors().icon,
                              ),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            GestureDetector(
                                onTap: () {
                                  if (likeEvent == true) {
                                    likeEvent = false;
                                  } else {
                                    likeEvent = true;
                                  }
                                  setState(() {});
                                  /*   async() async {
                                                  // BuildContext? context = null;
                                                  Store<AppState> store = await createStore(api: endPointApi());

                                                  store.dispatch(getLikesAction(_context, widget.data.id.toString()));
                                                }

                                                async();*/

                                  async2() async {
                                    // BuildContext? context = null;
                                    Store<AppState> store = await createStore(api: endPointApi());

                                    store.dispatch(addLikesAction(
                                        context: context,
                                        id: widget.data.id.toString(),
                                        add: likeEvent,
                                        eventId: widget.data.id.toString(),
                                        userId: ReduxLogin.store!.state.postsState.userLoginModel!.id.toString(),
                                        likeDate: /*DateTime.now().toString()*/ "2022-09-12T22:18:05.502Z"));
                                  }

                                  async2();
                                },
                                child: Container(
                                    color: Colors.transparent,
                                    child: new Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: new BoxDecoration(
                                            color: Colors.black.withOpacity(0.2),
                                            borderRadius: new BorderRadius.all(
                                              Radius.circular(40.0),
                                            )),
                                        margin: EdgeInsets.only(right: 20, top: 10, bottom: 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Icon(Icons.favorite, size: 40, color: likeEvent == true ? Colors.red : Colors.white),
                                            Text("Like: " + ReduxHome.store!.state.postsState.totalLikes.toString(),
                                                style: TextStyle(
                                                  fontSize: 21,
                                                  color: AppColors().textColorGeneral,
                                                )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        )))),
                          ],
                        )
                      ],
                    ),
                  );
                })));
  }
}
