import 'package:dj_mania/Components/carStore.dart';
import 'package:dj_mania/redux/common_actions.dart';
import 'package:dj_mania/redux/login/login_state.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeState.dart';
import 'package:dj_mania/redux/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';

import 'package:dj_mania/redux/common_actions.dart';
//import 'package:dj_mania/redux/login/login_state.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeState.dart';
//import 'package:dj_mania/redux/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_redux/flutter_redux.dart';

//import 'package:redux/redux.dart';
class getPurchaseFilterAction extends ErrorAction {
  getPurchaseFilterAction(BuildContext context, this.status) : super(context);
  String status;
}

class getTaskPaginationAction extends ErrorAction {
  getTaskPaginationAction(BuildContext context) : super(context);
}

class createPaymentAction extends ErrorAction {
  createPaymentAction(
      BuildContext context, this.id, this.userId, this.datePurchase, this.paymentCode, this.paymentStatus, this.ticket, this.taxes)
      : super(context);
  String? id;
  String? userId;
  String? datePurchase;
  String? paymentCode;
  String? paymentStatus;

  List<TicketList> ticket;
  List<TaxList> taxes;
}

class checkOutAction extends ErrorAction {
  checkOutAction(BuildContext context, this.amount, this.description, this.orderId, this.returnUrl, this.transactionIdentifier)
      : super(context);
  String? amount;
  String? description;
  String? orderId;
  String? returnUrl;
  String? transactionIdentifier;
}

class getPlacesAction extends ErrorAction {
  getPlacesAction(BuildContext context) : super(context);
}

class getPlacesContractsAction extends ErrorAction {
  getPlacesContractsAction(BuildContext context, this.idContract) : super(context);
  String idContract;
}

class getEventsAction extends ErrorAction {
  getEventsAction(this.context) : super(context);
  BuildContext context;
}

class getContractsAction extends ErrorAction {
  getContractsAction(this.context, this.id) : super(context);
  BuildContext context;
  String id;
}

class getEventsCalendarAction extends ErrorAction {
  getEventsCalendarAction(this.context, {this.endDate, this.startDate, this.placeId}) : super(context);
  BuildContext context;
  String? startDate;
  String? endDate;
  String? placeId;
}

class getEventDetailsAction extends ErrorAction {
  getEventDetailsAction(this.context, this.id) : super(context);
  BuildContext context;
  String id;
}

class categoriesAction extends ErrorAction {
  categoriesAction(BuildContext context, this.id) : super(context);
  final String id;
}

//URL

class getUrlS3Action extends ErrorAction {
  getUrlS3Action(this.context, this.id) : super(context);
  BuildContext context;
  String id;
}

//LOCALITY

class listLocalityAction extends ErrorAction {
  listLocalityAction(BuildContext context, this.id) : super(context);
  final String id;
}

class listLocalityDetailsAction extends ErrorAction {
  listLocalityDetailsAction(BuildContext context, this.id) : super(context);
  final String id;
}

//LIKES

class getLikesAction extends ErrorAction {
  getLikesAction(BuildContext context, this.id) : super(context);
  final String id;
}

class getListLikesAction extends ErrorAction {
  getListLikesAction(BuildContext context) : super(context);
}

class addLikesAction extends ErrorAction {
  addLikesAction({required BuildContext context, this.id, this.eventId, this.userId, this.likeDate, this.add}) : super(context);
  final String? id;
  final String? eventId;
  final String? userId;
  final String? likeDate;
  final bool? add;
}

//TICKETS

class getTicketAction extends ErrorAction {
  getTicketAction(BuildContext context, this.id, this.page, this.pageSize) : super(context);
  final String id;
  final String page;
  final String pageSize;
}

//QR

class getQrAction extends ErrorAction {
  getQrAction(this.context) : super(context);
  BuildContext context;
}

//PURCHASE TICKETS USER

class getTicketsUserAction extends ErrorAction {
  getTicketsUserAction(this.context, this.idUser) : super(context);
  BuildContext context;
  String idUser;
}

//GET EVENTS LIST

class getEventsCategoriesAction extends ErrorAction {
  getEventsCategoriesAction(this.context, {this.idCategorie, this.type, this.idPlace}) : super(context);
  BuildContext context;
  String? idCategorie;
  String? type;
  String? idPlace;
}

class getPlaceCategoriesAction extends ErrorAction {
  getPlaceCategoriesAction(this.context, this.idCategorie) : super(context);
  BuildContext context;
  String? idCategorie;
}

//DASHBOARD

class getPlaceDashboardAction extends ErrorAction {
  getPlaceDashboardAction(this.context, this.id) : super(context);
  BuildContext context;
  String? id;
}

@immutable
class SetPostsStateActionHome {
  final PostsStateHome postsState;

  SetPostsStateActionHome(this.postsState);
}

class LoginActionSaveNewPasswordSetting extends ErrorAction {
  LoginActionSaveNewPasswordSetting(BuildContext context, this.id, this.token) : super(context);
  final String id;
  final String token;
}
