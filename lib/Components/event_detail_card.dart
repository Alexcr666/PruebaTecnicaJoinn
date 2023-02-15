import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/carStore.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:dj_mania/data/model/ticket/TicketListModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EventDetailCard extends StatefulWidget {
  EventDetailCard({key, this.dataEvent});

  List<ItemCartShop2>? dataEvent;
  @override
  _EventDetailCardState createState() => _EventDetailCardState();
}

class _EventDetailCardState extends State<EventDetailCard> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    PageTicket data = widget.dataEvent![0].dataListCar![0];
    final date = new DateFormat('yyyy-MM-dd');
    final time = new DateFormat('hh:mm a');
    return FadedSlideAnimation(
      Container(
        margin: const EdgeInsets.only(top: 200, left: 12, right: 12),
        padding: const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              data.eventName.toString(),
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 12,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.asset(
                Assets.djPin,
                scale: 5,
              ),
              title: Text(
                data.localityName.toString(),
                style: Theme.of(context).textTheme.caption,
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
                    date.format(data.datePurchase!.toUtc()),
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
                    time.format(data.datePurchase!.toUtc()),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
                  ),
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: ListTile(
                  title: Text(
                    locale.ticketType!,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  subtitle: Text(
                    widget.dataEvent![0].nameLocality.toString(),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
                  ),
                )),
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
              data: 'This QR code will show the error state instead',
              version: 1,
              size: 320,
              gapless: false,
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
    );
  }
}
