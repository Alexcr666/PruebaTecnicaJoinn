import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/carStore.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Components/event_detail_card.dart';
import 'package:dj_mania/Drawer/Events/events.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:dj_mania/data/model/locality/LocalityListModel.dart';
import 'package:dj_mania/data/model/tax/taxListPaginateModel.dart';
import 'package:dj_mania/redux/login/store.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeActions.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:dj_mania/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Components/my_ticket.dart';
import 'package:dj_mania/Constants/constants.dart';
import 'package:dj_mania/Drawer/Events/book_your_tickets.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/Theme/colors.dart';
import 'package:dj_mania/app/app_colors.dart';
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

class TicketBookedPage extends StatefulWidget {
  TicketBookedPage({key, this.dataEvent});

  List<ItemCartShop2>? dataEvent;
  @override
  _TicketBookedPageState createState() => _TicketBookedPageState();
}

class _TicketBookedPageState extends State<TicketBookedPage> {
  async() async {
    // BuildContext? context = null;

    // kkk
    List<TicketList> ticket = [];
    List<TaxList> tax = [];
    print("ticketsprueba100");
    executeCart() {
      for (var i = 0; i < ReduxHome.store!.state.postsState.dataListCar!.length; i++) {
        LocalityListModel dataTicket = ReduxHome.store!.state.postsState.dataListCar![i];

        TicketList data = TicketList(
            id: dataTicket.dataDetails!.eventId.toString(),
            purchaseId: dataTicket.dataDetails!.eventId.toString(),
            unitPrice: dataTicket.dataDetails!.price.toString(),
            amount: "1",
            localityId: dataTicket.id.toString());

        ticket.add(data);
      }
      for (var i = 0; i < ReduxHome.store!.state.postsState.taxListModel!.page!.length; i++) {
        PageTax data = ReduxHome.store!.state.postsState.taxListModel!.page![i];
        TaxList dataTax = TaxList(
            id: data.id.toString(),
            purchaseId: data.id.toString(),
            taxId: data.id.toString(),
            percent: data.percent.toString(),
            value: data.state.toString());

        tax.add(dataTax);
      }
      execute() async {
        Store<AppState> store = await createStore(api: endPointApi());
        //  LocalityListModel dataTicket = ReduxHome.store!.state.postsState.dataListCar![0];

        print("prueba5001: " + ticket.toList().toString());

        store.dispatch(createPaymentAction(context, "1", ReduxLogin.store!.state.postsState.userLoginModel!.id.toString(),
            "2022-11-18T18:23:59.477Z", DateTime.now().toIso8601String(), "success", ticket, tax));
      }

      execute();
      // store.dispatch(categoriesAction(_context, "2"));
    }

    if (ReduxHome.store!.state.postsState.dataListCar != null) {
      executeCart();
    }
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.backgroundScreen,
      body: Column(
        //     alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: 100,
          ),
          Row(
            children: [
              Expanded(child: SizedBox()),
              FadedScaleAnimation(
                Image.asset(
                  Assets.ticketBookedIcon,
                  scale: 3,
                  fit: BoxFit.fill,
                  color: Colors.black,
                ),
                durationInMilliseconds: 400,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                locale.ticketBooked!,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black, fontSize: 18),
              ),
              Expanded(child: SizedBox()),
            ],
          ),

          /*  widget.dataEvent == null
              ? SizedBox()
              : SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 60),
                      child: EventDetailCard(
                        dataEvent: widget.dataEvent,
                      ))),*/
          SizedBox(
            height: 200,
          ),
          Expanded(
              child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    async();
                  },
                  child: Text(
                    "Compra exitosa",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black, fontSize: 30.sp),
                  )),
            ],
          )),

          /*ReduxHome.store!.state.postsState.dataListCar == null
                            ? Expanded(child: AppWidgetSize().noResult())
                            : ReduxHome.store!.state.postsState.dataListCar!.length == 0
                                ? Expanded(child: AppWidgetSize().noResult())
                                : Expanded(
                                    child: ListView.builder(
                                        // scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemCount: ReduxHome.store!.state.postsState.dataListCar!.length,
                                        itemBuilder: (context, index) {
                                          LocalityListModel data = ReduxHome.store!.state.postsState.dataListCar![index];
                                          if (localityList.contains(data.id.toString()) == false) {
                                            print("prueba3000: ");
                                            localityList.add(data.id.toString());
                                            return MyTicket(
                                              data: ReduxHome.store!.state.postsState.dataListCar![index],
                                              position: index,
                                              add: false,
                                            );
                                          } else {
                                            print("prueba3001: " + localityList.toList().toString());
                                            return SizedBox();
                                          }
                                          //  localityList.add(data.id.toString());
                                          //return Text(localityList.contains(data.id.toString()).toString() +
                                          //  ":    " +
                                          //localityList.toList().toString());
                                          //   PageTicket data =  dataListItem2.dataListCar![index];
                                        })),*/
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              onTap: () {
                /* Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventsPage()),
                );*/
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => EventsPage()), (route) => false);

                //  Navigator.pushNamed(context, PageRoutes.myTicketsPage);
              },
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              label: "Volver",
              color: AppColors.primaryColor,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    Timer.run(() {
      async();

      // you have a valid context here
    });
    super.initState();
  }
}
