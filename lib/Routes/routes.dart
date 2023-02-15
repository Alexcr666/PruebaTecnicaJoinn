import 'package:dj_mania/Auth/Login/UI/login_ui.dart';
import 'package:dj_mania/Checkout/pay_options.dart';
import 'package:dj_mania/Checkout/ticket_booked.dart';
import 'package:dj_mania/Drawer/Events/book_your_tickets.dart';
import 'package:dj_mania/Drawer/Events/dj_info.dart';
import 'package:dj_mania/Drawer/Events/event_detail.dart';
import 'package:dj_mania/Drawer/Events/events.dart';
import 'package:dj_mania/Drawer/Events/select_seat.dart';
import 'package:dj_mania/Drawer/FAQs/faqs.dart';
import 'package:dj_mania/Drawer/MyDJs/my_djays.dart';
import 'package:dj_mania/Drawer/MyTickets/my_tickets.dart';
import 'package:dj_mania/Drawer/MyTickets/ticket_info.dart';
import 'package:dj_mania/Drawer/Profile/my_profile.dart';
import 'package:dj_mania/Drawer/TnC/tnc.dart';
import 'package:dj_mania/Drawer/change_language_page.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static const String eventsPage = 'home_page';
  static const String eventDetail = 'event_detail';
  static const String djInfoPage = 'dj_info_page';
  static const String selectSeatPage = 'select_seat';
  static const String bookYourTicket = 'book_your_ticket';
  static const String payOptionsPage = 'pay_options';
  static const String ticketBookedPage = 'ticket_booked';
  static const String myTicketsPage = 'my_tickets';
  static const String ticketInfoPage = 'ticket_info';
  static const String myProfilePage = 'my_profile';
  static const String myDJays = 'my_djays';
  static const String faqPage = 'faq_page';
  static const String tncPage = 'tnc_page';
  static const String languagePage = 'language_page';

  static const String loginPage = 'login_page';

  Map<String, WidgetBuilder> routes() {
    return {
      loginPage: (context) => LoginUI(),

      eventsPage: (context) => EventsPage(),
      //eventDetail: (context) => EventDetailPage(data: Event(),),
      djInfoPage: (context) => DJInfoPage(),
      // selectSeatPage: (context) => SelectSeatPage(),
      bookYourTicket: (context) => BookYourTicketsPage(),
      payOptionsPage: (context) => PayOptionPage(),
      ticketBookedPage: (context) => TicketBookedPage(),
      myTicketsPage: (context) => MyTicketsPage(),
      // ticketInfoPage: (context) => TicketInfoPage(),
      myProfilePage: (context) => MyProfile(),
      myDJays: (context) => MyDJays(),
      faqPage: (context) => FAQPage(),
      tncPage: (context) => TnCPage(),
      languagePage: (context) => ChangeLanguagePage(),

      languagePage: (context) => ChangeLanguagePage(),
    };
  }
}
