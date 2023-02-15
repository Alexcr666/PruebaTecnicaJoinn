import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Components/event_detail_card.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:dj_mania/data/model/event/eventDetailsModel.dart';
import 'package:dj_mania/data/model/place/placeDetails.dart';
import 'package:dj_mania/data/model/purchase/PurchaseFilterModel.dart';
import 'package:dj_mania/data/model/purchase/PurchaseUserTicketsDetailsModel.dart';
import 'package:dj_mania/services/endPoint.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';

class TicketInfoPage extends StatefulWidget {
  // Requiring the list of todos.
  TicketInfoPage({required this.dataTicket});
  final Tiket dataTicket;

  @override
  _TicketInfoPageState createState() => _TicketInfoPageState();
}

class _TicketInfoPageState extends State<TicketInfoPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var sp;
    var date = DateFormat('KK:MM a');
    return Scaffold(
      //  backgroundColor: AppColors.mainColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          FutureBuilder(
              future: endPointApi().getEventDetailsEndpoint(widget.dataTicket!.eventId.toString()),
              builder: (
                BuildContext context,
                AsyncSnapshot snapshot,
              ) {
                print(snapshot.connectionState);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text(
                    'Error',
                    style: TextStyle(color: Colors.black),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text(
                      'Error',
                      style: TextStyle(color: Colors.black),
                    );
                  } else if (snapshot.hasData) {
                    EventDetailsModel? data = eventDetailsModelFromJson(snapshot.data!.data);
                    return Image.network(
                      data.bannerUrl.toString(),
                      height: 230,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                      // color: AppColors.primaryColor,
                    );
                  } else {
                    return const Text(
                      'Error',
                      style: TextStyle(color: Colors.black),
                    );
                  }
                } else {
                  return const Text(
                    'Error',
                    style: TextStyle(color: Colors.black),
                  );
                }

                // EventDetailsModel? data = eventDetailsModelFromJson(jsonEncode(snapshot.data!.toString()));
              }),
          Text(
            'Error',
            style: TextStyle(color: Colors.black),
          ),
          SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: FadedSlideAnimation(
              Container(
                margin: const EdgeInsets.only(top: 100, left: 12, right: 12),
                padding: const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  //  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.dataTicket!.eventName.toString().replaceAll("EventName.", "").toString().replaceAll("_", " "),
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors().textColorGeneral, fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Image.asset(
                        Assets.djPin,
                        scale: 5,
                        color: AppColors.primaryColor,
                      ),
                      title: Text(
                        widget.dataTicket!.localityName.toString().toString()!.replaceAll("Name.", "").replaceAll("_", " ").toString(),
                        style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12.sp),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ListTile(
                          title: Text(
                            "Date"!,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          subtitle: Text(
                            /*date.format(data.datePurchase!.toUtc())*/ DateFormat(DateFormat.YEAR_MONTH_DAY, 'Es')
                                .format(widget.dataTicket!.dateTimeEvent!.toUtc())
                                .toString(),
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
                          ),
                        )),
                        Expanded(
                            child: ListTile(
                          title: Text(
                            locale.time!,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          subtitle: Text(
                            /*time.format(data.datePurchase!.toUtc())*/
                            date.format(widget.dataTicket!.dateTimeEvent!.toUtc()).toString(),
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
                          ),
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        /*  Expanded(
                            child: ListTile(
                          title: Text(
                            locale.ticketType!,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          subtitle: Text(
                            widget.dataTicket!.eventName.toString(),
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
                          ),
                        )),*/
                        /* Expanded(
                    child: ListTile(
                  title: Text(
                    locale.visitorName!,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  subtitle: Text(
                    'Sam Smith + 1 other',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
                  ),
                )),*/
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Divider(),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      locale.showTheQRCode!,
                      style: Theme.of(context).textTheme.caption,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    QrImage(
                      data: widget.dataTicket.hashCode.toString(),
                      // version: 1,
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primaryColor,
                      size: 300,
                      // gapless: false,
                      errorStateBuilder: (cxt, err) {
                        return Container(
                          child: Center(
                            child: Text(
                              "Uh oh! Something went wrong...",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              beginOffset: Offset(0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              color: AppColors.primaryColor,
              textColor: Colors.white,
              onTap: () {
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              label: "Volver",
            ),
          ),
          PositionedDirectional(
            start: 8,
            top: 60,
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20.sp,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }
}
