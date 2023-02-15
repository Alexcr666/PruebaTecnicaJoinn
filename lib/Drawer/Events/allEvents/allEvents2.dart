import 'dart:async';
import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blur/blur.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/entry_field.dart';
import 'package:dj_mania/Constants/constants.dart';
import 'package:dj_mania/Drawer/Calendar/calendarPage.dart';
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
import 'package:dj_mania/map_utils.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:string_similarity/string_similarity.dart';

class AllEventsBody extends StatefulWidget {
  @override
  _AllEventsBodyState createState() => _AllEventsBodyState();
}

class _AllEventsBodyState extends State<AllEventsBody> {
  Completer<GoogleMapController> _mapController = Completer();
  GoogleMapController? mapStyleController;
  Set<Marker> _markers = {};

  @override
  void initState() {
    rootBundle.loadString('assets/map_style.txt').then((string) {
      mapStyle = string;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BlocBuilder<OrderMapBloc, OrderMapState>(builder: (context, state) {
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
                _markers.add(
                  Marker(
                    markerId: MarkerId('mark2'),
                    position: LatLng(37.42496133180663, -122.081743655960),
                    icon: markerss[0],
                  ),
                );
                _markers.add(
                  Marker(
                    markerId: MarkerId('mark3'),
                    position: LatLng(37.42196183580660, -122.089743655967),
                    icon: markerss[0],
                  ),
                );
              });
            },
          );
        }),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, PageRoutes.eventDetail);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor, borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                        child: Image.asset(
                          Assets.event1,
                          height: 175,
                          fit: BoxFit.fill,
                        )),
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
                        locale.bassHill!,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20, color: Theme.of(context).backgroundColor),
                      ),
                    )
                  ],
                ),
                ListTile(
                  dense: true,
                  leading: Image.asset(
                    Assets.djPin,
                    scale: 4,
                  ),
                  title: Text(
                    '22 June | 22:00 - 4:00',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
                  ),
                  subtitle:
                      Text('2202, Marion St. Bass Hill, Amsterdam', style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10)),
                  trailing: Text('2.3 km ' + locale.away!, style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10)),
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(
                        flex: 5,
                      ),
                      ListView.builder(
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
                          }),
                      Spacer(
                        flex: 6,
                      ),
                      Text(
                        '\$ 130.00',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).primaryColor, fontSize: 18),
                      ),
                      Spacer(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
