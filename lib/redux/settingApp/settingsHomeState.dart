import 'dart:io';

import 'package:dj_mania/data/model/auth/UserModelId.dart';
import 'package:dj_mania/data/model/categories/categoriesListModel.dart';
import 'package:dj_mania/data/model/contracts/contracts.dart';
import 'package:dj_mania/data/model/dashboard/PlaceContractDashboardModel.dart';
import 'package:dj_mania/data/model/event/EventsListCategoriesModel.dart';
import 'package:dj_mania/data/model/event/eventDetailsModel.dart';
import 'package:dj_mania/data/model/event/eventListModel.dart';
import 'package:dj_mania/data/model/event/eventsModel.dart';
import 'package:dj_mania/data/model/event/listEventDetailsModel.dart';
import 'package:dj_mania/data/model/locality/LocalityDetailsModel.dart';
import 'package:dj_mania/data/model/locality/LocalityListModel.dart';
import 'package:dj_mania/data/model/place/PlaceListCategoriesModel.dart';
import 'package:dj_mania/data/model/place/placeDetails.dart';
import 'package:dj_mania/data/model/place/placeListDetailsModel.dart';
import 'package:dj_mania/data/model/place/placeModel.dart';
import 'package:dj_mania/data/model/purchase/PurchaseFilterModel.dart';
import 'package:dj_mania/data/model/purchase/PurchaseUserTicketsModel.dart';
import 'package:dj_mania/data/model/qr/LocalityListModel.dart';
import 'package:dj_mania/data/model/tax/taxListPaginateModel.dart';
import 'package:dj_mania/data/model/ticket/TicketListModel.dart';
import 'package:meta/meta.dart';

import 'package:meta/meta.dart';

import '../../data/model/place/placeModelListHome.dart';

@immutable
class PostsStateHome {
  //Glucose Date Data Filters
  final String? typeOfFilterSelected;
  final PlaceModel? placeModel;
  final EventsModel? eventsModel;
  final List<EventListHomeModel>? listevent;

  final List<EventListHomeModel>? listLikesEvents;
  final List<ContractsModel>? listContracts;
  final List<ListCategoriesModel>? listCategories;
  final List<ListCategoriesModel>? listCategoriesPlace;

  final List<PlaceListModel>? placeListModel;

  final UserModelIdModel? userModelIdModel;
  //EVENTS

  EventDetailsModel? eventDetailsModel;

//LOCALITY

  List<LocalityListModel>? listLocality;
  LocalityDetailsModel? localityDetailsModel;

  //LIKES

  int? totalLikes;
  //TICKET

  TicketLocalityListModel? ticketLocalityListModel;

  final List<ListEventDetailsModel>? listEventsCalendar;

  final List<ListEventDetailsModel>? listEventsCalendarStore;

  //CAR STORE
  List<ItemCartShop>? dataListCarCustom;

  List<LocalityListModel>? dataListCar;

  //QR TICKETS
  List<TicketListQrModel>? ticketListQrModel;
  int? selectedIndexTab;

  int? selectedIndexTabAdmin;
  ContractsModel? selectDropAdmin;
  List<String>? urlGeneratedStore;
  //ADMIN
  final List<PlaceListModel>? placeContractsListModel;

  //LIST EVENTS
  List<ListEventDetailsModel>? listEventDetails;
  List<ListEventDetailsModel>? listLikesEventDetails;
  //LIST STORE

  List<ListPlaceDetailsModel>? listPlaceDetailsModel;

  //LIST PURCHASE USER
  PurchaseUserTicketsModel? purchaseUserTicketsModel;

  List<PurchaseFiltersModel>? purchaseFiltersModel;

  //LIST EVENST FILTER
  EventsListCategoriesModel? eventsListCategoriesModel;

  PlaceListCategoriesModel? placeCategoriesListModel;

  //DASHBOARD

  PlaceContractDashboardModel? placeContractDashboardModel;
  PagePlaceContracts? selectDropPlace;

  //NIGHT DARK THEME

  bool? theme;
  TaxModel? taxListModel;

  PostsStateHome({
    this.typeOfFilterSelected,
    this.placeModel,
    this.eventsModel,
    this.listevent,
    this.listLikesEvents,
    this.listContracts,
    this.listCategories,
    this.placeListModel,
    this.eventDetailsModel,
    this.userModelIdModel,
    this.listCategoriesPlace,
    this.listLocality,
    this.localityDetailsModel,
    this.totalLikes,
    this.ticketLocalityListModel,
    this.listEventsCalendar,
    this.listEventsCalendarStore,
    this.dataListCar,
    this.dataListCarCustom,
    this.ticketListQrModel,
    this.selectedIndexTab,
    this.selectedIndexTabAdmin,
    this.selectDropAdmin,
    this.placeContractsListModel,
    this.urlGeneratedStore,
    this.listEventDetails,
    this.listLikesEventDetails,
    this.listPlaceDetailsModel,
    this.purchaseUserTicketsModel,
    this.eventsListCategoriesModel,
    this.placeCategoriesListModel,
    this.placeContractDashboardModel,
    this.selectDropPlace,
    this.theme,
    this.taxListModel,
    this.purchaseFiltersModel,
  });

  factory PostsStateHome.initial() => PostsStateHome(
        typeOfFilterSelected: '15 Días',
        eventsModel: null,
        listContracts: null,
        listevent: null,
        listLikesEvents: null,
        listCategories: null,
        placeListModel: null,
        eventDetailsModel: null,
        userModelIdModel: null,
        listCategoriesPlace: null,
        listLocality: null,
        localityDetailsModel: null,
        totalLikes: 0,
        ticketLocalityListModel: null,
        listEventsCalendar: null,
        listEventsCalendarStore: null,
        dataListCarCustom: null,
        placeModel: PlaceModel(amount: 0, base: "", date: DateTime.now(), rates: Rates(usd: 2)),
        dataListCar: null,
        ticketListQrModel: null,
        selectedIndexTab: 0,
        selectedIndexTabAdmin: 0,
        selectDropAdmin: null,
        placeContractsListModel: null,
        urlGeneratedStore: [],
        listEventDetails: null,
        listLikesEventDetails: null,
        listPlaceDetailsModel: null,
        purchaseUserTicketsModel: null,
        eventsListCategoriesModel: null,
        placeCategoriesListModel: null,
        placeContractDashboardModel: null,
        selectDropPlace: null,
        theme: false,
        taxListModel: null,
        purchaseFiltersModel: null,
      );

  PostsStateHome copyWith({
    String? typeOfFilterSelected,
    PlaceModel? placeModel,
    EventsModel? eventsModel,
    List<EventListHomeModel>? listevent,
    List<EventListHomeModel>? listLikesEvents,
    List<ListCategoriesModel>? listCategories,
    List<ContractsModel>? listContracts,
    List<PlaceListModel>? placeListModel,
    EventDetailsModel? eventDetailsModel,
    final UserModelIdModel? userModelIdModel,
    List<ListCategoriesModel>? listCategoriesPlace,
    List<LocalityListModel>? listLocality,
    LocalityDetailsModel? localityDetailsModel,
    int? totalLikes,
    TicketLocalityListModel? ticketLocalityListModel,
    List<ListEventDetailsModel>? listEventsCalendar,
    List<ListEventDetailsModel>? listEventsCalendarStore,
    List<LocalityListModel>? dataListCar,
    List<ItemCartShop>? dataListCarCustom,
    List<TicketListQrModel>? ticketListQrModel,
    int? selectedIndexTab,
    int? selectedIndexTabAdmin,
    ContractsModel? selectDropAdmin,
    List<PlaceListModel>? placeContractsListModel,
    List<String>? urlGeneratedStore,
    List<ListEventDetailsModel>? listEventDetails,
    List<ListEventDetailsModel>? listLikesEventDetails,
    List<ListPlaceDetailsModel>? listPlaceDetailsModel,
    PurchaseUserTicketsModel? purchaseUserTicketsModel,
    EventsListCategoriesModel? eventsListCategoriesModel,
    //  PlaceListCategoriesModel? placeListCategoriesModel,
    PlaceListCategoriesModel? placeCategoriesListModel,
    PlaceContractDashboardModel? placeContractDashboardModel,
    PagePlaceContracts? selectDropPlace,
    bool? theme,
    TaxModel? taxListModel,
    List<PurchaseFiltersModel>? purchaseFiltersModel,
  }) {
    return PostsStateHome(
        typeOfFilterSelected: typeOfFilterSelected ?? this.typeOfFilterSelected,
        placeModel: placeModel ?? this.placeModel,
        eventsModel: eventsModel ?? this.eventsModel,
        listevent: listevent ?? this.listevent,
        listLikesEvents: listLikesEvents ?? this.listLikesEvents,
        listContracts: listContracts ?? this.listContracts,
        listCategories: listCategories ?? this.listCategories,
        placeListModel: placeListModel ?? this.placeListModel,
        eventDetailsModel: eventDetailsModel ?? this.eventDetailsModel,
        userModelIdModel: userModelIdModel ?? this.userModelIdModel,
        listCategoriesPlace: listCategoriesPlace ?? this.listCategoriesPlace,
        listLocality: listLocality ?? this.listLocality,
        localityDetailsModel: localityDetailsModel ?? this.localityDetailsModel,
        totalLikes: totalLikes ?? this.totalLikes,
        ticketLocalityListModel: ticketLocalityListModel ?? this.ticketLocalityListModel,
        listEventsCalendar: listEventsCalendar ?? this.listEventsCalendar,
        listEventsCalendarStore: listEventsCalendarStore ?? this.listEventsCalendarStore,
        dataListCar: dataListCar ?? this.dataListCar,
        dataListCarCustom: dataListCarCustom ?? this.dataListCarCustom,
        ticketListQrModel: ticketListQrModel ?? this.ticketListQrModel,
        selectedIndexTab: selectedIndexTab ?? this.selectedIndexTab,
        selectedIndexTabAdmin: selectedIndexTabAdmin ?? this.selectedIndexTabAdmin,
        selectDropAdmin: selectDropAdmin ?? this.selectDropAdmin,
        placeContractsListModel: placeContractsListModel ?? this.placeContractsListModel,
        urlGeneratedStore: urlGeneratedStore ?? this.urlGeneratedStore,
        listEventDetails: listEventDetails ?? this.listEventDetails,
        listLikesEventDetails: listLikesEventDetails ?? this.listLikesEventDetails,
        listPlaceDetailsModel: listPlaceDetailsModel ?? this.listPlaceDetailsModel,
        purchaseUserTicketsModel: purchaseUserTicketsModel ?? this.purchaseUserTicketsModel,
        eventsListCategoriesModel: eventsListCategoriesModel ?? this.eventsListCategoriesModel,
        placeCategoriesListModel: placeCategoriesListModel ?? this.placeCategoriesListModel,
        placeContractDashboardModel: placeContractDashboardModel ?? this.placeContractDashboardModel,
        selectDropPlace: selectDropPlace ?? this.selectDropPlace,
        theme: theme ?? this.theme,
        taxListModel: taxListModel ?? this.taxListModel,
        purchaseFiltersModel: purchaseFiltersModel ?? this.purchaseFiltersModel);
  }
}

class ItemCartShop {
  List<PageTicket>? dataListCar;
  EventDetailsModel? eventDetailsModel;
  DateTime? dateCart;

  ItemCartShop({this.dataListCar, this.eventDetailsModel, this.dateCart});
}
