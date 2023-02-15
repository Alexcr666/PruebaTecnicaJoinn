import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/Theme/colors.dart';
import 'package:flutter/material.dart';

class PayOptionPage extends StatefulWidget {
  @override
  _PayOptionPageState createState() => _PayOptionPageState();
}

class _PayOptionPageState extends State<PayOptionPage> {
  int? value;
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<String?> payOptions = [
      locale.payPal,
      locale.payUMoney,
      locale.bankTransfer,
      locale.chequePayment,
      locale.netBanking,
      locale.payOnSpot,
    ];
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.signInBackground,
            height: 150,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          AppBar(
            backgroundColor: transparentColor,
            title: Text(
              locale.selectOptionToPay!,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).backgroundColor),
            ),
          ),
          FadedSlideAnimation(
            Padding(
                padding: const EdgeInsets.only(top: 70, left: 12, right: 12, bottom: 60),
                child: ListView.builder(
                    itemCount: payOptions.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        padding: EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: RadioListTile(
                          activeColor: Theme.of(context).primaryColor,
                          value: index,
                          groupValue: value,
                          onChanged: (dynamic ind) => setState(() => value = ind),
                          title: Text(payOptions[index]!),
                        ),
                      );
                    })),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.ticketBookedPage);
              },
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              label: locale.pay! + ' \$265.20',
            ),
          ),
        ],
      ),
    );
  }
}
