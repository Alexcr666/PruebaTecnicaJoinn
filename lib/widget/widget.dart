import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dj_mania/Checkout/ticket_booked.dart';
import 'package:dj_mania/Components/carStore.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Drawer/Events/event_detail.dart';
import 'package:dj_mania/Drawer/Events/shopers/shoperDetails.dart';
import 'package:dj_mania/Drawer/Events/shopers/shoperPage.dart';
import 'package:dj_mania/Drawer/Profile/my_profile.dart';
import 'package:dj_mania/Drawer/pay/payTickets.dart';
import 'package:dj_mania/Theme/colors.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:dj_mania/data/model/event/listEventDetailsModel.dart';
import 'package:dj_mania/data/model/place/placeDetails.dart';
import 'package:dj_mania/data/model/place/placeModelListHome.dart';
import 'package:dj_mania/data/model/tax/taxListPaginateModel.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:dj_mania/services/endPoint.dart';
import 'package:dj_mania/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AppWidgetSize {
  Widget itemEventSearch(BuildContext context, ListEventDetailsModel data, {bool? calendar}) {
    String urlImage = "";
    String title = "";
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

    Widget itemInfoEvent(PlaceDetailsModel? data2, bool info) {
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
            info != true ? "" : data2!.name.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 14, color: data.featured == true ? Colors.grey : AppColors().textColorGeneral.withOpacity(0.5)),
          ),
          Text(info != true ? "" : data2!.address.toString(),
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
            child: Row(
              children: [
                data.urlImageConverter == ""
                    ? Container(height: 100.sp, width: 85.sp, child: AppWidgetSize().noImage())
                    : Container(
                        height: 100.sp,
                        width: 85.sp,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: data.urlImageConverter.toString(),
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
                itemInfoEvent(data.placeDetailsModel, true),
              ],
            ),
          ),
        ));
  }

  Widget divider() {
    return Container(
      width: double.infinity,
      height: 0.8,
      color: AppColors().textColorGeneral.withOpacity(0.2),
    );
  }

  appBar({String? title}) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      centerTitle: false,
      backgroundColor: AppColors().backgroundColorAppBar,
      title: Text(
        title.toString(),
        style: TextStyle(fontSize: 25, color: AppColors.secondaryTextColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget itemProfile(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context!,
          MaterialPageRoute(builder: (context) => MyProfile()),
        );
      },
      child: ReduxHome.store!.state.postsState.userModelIdModel == null
          ? CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              backgroundColor: Colors.transparent,
            )
          : ReduxHome.store!.state.postsState.userModelIdModel!.imageUrl == null
              ? CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  backgroundColor: Colors.transparent,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Container(
                      height: 50,
                      width: 50,
                      child: AppWidgetSize().imageUrlS3(ReduxHome.store!.state.postsState.userModelIdModel!.imageUrl.toString()))),
    );
  }

  Widget noResult() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "No hay resultados",
              style: TextStyle(fontSize: 19.0, color: AppColors().textColorGeneral),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget itemCarVisibleLocality(int? totalTicket, {BuildContext? context, List<ItemCartShop2>? dataEvent, bool? car}) {
    double totalTicketint = 0;
    double totalTicketintView = 0;
    // kkk

    executeCart() {
      for (var i = 0; i < ReduxHome.store!.state.postsState.dataListCar!.length; i++) {
        totalTicketint += ReduxHome.store!.state.postsState.dataListCar![i].dataDetails!.price!;
        totalTicketintView += ReduxHome.store!.state.postsState.dataListCar![i].dataDetails!.price!;
      }
      for (var i = 0; i < ReduxHome.store!.state.postsState.taxListModel!.page!.length; i++) {
        PageTax data = ReduxHome.store!.state.postsState.taxListModel!.page![i];
        double tax = (totalTicketintView / 100) * int.parse(data.percent.toString().replaceAll("0.", ""));
        totalTicketint += tax;
      }
    }

    if (ReduxHome.store!.state.postsState.dataListCar != null) {
      executeCart();
    }
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(children: [
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Container(
                width: 200,
                child: Text(
                  "Total" + ": ",
                  style: TextStyle(fontSize: 12.sp, color: AppColors().textColorGeneral),
                  textAlign: TextAlign.left,
                )),
            SizedBox(
              width: 5,
            ),
            // Text(),
            Text(
              converterMoney(totalTicketintView.toString()),
              style: TextStyle(fontSize: 19.0, color: AppColors().textColorGeneral, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        ReduxHome.store!.state.postsState.taxListModel == null
            ? Text("No hay resultados", style: TextStyle(fontSize: 15.0, color: Colors.white))
            : ReduxHome.store!.state.postsState.taxListModel!.page!.length == 0
                ? Text("No hay resultados", style: TextStyle(fontSize: 15.0, color: Colors.white))
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: ReduxHome.store!.state.postsState.taxListModel!.page!.length,
                    itemBuilder: (context, index) {
                      PageTax data = ReduxHome.store!.state.postsState.taxListModel!.page![index];
                      return Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                              width: 200,
                              child: Text(
                                data.name.toString() + ": ",
                                style: TextStyle(fontSize: 12.sp, color: AppColors().textColorGeneral),
                                textAlign: TextAlign.left,
                              )),
                          SizedBox(
                            width: 5,
                          ),

                          // Text(),

                          // Text(data.percent.toString()),
                          Text(
                            converterMoney(
                                    ((totalTicketintView / 100) * int.parse(data.percent.toString().replaceAll("0.", ""))).toString()) +
                                "  (" +
                                data.percent.toString().replaceAll("0.", "") +
                                "%" +
                                ")",
                            style: TextStyle(fontSize: 19.0, color: AppColors().textColorGeneral, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      );
                    }),
        CustomButton(
          color: AppColors.primaryColor,
          onTap: () {
            print("result5000: " + dataEvent.toString());
            if (car != true) {
              Navigator.push(
                context!,
                MaterialPageRoute(builder: (context) => CarStorePage()),
              );
            } else {
              Navigator.push(
                context!,
                MaterialPageRoute(
                    builder: (context) => PayTicketsPage(
                          returnUrl: "https://google.com",
                          checkOutLogo: "https://www.shareicon.net/data/2015/08/14/84930_ticket_512x512.png",
                          description: "Pay Tickets",
                          amount: totalTicketint.toString(),
                          orderId: "MMX-23032bcd2",
                          transactions: "7e3a5bdf-80a2-404d-a0c3-3077528c705a",
                          dataEvent: dataEvent,
                        )),
              );
            }
            // Navigator.pushNamed(context, PageRoutes.payOptionsPage);
          },
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          label: converterMoney(totalTicketint.toString()).toString(),
          textColor: Colors.white,
          textSize: 15.sp,
        )
      ]),
    );
  }

  Widget itemCarVisible(int? totalTicket, {BuildContext? context, List<ItemCartShop2>? dataEvent}) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomButton(
        textColor: Colors.white,
        color: AppColors.primaryColor,
        onTap: () {
          Navigator.push(
            context!,
            MaterialPageRoute(
                builder: (context) => PayTicketsPage(
                      returnUrl: "https://google.com",
                      checkOutLogo: "https://www.shareicon.net/data/2015/08/14/84930_ticket_512x512.png",
                      description: "Pay Tickets",
                      amount: totalTicket.toString(),
                      orderId: "MMX-23032bcd2",
                      transactions: "7e3a5bdf-80a2-404d-a0c3-3077528c705a",
                      dataEvent: dataEvent,
                    )),
          );

          /*Navigator.push(
            context!,
            MaterialPageRoute(builder: (context) => TicketBookedPage()),
          );*/
          // Navigator.pushNamed(context, PageRoutes.payOptionsPage);
        },
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        label: "Total" + ' \$' + converterMoney(totalTicket!.toString()).toString(),
      ),
    );
  }

  Widget loadingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Expanded(child: SizedBox()),
            Container(height: 40, width: 40, child: CircularProgressIndicator()),
            Expanded(child: SizedBox()),
          ],
        )
      ],
    );
  }

  alertCamera(BuildContext context, {Function? tap1, Function? tap2}) {
    File? image;

    showDialog(
      barrierDismissible: false,
      context: context,
      useRootNavigator: false,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text("Gallery", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      onTap: () {
                        tap1!();
                      },
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.grey,
                      height: 1,
                    ),
                    ListTile(
                      title: Text("Camera", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      onTap: () {
                        tap2!();
                      },
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.grey,
                      height: 1,
                    ),
                    ListTile(
                      title: Text("Cancelar", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )));
      },
    );
  }

  Widget widgetOptionText2(String fecha) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                fecha.toLowerCase(),
              )),
          SizedBox(
            child: SizedBox(),
          ),
        ],
      ),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10) //
            //        <--- border radius here
            ),
      ),
    );
  }

  Widget imageUrlS3(String url) {
    return FutureBuilder<MyHttpResponse>(
      future: endPointApi().getUrlS3Endpoint(url),
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
            print("prueba45:--- " + snapshot.data!.data.toString());
            return /* snapshot.data!.data.toString() != "null"
                    ? AppWidgetSize().noImage()
                    : */
                Container(
                    height: 100,
                    width: 100,
                    //margin: EdgeInsets.only(top: 10, left: 140, right: 140),
                    child: Image.network(
                      snapshot.data!.data.toString(),
                      errorBuilder: (BuildContext? context, Object? exception, StackTrace? stackTrace) {
                        return Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                                ),
                          ),
                          child: Icon(Icons.person_off_outlined),
                        );
                      },
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

  Widget noImage() {
    return Container(
      width: double.infinity,
      height: 200,
      child: Icon(
        Icons.hide_image,
        size: 70,
        color: AppColors().textColorGeneral.withOpacity(0.5),
      ),
    );
  }
}

Widget itemListView(BuildContext context, PlaceListModel data) {
  return GestureDetector(
    onTap: () {
      /*   Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ShopDetailPage(
                  data: data,
                  imageUrl: "",
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
              ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                  child: Image.network(
                    "data.image",
                    height: 115,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Container(
                height: 115,
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
                  "data.title",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20, color: Theme.of(context).backgroundColor),
                ),
              )
            ],
          ),
          ListTile(
            dense: true,
            // leading: Image.asset(Assets.djPin, scale: 4, color: Color(0xff4B7AD0)),
            title: Text(
              "data.date.toString()",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14, color: Colors.white),
            ),
            subtitle: Text("data.location", style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10, color: Colors.white)),
            trailing: Text('2.3 km ', style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10, color: Colors.white)),
          ),
          SizedBox(
            height: 25,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(
                  flex: 5,
                ),
                /*  ListView.builder(
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
                  '\$ ' + "data.price.toString()",
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
}
