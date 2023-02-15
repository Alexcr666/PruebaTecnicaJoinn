import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Checkout/ticket_booked.dart';
import 'package:dj_mania/Components/carStore.dart';
import 'package:dj_mania/Drawer/app_drawer.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:dj_mania/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview_quill/flutter_inappwebview_quill.dart';
//import 'package:flutter_html/flutter_html.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';
//import 'package:flutter_html/flutter_html.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PayTicketsPage extends StatefulWidget {
  // Requiring the list of todos.
  PayTicketsPage({key, this.checkOutLogo, this.amount, this.description, this.orderId, this.returnUrl, this.transactions, this.dataEvent});
  String? checkOutLogo;
  String? amount;
  String? description;
  String? orderId;
  String? returnUrl;
  String? transactions;
  List<ItemCartShop2>? dataEvent;
  @override
  _PayTicketsPageState createState() => _PayTicketsPageState();
}

String codeResult = "";

class _PayTicketsPageState extends State<PayTicketsPage> {
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    String? checkOutLogo = widget.checkOutLogo;
    String? amount = widget.amount;
    String? description = widget.description;
    String? returnId = widget.returnUrl;
    String? transactions = widget.transactions;
    int refresh = 0;

    String body =
        "checkout_logo=$checkOutLogo&description=$description&amount=$amount&return_url=$returnId&transaction_identifier=$transactions";
    return Scaffold(
      // drawer: AppDrawer(),
      appBar: AppWidgetSize().appBar(title: "Pay"),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse("https://checkout.vpaysecure.com/pay"),
            method: 'POST',
            body: Uint8List.fromList(utf8.encode(body)),
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}),
        onWebViewCreated: (controller) {
          print("responde1: ");
        },
        onLoadStart: (controller, url) {
          print("responde2: " + url.toString());
        },
        onLoadStop: (controller, url) {},
        onLoadHttpError: (controller, url, statusCode, description) {
          Navigator.push(
            context!,
            MaterialPageRoute(
                builder: (context) => TicketBookedPage(
                      dataEvent: widget.dataEvent,
                    )),
          );
          print("responde4: " + url.toString() + description.toString());
        },
        onConsoleMessage: (controller, consoleMessage) {
          print("responde5: " + consoleMessage.toString());
          loading = false;
          //  setState(() {});
        },
        onLoadError: (controller, url, code, message) {
          print("responde6: " + url.toString() + message.toString());
        },
      ),
      /*  Html(
              data: """
                <div>Follow<a class='sup'><sup>pl</sup></a> 
                  Below hr
                    <b>Bold</b>
                <h1>what was sent down to you from your Lord</h1>, 
                and do not follow other guardians apart from Him. Little do 
                <span class='h'>you remind yourselves</span><a class='f'><sup f=2437>1</sup></a></div>
                """,
              //padding: EdgeInsets.all(8.0),
              /*    onLinkTap: (url) {
                print("Opening $url...");
              },*/
            ),*/
    );
  }

  @override
  void initState() {
    loading = false;
  }
}
