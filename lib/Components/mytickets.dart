import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Drawer/MyTickets/ticket_info.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:dj_mania/app/app_vectors.dart';
import 'package:dj_mania/data/model/purchase/PurchaseFilterModel.dart';
import 'package:dj_mania/data/model/purchase/PurchaseUserTicketsModel.dart';
import 'package:dj_mania/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../data/model/purchase/PurchaseUserTicketsDetailsModel.dart';

class MyTicketList extends StatelessWidget {
  //PurchaseFiltersModel? data;
  Tiket data;
  // final Ticket? dataTicket;
  // final PageTicketPurchase? pageTicketPurchase;
  var date = DateFormat('KK:MM a');
  MyTicketList({required this.data});
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TicketInfoPage(
                    dataTicket: data,
                  )),
        );
      },
      child: FadedScaleAnimation(
        Container(
          margin: const EdgeInsets.only(top: 10, left: 12, right: 12),
          padding: const EdgeInsets.only(top: 20, bottom: 8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors().backgroundColorAppBar),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      data!.eventName.toString().replaceAll("EventName.", "").toString().replaceAll("_", " "),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: AppColors().textColorGeneral, fontSize: 13.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Price: " + converterMoney(data!.eventId.toString().replaceAll(".0", "").toString()),
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
              ListTile(
                leading: Image.asset(
                  Assets.djPin,
                  scale: 5,
                  color: AppColors.primaryColor,
                ),
                title: Text(
                  data!.localityName.toString()!.replaceAll("Name.", "").replaceAll("_", " ").toString(),
                  style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10.sp, color: AppColors().textColorGeneral),
                ),
              ),
              Divider(
                height: 4,
              ),
              Row(
                children: [
                  Expanded(
                      child: ListTile(
                    title: Text(
                      locale.date!,
                      style: Theme.of(context).textTheme.caption!.copyWith(color: AppColors().textColorGeneral),
                    ),
                    subtitle: Text(
                      DateFormat(DateFormat.YEAR_MONTH_DAY, 'Es').format(data!.dateTimeEvent!.toUtc()).toString(),
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16, color: AppColors().textColorGeneral),
                    ),
                  )),
                  Expanded(
                      child: ListTile(
                    title: Text(
                      locale.time!,
                      style: Theme.of(context).textTheme.caption!.copyWith(color: AppColors().textColorGeneral),
                    ),
                    subtitle: Text(
                      date.format(data!.dateTimeEvent!.toUtc()).toString(),
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16, color: AppColors().textColorGeneral),
                    ),
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
}
