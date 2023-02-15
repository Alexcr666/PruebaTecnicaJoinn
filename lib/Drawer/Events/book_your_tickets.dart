import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/Theme/colors.dart';
import 'package:dj_mania/data/model/ticket/TicketListModel.dart';
import 'package:flutter/material.dart';

class BookYourTicketsPage extends StatefulWidget {
  final PageTicket? data;

  const BookYourTicketsPage({this.data});
  @override
  _BookYourTicketsPageState createState() => _BookYourTicketsPageState();
}

class _BookYourTicketsPageState extends State<BookYourTicketsPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.signInBackground,
            height: 210,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          FadedSlideAnimation(
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 110, left: 12, right: 12, bottom: 60),
                child: Column(
                  children: [
                    ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset(Assets.event1)),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 14, 20, 14),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Theme.of(context).backgroundColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            locale.bassHill!,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 17),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                Assets.djPin,
                                scale: 5,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '2202, Marion St. Bass Hill, Amsterdam',
                                style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 18,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                locale.randomDateTime!,
                                style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 24),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Theme.of(context).backgroundColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            locale.ticketDetails!,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 17),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text(
                                locale.platinumTicket!,
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
                              ),
                              Expanded(
                                child: Text(
                                  ' | 2 ' + locale.tickets! + ' @ \$130 ' + locale.each!,
                                  style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              // Spacer(),
                              Text(
                                '\$260.00',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text(
                                locale.convenienceCharges!,
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
                              ),
                              Text(
                                ' (2%)',
                                style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
                              ),
                              Spacer(),
                              Text(
                                '\$5.20',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: AppBar(
              backgroundColor: transparentColor,
              title: Text(
                locale.bookYourTickets!,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).backgroundColor),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.payOptionsPage);
              },
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              label: locale.proceedToPay! + ' \$265.20',
            ),
          ),
        ],
      ),
    );
  }
}
