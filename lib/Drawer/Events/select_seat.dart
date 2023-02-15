import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Components/myTicketsLocality.dart';
import 'package:dj_mania/Components/my_ticket.dart';
import 'package:dj_mania/Constants/constants.dart';
import 'package:dj_mania/Drawer/Events/tickets/ticketList.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/Theme/colors.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:dj_mania/data/model/event/listEventDetailsModel.dart';
import 'package:dj_mania/data/model/locality/LocalityListModel.dart';
import 'package:dj_mania/data/model/ticket/TicketListModel.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Drawer/Events/eventList.dart';
import 'package:dj_mania/Drawer/Events/events.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/OrderMapBloc/order_map_bloc.dart';
import 'package:dj_mania/OrderMapBloc/order_map_state.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/data/model/event/eventDetailsModel.dart';
import 'package:dj_mania/map_utils.dart';
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

BuildContext? _context;

class SelectSeatPage extends StatefulWidget {
  SelectSeatPage({key, required this.data, required this.urlImage});

  final ListEventDetailsModel data;
  final String urlImage;
  @override
  _SelectSeatPageState createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  @override
  Widget build(BuildContext context) {
    _context = context;
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
        backgroundColor: AppColors().backgroundColor,
        appBar: AppWidgetSize().appBar(title: "Cart"),
        body: StoreProvider<AppStateHome>(
            store: ReduxHome.store!,
            child: StoreConnector<AppStateHome, dynamic>(
                converter: (store) => store.state.postsState,
                builder: (context, value) {
                  return Column(
                    //    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    children: [
                      ReduxHome.store!.state.postsState.listLocality == null
                          ? Expanded(child: AppWidgetSize().noResult())
                          : ReduxHome.store!.state.postsState.listLocality!.length == 0
                              ? Expanded(child: AppWidgetSize().noResult())
                              : Expanded(
                                  child: ListView.builder(
                                      // scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemCount: ReduxHome.store!.state.postsState.listLocality!.length,
                                      itemBuilder: (context, index) {
                                        LocalityListModel data = ReduxHome.store!.state.postsState.listLocality![index];
                                        /*return MyTicket(
                                          data: data,
                                          title: data.placeName.toString(),
                                          location: data.localityName,
                                          date: data.amount.toString(),
                                          time: data.datePurchase.toString(),
                                          add: true,
                                        );*/

                                        return Column(
                                          children: [
                                            MyTicketLocality(
                                              title: data.name,
                                              data: data,
                                              location: data.dataDetails!.eventName.toString(),
                                              date: data.name.toString(),
                                              time: "",
                                              urlImage: data.urlImageConverter,
                                            ),
                                          ],
                                        );
                                      })),
                      AppWidgetSize().itemCarVisibleLocality(0, context: context),
                    ],
                  );
                })));
  }

  getEvents() {
    async() async {
      // BuildContext? context = null;
      Store<AppState> store = await createStore(api: endPointApi());

      //store.dispatch(listLocalityAction(_context!, "2"));
      print("pruebaticket: " + widget.data.id.toString());
      store.dispatch(listLocalityAction(_context!, widget.data.id.toString()));

      store.dispatch(getTaskPaginationAction(context));
      //  store.dispatch(categoriesAction(_context, "2"));

      //  store.dispatch(categoriesAction(_context, "2"));
    }

    async();
  }

  @override
  void initState() {
    Timer.run(() {
      getEvents();
      rootBundle.loadString('assets/map_style.txt').then((string) {
        mapStyle = string;
      });

      super.initState();

      // you have a valid context here
    });
  }
}
