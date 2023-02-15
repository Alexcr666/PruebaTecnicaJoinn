import 'dart:convert';

import 'package:ffi/ffi.dart';

import 'package:dj_mania/main.dart';
import 'package:dj_mania/redux/login/login_actions.dart';
import 'package:dj_mania/redux/login/login_state.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeActions.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeState.dart';
import 'package:dj_mania/redux/sign_up/sign_up_actions.dart';
import 'package:dj_mania/redux/sign_up/sign_up_state.dart';
//import 'package:dj_mania/devices/glucoseDevice.dart';

//import 'package:dj_mania/redux/login/login_actions.dart';
//import 'package:dj_mania/redux/login/login_state.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeActions.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeState.dart';

PostsStateHome postsReducerHome(PostsStateHome prevState, dynamic action) {
  // if (action is SetPostsStateActionHome) {
  final payload = action.postsState;

  return prevState.copyWith(
      placeModel: payload.placeModel,
      typeOfFilterSelected: '',
      eventsModel: payload.eventsModel,
      listevent: payload.listevent,
      listContracts: payload.listContracts,
      listCategories: payload.listCategories,
      placeListModel: payload.placeListModel,
      userModelIdModel: payload.userModelIdModel,
      eventDetailsModel: payload.eventDetailsModel,
      listCategoriesPlace: payload.listCategoriesPlace,
      listLocality: payload.listLocality,
      localityDetailsModel: payload.localityDetailsModel,
      totalLikes: payload.totalLikes,
      ticketLocalityListModel: payload.ticketLocalityListModel,
      listEventsCalendar: payload.listEventsCalendar,
      listEventsCalendarStore: payload.listEventsCalendarStore,
      dataListCar: payload.dataListCar,
      dataListCarCustom: payload.dataListCarCustom,
      ticketListQrModel: payload.ticketListQrModel,
      selectedIndexTab: payload.selectedIndexTab,
      selectedIndexTabAdmin: payload.selectedIndexTabAdmin,
      selectDropAdmin: payload.selectDropAdmin,
      placeContractsListModel: payload.placeContractsListModel,
      listEventDetails: payload.listEventDetails,
      listPlaceDetailsModel: payload.listPlaceDetailsModel,
      purchaseUserTicketsModel: payload.purchaseUserTicketsModel,
      eventsListCategoriesModel: payload.eventsListCategoriesModel,
      placeCategoriesListModel: payload.placeCategoriesListModel,
      placeContractDashboardModel: payload.placeContractDashboardModel,
      selectDropPlace: payload.selectDropPlace,
      listLikesEvents: payload.listLikesEvents,
      listLikesEventDetails: payload.listLikesEventDetails,
      taxListModel: payload.taxListModel,
      theme: payload.theme,
      purchaseFiltersModel: payload.purchaseFiltersModel);
  //}
  // return prevState.copyWith(
  //  placeModel: payload.placeModel, typeOfFilterSelected: '',
  //);
}
