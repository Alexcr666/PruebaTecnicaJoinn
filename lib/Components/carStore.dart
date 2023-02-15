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

BuildContext? _context;

class CarStorePage extends StatefulWidget {
  LocalityListModel? dataLocality;

  CarStorePage({this.dataLocality});
  @override
  _CarStorePageState createState() => _CarStorePageState();
}

class _CarStorePageState extends State<CarStorePage> {
  List<ItemCartShop2> dataListItem2 = [];
  int totalTicket = 0;
  List<String> localityList = [];
  @override
  Widget build(BuildContext context) {
    localityList.clear();
    _context = context;
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
        backgroundColor: AppColors().backgroundColor,
        appBar: AppWidgetSize().appBar(title: "Cart Shop"),
        body: StoreProvider<AppStateHome>(
            store: ReduxHome.store!,
            child: StoreConnector<AppStateHome, dynamic>(
                converter: (store) => store.state.postsState,
                builder: (context, value) {
                  localityList.clear();
                  /*Timer.run(() {
                    executeCart();
                    totalTicket = 0;
                  });*/
                  return Column(crossAxisAlignment: CrossAxisAlignment.start,
                      //    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(child: SizedBox()),
                            GestureDetector(
                                onTap: () {
                                  //       LocalityListModel data = PlaceListModel();
                                  List<LocalityListModel> dataClear = [];
                                  //   dataClear.add(data);

                                  ReduxHome.store?.dispatch(
                                    SetPostsStateActionHome(
                                      PostsStateHome(dataListCar: dataClear),
                                    ),
                                  );

                                  // ReduxHome.store!.state.postsState.dataListCar
                                },
                                child: Icon(
                                  Icons.delete,
                                  size: 30.sp,
                                  color: AppColors.redColor,
                                )),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),

                        ReduxHome.store!.state.postsState.dataListCar == null
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
                                        })),
                        //Text("No hay resultados" + ReduxHome.store!.state.postsState.listLocality!.length.toString()),
                        /* ReduxHome.store!.state.postsState.dataListCar == null
                            ? Text("No hay resultados", style: TextStyle(fontSize: 15.0, color: Colors.white))
                            : ReduxHome.store!.state.postsState.dataListCar!.length == 0
                                ? Text("No hay resultados" + ReduxHome.store!.state.postsState.dataListCar!.length.toString(),
                                    style: TextStyle(fontSize: 15.0, color: Colors.white))
                                : Expanded(
                                    child: ListView.builder(
                                        // scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemCount: ReduxHome.store!.state.postsState.dataListCar!.length,
                                        itemBuilder: (context, index) {
                                          PageTicket data = ReduxHome.store!.state.postsState.dataListCar![index];

                                          if (localityList.contains(data.localityName) == false) {
                                            localityList.add(data!.localityName!);
                                          }
                                          return Column(
                                            children: [
                                              Text(
                                                /*   data.localityName.toString()*/ localityList.length.toString(),
                                                style:
                                                    Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).primaryColor),
                                              ),
                                              MyTicket(
                                                data: data,
                                                title: data.placeName.toString(),
                                                location: data.localityName,
                                                date: data.amount.toString(),
                                                time: data.datePurchase.toString(),
                                                position: index,
                                                add: false,
                                              ),
                                            ],
                                          );

                                          /*ListTile(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => BookYourTicketsPage()),
                                              );
                                            },
                                            title: Text(data.eventName.toString(), style: TextStyle(color: Colors.white)),
                                            subtitle: Text("Price:" + data.amount.toString(), style: TextStyle(color: Colors.white)),
                                          )*/
                                          ;
                                        })),*/

                        /*   Text(
                          /*   data.localityName.toString()*/ dataListItem2.length.toString(),
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).primaryColor),
                        ),*/

                        /*  Expanded(
                            child: ListView.builder(
                                // scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: dataListItem2.length,
                                itemBuilder: (context, index) {
                                  //   PageTicket data =  dataListItem2.dataListCar![index];

                                  /*if (localityList.contains(data.localityName) == false) {
                                            localityList.add(data!.localityName!);
                                          }*/

                                  ItemCartShop2 dataList1 = dataListItem2[index];

                                  return Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            /*   data.localityName.toString()*/ dataList1.nameLocality.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(color: Theme.of(context).primaryColor, fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ListView.builder(
                                              // scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              itemCount: dataList1.dataListCar!.length,
                                              itemBuilder: (context, index2) {
                                                Widget item = SizedBox();
                                                try {
                                                  PageTicket data = dataList1.dataListCar![index2];
                                                  item = MyTicket(
                                                    data: data,
                                                    title: data.placeName.toString(),
                                                    location: data.localityName,
                                                    date: data.amount.toString(),
                                                    time: data.datePurchase.toString(),
                                                    // urlImage: data.urlImageConverter.toString(),
                                                    position: index,
                                                    add: false,
                                                    positionCartCustom: index,
                                                    tap: () {
                                                      dataListItem2.removeAt(index);
                                                      // executeCart();
                                                      setState(() {});
                                                      print("elimino---");
                                                    },
                                                  );
                                                } catch (e) {}
                                                return item;
                                              }),
                                        ],
                                      ));

                                  /*ListTile(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => BookYourTicketsPage()),
                                              );
                                            },
                                            title: Text(data.eventName.toString(), style: TextStyle(color: Colors.white)),
                                            subtitle: Text("Price:" + data.amount.toString(), style: TextStyle(color: Colors.white)),
                                          )*/
                                  ;
                                })),*/

                        AppWidgetSize().itemCarVisibleLocality(totalTicket, context: context, car: true),

                        //   AppWidgetSize().itemCarVisible(totalTicket, context: context, dataEvent: dataListItem2),
                      ]);
                })));
  }

  executeCart() {
    for (var i = 0; i < ReduxHome.store!.state.postsState.dataListCar!.length; i++) {
      totalTicket += ReduxHome.store!.state.postsState.dataListCar![i].dataDetails!.price!;
    }
    /* for (var i = 0; i < ReduxHome.store!.state.postsState.dataListCar!.length; i++) {
      LocalityListModel data = ReduxHome.store!.state.postsState.dataListCar![i];
      int positionName = 0;
      bool exist = false;
      if (dataListItem2.length != 0) {
        for (var i2 = 0; i2 < dataListItem2.length; i2++) {
          ItemCartShop2 dataFor = dataListItem2[i2];== null ? null : amount,
          print("prueba1003" + dataFor.nameLocality.toString() + " " + data.localityName.toString());
          if (dataFor.nameLocality == data.localityName) {
            positionName = i2;
            exist = true;
          }
        }
      }
      if (exist == false) {
        List<LocalityListModel> datPageTicket = [];
        datPageTicket.add(data);

        ItemCartShop2 dataAdd = ItemCartShop2(dataListCar: datPageTicket, nameLocality: data.localityName);
        dataListItem2.add(dataAdd);
        totalTicket += data.dataDetails!.price;
        print("prueba1001");
      } else {
        print("prueba1000");
        bool existItemTicket = false;
        for (var i3 = 0; i3 < dataListItem2[positionName].dataListCar!.length; i3++) {
          PageTicket dataList34 = dataListItem2[positionName].dataListCar![i3];
          totalTicket += dataList34.amount!;
          if (dataList34.id == data.id) {
            existItemTicket = true;
          }
        }
        if (existItemTicket == false) {
          dataListItem2[positionName].dataListCar!.add(data);
        }
      }
      // setState(() {});

      /* if (localityList.contains(data.localityName) == false) {
                                            localityList.add(data!.localityName!);
                                          }*/
    }*/
    setState(() {});
  }

  @override
  void initState() {
    Timer.run(() {
      localityList.clear();
      executeCart();
      rootBundle.loadString('assets/map_style.txt').then((string) {
        mapStyle = string;
      });

      super.initState();

      // you have a valid context here
    });
  }
}

class ItemCartShop2 {
  List<PageTicket>? dataListCar;
  String? nameLocality;

  ItemCartShop2({this.dataListCar, this.nameLocality});
}

class TicketList {
  String? id;
  String? purchaseId;
  String? localityId;
  String? amount;
  String? unitPrice;
  TicketList({
    this.id,
    this.purchaseId,
    this.localityId,
    this.amount,
    this.unitPrice,
  });
  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        // "purchaseId": purchaseId == null ? null : purchaseId,
        "localityId": localityId == null ? null : localityId,
        "amount": amount == null ? null : amount,
        "unitPrice": unitPrice == null ? null : unitPrice,
      };
}

class TaxList {
  String? id;
  String? purchaseId;
  String? taxId;
  String? percent;
  String? value;
  TaxList({
    this.id,
    this.purchaseId,
    this.taxId,
    this.percent,
    this.value,
  });
  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        //"purchaseId": purchaseId == null ? null : purchaseId,
        "taxId": taxId == null ? null : taxId,
        "percent": percent == null ? null : percent,
        "value": value == null ? null : value,
      };

  static fromJson(e) {}
}
