import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Drawer/Events/book_your_tickets.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/data/model/locality/LocalityListModel.dart';
import 'package:dj_mania/data/model/ticket/TicketListModel.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeActions.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeState.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:dj_mania/utils/utils.dart';
import 'package:flutter/material.dart';

class MyTicket extends StatelessWidget {
  final LocalityListModel? data;
  final bool? add;
  final int? position;
  final int? positionCartCustom;
  final Function? tap;
  final String? urlImage;

  MyTicket({this.data, this.add, this.position, this.positionCartCustom, this.tap, this.urlImage});
  @override
  Widget build(BuildContext context) {
    int number = 0;

    if (ReduxHome.store!.state.postsState.dataListCar != null) {
      //   dataOrigin = ReduxHome.store!.state.postsState.dataListCar;

      for (var i = 0; i < ReduxHome.store!.state.postsState.dataListCar!.length; i++) {
        LocalityListModel data2 = ReduxHome.store!.state.postsState.dataListCar![i];

        if (data!.name.toString() == data2.name.toString()) {
          number += 1;
        }
      }
      if (add == false) {
        if (number == 0) {
          /*  print("ejecuto" + positionCartCustom.toString());
          Timer.run(() {
            tap!();
          });*/

          // List<ItemCartShop>? dataCustom2 = ReduxHome.store!.state.postsState.dataListCarCustom;

          // print("ejecuto2: " + ReduxHome.store!.state.postsState.dataListCarCustom!.toString());
          // dataCustom2!.removeAt(1);
          /* ReduxHome.store?.dispatch(
            SetPostsStateActionHome(
              PostsStateHome(dataListCarCustom: dataCustom),
            ),
          );*/
        }
      }
    }

    //if(ReduxHome.store.state.postsState.dataListCarCustom[data.id])
    var locale = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () {
        /* Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookYourTicketsPage(data: data)),
        );*/

        //  Navigator.pushNamed(context, PageRoutes.ticketInfoPage);
      },
      child: FadedScaleAnimation(
        Container(
          margin: const EdgeInsets.only(top: 5, left: 12, right: 12),
          padding: const EdgeInsets.only(top: 2, bottom: 2),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      data!.name.toString(),
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  GestureDetector(
                      onTap: () {
                        addTicket(false);
                      },
                      child: Icon(
                        /* add != true ? Icons.close :*/ Icons.remove,
                        size: 40,
                      )),
                  Text(
                    number.toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                  /*  Container(
                      width: 40,
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none, labelText: 'Enter Name', hintText: 'Enter Your Name'),
                      )),*/
                  GestureDetector(
                      onTap: () {
                        addTicket(true);
                      },
                      child: Icon(
                        /* add != true ? Icons.close :*/ Icons.add,
                        size: 40,
                      )),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  urlImage == null
                      ? SizedBox()
                      : Image.network(
                          urlImage!,
                          height: 60,
                          width: 60,
                        ),
                  Image.asset(
                    Assets.djPin,
                    scale: 5,
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    data!.dataDetails!.eventName.toString(),
                    style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 15),
                  ),
                ],
              ),
              Divider(
                height: 1,
              ),
              Row(
                children: [
                  Expanded(
                      child: ListTile(
                    title: Text(
                      "Price (unit)",
                      style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 15),
                    ),
                    subtitle: Text(
                      "\$" + converterMoney(data!.dataDetails!.price.toString()).toString()!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 23),
                    ),
                  )),
                  Expanded(
                      child: ListTile(
                    title: Text(
                      "Total",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    subtitle: Text(
                      "\$" + converterMoney((number * data!.dataDetails!.price!).toString()),
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22),
                    )
                    /* Text(
                      time!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
                    )*/
                    ,
                  )),
                ],
              ),
            ],
          ),
        ),
        durationInMilliseconds: 400,
      ),
    );
  }

  addTicket(bool addvoid) {
    List<LocalityListModel>? dataOrigin = [];

    if (ReduxHome.store!.state.postsState.dataListCar != null) {
      dataOrigin = ReduxHome.store!.state.postsState.dataListCar;
    }
    data!.urlImageConverter = data!.urlImageConverter;

    if (addvoid == true) {
      dataOrigin!.add(data!);
    } else {
      dataOrigin!.removeLast();
    }
    ReduxHome.store?.dispatch(
      SetPostsStateActionHome(
        PostsStateHome(dataListCar: dataOrigin),
      ),
    );
  }
}
