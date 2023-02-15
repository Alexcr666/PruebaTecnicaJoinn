import 'dart:async';
import 'dart:convert';

import 'package:dj_mania/Drawer/Calendar/calendarPage.dart';
import 'package:dj_mania/data/model/categories/categoriesListModel.dart';
import 'package:dj_mania/data/model/contracts/contracts.dart';
import 'package:dj_mania/data/model/dashboard/PlaceContractDashboardModel.dart';
import 'package:dj_mania/data/model/event/EventsListCategoriesModel.dart';
import 'package:dj_mania/data/model/event/eventDetailsModel.dart';
import 'package:dj_mania/data/model/event/eventListModel.dart';
import 'package:dj_mania/data/model/event/eventsModel.dart';
import 'package:dj_mania/data/model/event/listEventDetailsModel.dart';
import 'package:dj_mania/data/model/like/listLikeModel.dart';
import 'package:dj_mania/data/model/locality/LocalityDetailsModel.dart';
import 'package:dj_mania/data/model/locality/LocalityListModel.dart';
import 'package:dj_mania/data/model/locality/LocalityPaginateDetailsModel.dart';
import 'package:dj_mania/data/model/place/PlaceListCategoriesModel.dart';
import 'package:dj_mania/data/model/place/placeDetails.dart';
import 'package:dj_mania/data/model/place/placeListDetailsModel.dart';
import 'package:dj_mania/data/model/place/placeModelListHome.dart';
import 'package:dj_mania/data/model/purchase/PurchaseFilterModel.dart';
import 'package:dj_mania/data/model/purchase/PurchaseUserTicketsDetailsModel.dart';
import 'package:dj_mania/data/model/purchase/PurchaseUserTicketsModel.dart';
import 'package:dj_mania/data/model/qr/LocalityListModel.dart';
import 'package:dj_mania/data/model/tax/taxListPaginateModel.dart';
import 'package:dj_mania/data/model/ticket/TicketListModel.dart';
import 'package:dj_mania/utils/alert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dj_mania/services/endPoint.dart';
import 'package:redux/redux.dart';

import 'package:dj_mania/app/app_settings.dart';

import 'package:dj_mania/redux/app/app_state.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeState.dart';
import 'package:dj_mania/redux/settingApp/store.dart';

import '../../data/model/place/placeModel.dart';
import 'settingsHomeActions.dart';
import 'package:dj_mania/redux/store.dart';

class SettingHomeMiddleware extends MiddlewareClass<AppState> {
  SettingHomeMiddleware(this.api);

  final endPointApi api;

  @override
  Future<void> call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    if (action is getPlacesAction) {
      await _getPlace(next, action, store);
    }
    if (action is getEventsAction) {
      await _getEvents(next, action, store);
    }
    if (action is categoriesAction) {
      await _getCategories(next, action, store);
    }
    if (action is getEventDetailsAction) {
      await _getEventDetails(next, action, store);
    }

    if (action is getUrlS3Action) {
      await _getUrlS3(next, action, store);
    }

    if (action is getEventsCalendarAction) {
      await _getEventsCalendar(next, action, store);
    }

    if (action is listLocalityAction) {
      await _getListLocality(next, action, store);
    }

//LOCALITY

    if (action is listLocalityDetailsAction) {
      await _getLocalityDetails(next, action, store);
    }

    //LIKES

    if (action is getLikesAction) {
      await _getLikesHistory(next, action, store);
    }

    if (action is addLikesAction) {
      await _addLikesHistory(next, action, store);
    }
//TICKETS
    if (action is getTicketAction) {
      await _getTickets(next, action, store);
    }

    //QR
    if (action is getQrAction) {
      await _getQr(next, action, store);
    }

    if (action is getContractsAction) {
      await _getContracts(next, action, store);
    }

    //ADMIN

    if (action is getPlacesContractsAction) {
      await _getPlaceContracts(next, action, store);
    }

    //GET TICKETS USER PURCHASE

    if (action is getTicketsUserAction) {
      await _getTicketPurchase(next, action, store);
    }

    if (action is getEventsCategoriesAction) {
      await _getEventsCategories(next, action, store);
    }
    if (action is getPlaceCategoriesAction) {
      await _getPlaceCategories(next, action, store);
    }

    if (action is getPlaceDashboardAction) {
      await _getPlaceDashboard(next, action, store);
    }

    if (action is checkOutAction) {
      await _checkOut(next, action, store);
    }

    if (action is getListLikesAction) {
      await _getListLike(next, action, store);
    }
    if (action is getTaskPaginationAction) {
      await _getTax(next, action, store);
    }

    if (action is createPaymentAction) {
      await _createPayment(next, action, store);
    }

    if (action is getPurchaseFilterAction) {
      await _getPurchaseFilter(next, action, store);
    }
  }
}

Future<void> _getPurchaseFilter(NextDispatcher next, getPurchaseFilterAction action, Store<AppState> store) async {
  var response = await endPointApi().getTicketsPurchaseFiltersUserEndpoint(action.status);
  print("tax: " + response.data.toString());

  switch (response!.statusCode) {
    case AppSettings.statusCodeSuccess:
      List<PurchaseFiltersModel> data = purchaseFiltersModelFromJson(response.data);
      //   print("responseticket: " + data.toString());

      ReduxHome.store?.dispatch(
        SetPostsStateActionHome(
          PostsStateHome(purchaseFiltersModel: data),
        ),
      );

      break;
    case AppSettings.statusCodeError:
      //   AlertWidget().message(action.context, response.message);

      break;
    default:
    //   AlertWidget().message(action.context, response.message);
  }
}

Future<void> _createPayment(NextDispatcher next, createPaymentAction action, Store<AppState> store) async {
  print("paymente: " + action.ticket!.toList().toList().toString());
  var response = await endPointApi().createPaymentEvent(
      id: action.id,
      userId: action.userId,
      datePurchase: action.datePurchase,
      ticket: action.ticket,
      taxes: action.taxes,
      paymentStatus: "success",
      paymentCode: action.paymentCode.toString());

  List<LocalityListModel> dataClear = [];
  //   dataClear.add(data);

  ReduxHome.store?.dispatch(
    SetPostsStateActionHome(
      PostsStateHome(dataListCar: dataClear),
    ),
  );

  switch (response!.statusCode) {
    case AppSettings.statusCodeSuccess:
      /* TaxModel data = taxModelFromJson(response.data);
      //   print("responseticket: " + data.toString());

      ReduxHome.store?.dispatch(
        SetPostsStateActionHome(
          PostsStateHome(taxListModel: data),
        ),
      );*/

      break;
    case AppSettings.statusCodeError:
      //   AlertWidget().message(action.context, response.message);

      break;
    default:
    //   AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getTax(NextDispatcher next, getTaskPaginationAction action, Store<AppState> store) async {
  var response = await endPointApi().getTaxListPaginate();
  print("tax: " + response.data.toString());

  switch (response!.statusCode) {
    case AppSettings.statusCodeSuccess:
      TaxModel data = taxModelFromJson(response.data);
      //   print("responseticket: " + data.toString());

      ReduxHome.store?.dispatch(
        SetPostsStateActionHome(
          PostsStateHome(taxListModel: data),
        ),
      );

      break;
    case AppSettings.statusCodeError:
      //   AlertWidget().message(action.context, response.message);

      break;
    default:
    //   AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getListLike(NextDispatcher next, getListLikesAction action, Store<AppState> store) async {
  print("listlike1: ");
  var response = await endPointApi().getListLike();
  print("resultadoprueba: " + response.data.toString());
  switch (response!.statusCode) {
    case AppSettings.statusCodeSuccess:
      // List<ListLikeEventsModel> data = listLikeEventsModelFromJson(response.data);
      List<EventListHomeModel> data = eventListHomeModelFromJson(response.data);
      ReduxHome.store!.dispatch(
        SetPostsStateActionHome(
          PostsStateHome(listLikesEvents: data),
        ),
      );
      List<ListEventDetailsModel> listEventsDetails = [];
      print("resultado24: " + data.length.toString());
      for (var i = 0; i < data.length; i++) {
        endPointApi().getEventDetailsEndpoint(data[i].id.toString()).then((value) {
          print("resultado25: " + value.toString());

          ListEventDetailsModel data2 = listeventDetailsModelFromJson(value.data!);
          endPointApi().getUrlS3Endpoint(data2.bannerUrl).then((valueImage) {
            print("resultado16: ");
            data2.urlImageConverter = valueImage.data!.toString().toString();
            listEventsDetails.add(data2);

            endPointApi().getPlaceDetailsEndpoint(data2.placeId.toString()).then((valuePlace) {
              print("resultado17: ");
              print("resultado18: " + data.length.toString() + " : " + listEventsDetails.length.toString());

              PlaceDetailsModel dataPlace = placeDetailsModelFromJson(valuePlace.data!);
              data2.placeDetailsModel = dataPlace;

              endPointApi().getLocalityPaginateEndpoint(eventId: data[i].id.toString()).then((valuePaginate) {
                print("resultado16: ");
                print("resultado26: " + valuePaginate.data.toString());
                LocalityPaginateDetailsModel dataAmount = localityPaginateDetailsModelFromJson(valuePaginate.data);

                if (dataAmount.page!.length != 0) {
                  //   print("resultado22: " + dataAmount.page![0].price.toString());
                  data2.price = dataAmount.page![0].price.toString();
                } else {
                  data2.price = "0";
                }
                print("resultado23: " + data.length.toString() + ": " + listEventsDetails.length.toString());

                if (data.length == listEventsDetails.length) {
                  ReduxHome.store?.dispatch(
                    SetPostsStateActionHome(
                      PostsStateHome(listLikesEventDetails: listEventsDetails),
                    ),
                  );
                }
              });
            });
          });
        });
      }

      getEventsForDaySet();

      break;
    case AppSettings.statusCodeError:
      //   AlertWidget().message(action.context, response.message);

      break;
    default:
    //   AlertWidget().message(action.context, response.message);
  }
}

Future<void> _checkOut(NextDispatcher next, checkOutAction action, Store<AppState> store) async {
  var response = await endPointApi().checkout(
    amount: action.amount,
    description: action.description,
    orderId: action.orderId,
    returnUrl: action.returnUrl,
  );

  switch (response!.statusCode) {
    case AppSettings.statusCodeSuccess:
      PlaceContractDashboardModel data = placeContractDashboardModelFromJson(response.data);
      print("responseticket: " + data.toString());

      ReduxHome.store?.dispatch(
        SetPostsStateActionHome(
          PostsStateHome(placeContractDashboardModel: data),
        ),
      );

      break;
    case AppSettings.statusCodeError:
      //   AlertWidget().message(action.context, response.message);

      break;
    default:
    //   AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getPlaceDashboard(NextDispatcher next, getPlaceDashboardAction action, Store<AppState> store) async {
  var response = await endPointApi().getPlacesContractsEndpoint(contracts: action.id.toString());
  print("responseticket:" + response.data.toString());
  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      PlaceContractDashboardModel data = placeContractDashboardModelFromJson(response.data);
      print("responseticket: " + data.toString());

      ReduxHome.store?.dispatch(
        SetPostsStateActionHome(
          PostsStateHome(placeContractDashboardModel: data),
        ),
      );

      break;
    case AppSettings.statusCodeError:
      //   AlertWidget().message(action.context, response.message);

      break;
    default:
    //   AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getEventsCategories(NextDispatcher next, getEventsCategoriesAction action, Store<AppState> store) async {
  var response;
  print("placedata:1");
  if (action.type == "1") {
    response = await endPointApi().getEventsPaginateEndpoint(action.idCategorie.toString());
  } else {
    print("responseticket22:");
    response = await endPointApi().getEventsPaginatePlaceIdEndpoint(action.idPlace.toString());
  }

  print("placedata:" + response.data.toString());
  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      EventsListCategoriesModel dataPurchase = eventsListCategoriesModelFromJson(response.data);
      print("responseticket: " + dataPurchase.toString());
      if (dataPurchase.page!.length == 0) {
        EventsListCategoriesModel dataChange = new EventsListCategoriesModel();

        ReduxHome.store?.dispatch(
          SetPostsStateActionHome(
            PostsStateHome(eventsListCategoriesModel: dataChange),
          ),
        );
      } else {
        for (var i = 0; i < dataPurchase.page!.length; i++) {
          PageEventCategorie dataPage = dataPurchase.page![i];

          endPointApi().getUrlS3Endpoint(dataPage.bannerUrl.toString()).then((valueImage) {
            dataPurchase.page![i].urlConverterBanner = valueImage.data.toString();
            print("pruebaconverter: " + valueImage.toString());
            endPointApi().getUrlS3Endpoint(dataPage.logoUrl.toString()).then((valueImage) {
              dataPurchase.page![i].urlConverterLogo = valueImage.data.toString();

              //   dataPurchase.page![i].urlConverterLogo = valueImage.data.toString();
              endPointApi().getLocalityPaginateEndpoint(eventId: dataPage.id.toString()).then((valuePaginate) {
                //  print("resultado22: " + valuePaginate.data.toString());
                LocalityPaginateDetailsModel dataAmount = localityPaginateDetailsModelFromJson(valuePaginate.data);

                if (dataAmount.page!.length != 0) {
                  dataPurchase.page![i].price = dataAmount.page![0].price.toString();
                } else {
                  dataPurchase.page![i].price = "0";
                }

                print("pruebaticket: " + dataPurchase.page!.length.toString() + " : " + i.toString() + " :type: " + action.type.toString());

                if (dataPurchase.page!.length == (i + 1)) {
                  ReduxHome.store?.dispatch(
                    SetPostsStateActionHome(
                      PostsStateHome(eventsListCategoriesModel: dataPurchase),
                    ),
                  );
                }
              });
            });
          });
        }
      }

      break;
    case AppSettings.statusCodeError:
      //   AlertWidget().message(action.context, response.message);

      break;
    default:
    //   AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getPlaceCategories(NextDispatcher next, getPlaceCategoriesAction action, Store<AppState> store) async {
  var response = await endPointApi().getPlacePaginateEndpoint(action.idCategorie.toString());
  print("responseticket:" + response.data.toString());
  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      PlaceListCategoriesModel dataPurchase = placeListCategoriesModelFromJson(response.data);
      print("responseticket: " + dataPurchase.toString());
      if (dataPurchase.page!.length == 0) {
        PlaceListCategoriesModel dataChange = new PlaceListCategoriesModel();

        ReduxHome.store?.dispatch(
          SetPostsStateActionHome(
            PostsStateHome(placeCategoriesListModel: dataChange),
          ),
        );
      } else {
        for (var i = 0; i < dataPurchase.page!.length; i++) {
          PagePlaceCategorie dataPage = dataPurchase.page![i];

          endPointApi().getUrlS3Endpoint(dataPage.bannerUrl.toString()).then((valueImage) {
            dataPurchase.page![i].urlConverterBanner = valueImage.data.toString();
            endPointApi().getUrlS3Endpoint(dataPage.logoUrl.toString()).then((valueImage) {
              dataPurchase.page![i].urlConverterLogo = valueImage.toString();

              dataPurchase.page![i].urlConverterLogo = valueImage.data.toString();
              endPointApi().getLocalityPaginateEndpoint(eventId: dataPage.id.toString()).then((valuePaginate) {
                //  print("resultado22: " + valuePaginate.data.toString());
                LocalityPaginateDetailsModel dataAmount = localityPaginateDetailsModelFromJson(valuePaginate.data);

                if (dataAmount.page!.length != 0) {
                  dataPurchase.page![i].price = dataAmount.page![0].price.toString();
                } else {
                  dataPurchase.page![i].price = "0";
                }

                print("pruebaticket: " + dataPurchase.page!.length.toString() + " : " + i.toString());

                if (dataPurchase.page!.length == (i + 1)) {
                  ReduxHome.store?.dispatch(
                    SetPostsStateActionHome(
                      PostsStateHome(placeCategoriesListModel: dataPurchase),
                    ),
                  );
                }
              });
            });
          });
        }
      }

      break;
    case AppSettings.statusCodeError:
      //   AlertWidget().message(action.context, response.message);

      break;
    default:
    //   AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getTicketPurchase(NextDispatcher next, getTicketsUserAction action, Store<AppState> store) async {
  var response = await endPointApi().getTicketsPurchaseUserDataEndpoint(action.idUser);
//  print("responseticket:" + response.data.toString());
  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      PurchaseUserTicketsModel dataPurchase = purchaseUserTicketsModelFromJson(response.data);
      //  print("responseticket: " + dataPurchase.toString());
      if (dataPurchase.page!.length == 0) {
        PurchaseUserTicketsModel dataChange = new PurchaseUserTicketsModel(page: []);

        ReduxHome.store?.dispatch(
          SetPostsStateActionHome(
            PostsStateHome(purchaseUserTicketsModel: dataChange),
          ),
        );
      } else {
        print("--1--");
        for (PageTicketPurchase data in dataPurchase.page) {
          var dataTicket = await endPointApi().getTicketsPurchaseDataDetailsEndpoint(data.id.toString());

          PurchaseUserTicketsDetailsModel dataPurchaseDetails = purchaseUserTicketsDetailsModelFromJson(dataTicket.data);
          data.dataDetails = dataPurchaseDetails;

          // print("responseticket:" + dataPurchase.page!.length.toString() + " : " + i.toString());
          /*  if (dataPurchase.page!.length == (i + 1)) {
             
            }*/

          // await uploadVideo(video);
          print("--2--");
        }

        ReduxHome.store?.dispatch(
          SetPostsStateActionHome(
            PostsStateHome(purchaseUserTicketsModel: dataPurchase),
          ),
        );
        print("--3--");
      }

      /*  for (var i = 0; i < dataPurchase.page!.length; i++) {
          endPointApi().getTicketsPurchaseDataDetailsEndpoint(dataPurchase.page![i].id.toString()).then((value) {
            PurchaseUserTicketsDetailsModel dataPurchaseDetails = purchaseUserTicketsDetailsModelFromJson(value.data);
            dataPurchase.page![i].dataDetails = dataPurchaseDetails;

            print("responseticket:" + dataPurchase.page!.length.toString() + " : " + i.toString());
            if (dataPurchase.page!.length == (i + 1)) {
              ReduxHome.store?.dispatch(
                SetPostsStateActionHome(
                  PostsStateHome(purchaseUserTicketsModel: dataPurchase),
                ),
              );
            }
          });
        }
      }*/

      break;
    case AppSettings.statusCodeError:
      //   AlertWidget().message(action.context, response.message);

      break;
    default:
    //   AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getPlaceContracts(NextDispatcher next, getPlacesContractsAction action, Store<AppState> store) async {
  var response = await endPointApi().getPlacesContractsEndpoint(contracts: action.idContract);

  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      List<PlaceListModel> data = placeListModelFromJson(response.data);

      ReduxHome.store?.dispatch(
        SetPostsStateActionHome(
          PostsStateHome(placeContractsListModel: data),
        ),
      );
      break;
    case AppSettings.statusCodeError:
      //   AlertWidget().message(action.context, response.message);

      break;
    default:
    //   AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getQr(NextDispatcher next, getQrAction action, Store<AppState> store) async {
  var response = await endPointApi().getQrEndpoint();

  print("pruebaadd---" + response.data.toString());
  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      List<TicketListQrModel> data = ticketListQrModelFromJson(response.data);
      ReduxHome.store!.dispatch(
        SetPostsStateActionHome(
          PostsStateHome(ticketListQrModel: data),
        ),
      );

      break;
    case AppSettings.statusCodeError:
      //  AlertWidget().message(action.context, response.message);

      break;
    default:
    //  AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getTickets(NextDispatcher next, getTicketAction action, Store<AppState> store) async {
  var response = await endPointApi().getTicketsEndpoint(eventId: action.id, page: action.page, pageSize: action.pageSize);
  print("pruebaadd---" + response.data.toString() + action.id);
  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      TicketLocalityListModel data = ticketLocalityListModelFromJson(response.data);
      ReduxHome.store!.dispatch(
        SetPostsStateActionHome(
          PostsStateHome(ticketLocalityListModel: data),
        ),
      );

      break;
    case AppSettings.statusCodeError:
      //  AlertWidget().message(action.context, response.message);

      break;
    default:
    //  AlertWidget().message(action.context, response.message);
  }
}

Future<void> _addLikesHistory(NextDispatcher next, addLikesAction action, Store<AppState> store) async {
  var response;
  print("responseadd7:" + action.add.toString());
  if (action.add == true) {
    response = await endPointApi().addTotalLikes(action.id, action.eventId, action.userId, action.likeDate);
  } else {
    var response = await endPointApi().deleteLike(action.id, action.eventId, action.userId, action.likeDate);
  }
  print("refresh");
  async() async {
    // BuildContext? context = null;
    Store<AppState> store = await createStore(api: endPointApi());

    store.dispatch(getLikesAction(action.context, action.eventId.toString()));
    store.dispatch(getListLikesAction(action.context!));
  }

  async();
}

Future<void> _getLikesHistory(NextDispatcher next, getLikesAction action, Store<AppState> store) async {
  var response = await endPointApi().getTotalLikes(action.id);

  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      print("responselike--" + response.data.toString());
      ReduxHome.store!.dispatch(
        SetPostsStateActionHome(
          PostsStateHome(totalLikes: response.data),
        ),
      );

      break;
    case AppSettings.statusCodeError:
      AlertWidget().message(action.context, response.message);

      break;
    default:
      AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getLocalityDetails(NextDispatcher next, listLocalityDetailsAction action, Store<AppState> store) async {
  var response = await endPointApi().getListLocalityEndpoint();

  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      List<LocalityListModel>? data = localityListModelFromJson(response.data);
      ReduxHome.store!.dispatch(
        SetPostsStateActionHome(
          PostsStateHome(listLocality: data),
        ),
      );

      break;
    case AppSettings.statusCodeError:
      //  AlertWidget().message(action.context, response.message);

      break;
    default:
    //  AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getListLocality(NextDispatcher next, listLocalityAction action, Store<AppState> store) async {
  var response = await endPointApi().getListLocalityEndpoint(eventId: action.id);

  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      List<LocalityListModel>? data = localityListModelFromJson(response.data);
      print("responseticket1: " + action.id + " : " + response.data.toString());
      if (response.data.toString() == "[]") {
        data = [];
        ReduxHome.store!.dispatch(
          SetPostsStateActionHome(
            PostsStateHome(listLocality: data),
          ),
        );
      }

      for (var i = 0; i < data.length; i++) {
        var responseLocality = await endPointApi().ticketLocalityEndpoint(context: action.context, id: data[i].id);
        LocalityDetailsModel detailsModel = localityDetailsModelFromJson(responseLocality.data);
        data[i].dataDetails = detailsModel;
        var responseTicket = await endPointApi().getTicketsLocalityEndpoint(locality: data[i].id.toString());

        TicketLocalityListModel dataListTicket = ticketLocalityListModelFromJson(responseTicket.data);
        data[i].ticketList = dataListTicket;

        var responseUrlImage = await endPointApi().getUrlS3Endpoint(detailsModel.imageUrl.toString());

        data[i].urlImageConverter = responseUrlImage.data;

        print("execute: " + data.length.toString() + " : " + i.toString());
        if (data.length == (i + 1)) {
          ReduxHome.store!.dispatch(
            SetPostsStateActionHome(
              PostsStateHome(listLocality: data),
            ),
          );
        }
      }

      break;
    case AppSettings.statusCodeError:
      //  AlertWidget().message(action.context, response.message);

      break;
    default:
    //  AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getEventsCalendar(NextDispatcher next, getEventsCalendarAction action, Store<AppState> store) async {
  print("RESPONSE3---");

  var response = await endPointApi()
      .getEventsCalendarEndpoint(startDate: action.startDate, endDate: action.endDate, placeId: action.placeId, context: action.context);
  print("RESPONSE23---" + response.toString());
  //Navigator.pop(action.context);
  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      /* List<EventListHomeModel> data = eventListHomeModelFromJson(response.data);
      print("RESPONSE5---" + action.placeId.toString());
      if (action.placeId != "") {
        ReduxHome.store!.dispatch(
          SetPostsStateActionHome(
            PostsStateHome(listEventsCalendarStore: data),
          ),
        );
        print("RESPONSE4---" + response.toString());
      } else {
        ReduxHome.store!.dispatch(
          SetPostsStateActionHome(
            PostsStateHome(listEventsCalendar: data),
          ),
        );
      }*/

      List<EventListHomeModel> data = eventListHomeModelFromJson(response.data);
      /*ReduxHome.store!.dispatch(
        SetPostsStateActionHome(
          PostsStateHome(listevent: data),
        ),
      );*/
      List<ListEventDetailsModel> listEventsDetails = [];
      //  print("resultado12: " + data.length.toString());
      for (var i = 0; i < data.length; i++) {
        endPointApi().getEventDetailsEndpoint(data[i].id.toString()).then((value) {
          //   print("resultado12: " + value.toString());

          ListEventDetailsModel data2 = listeventDetailsModelFromJson(value.data!);
          endPointApi().getUrlS3Endpoint(data2.bannerUrl.toString()).then((valueImage) {
            data2.urlImageConverter = valueImage.data!.toString().toString();
            listEventsDetails.add(data2);

            endPointApi().getPlaceDetailsEndpoint(data2.placeId.toString()).then((valuePlace) {
              // print("resultado: " + data.length.toString() + " : " + listEventsDetails.length.toString());

              PlaceDetailsModel dataPlace = placeDetailsModelFromJson(valuePlace.data!);
              data2.placeDetailsModel = dataPlace;

              endPointApi().getLocalityPaginateEndpoint(eventId: data[i].id.toString()).then((valuePaginate) {
                //  print("resultado22: " + valuePaginate.data.toString());
                LocalityPaginateDetailsModel dataAmount = localityPaginateDetailsModelFromJson(valuePaginate.data);

                if (dataAmount.page!.length != 0) {
                  data2.price = dataAmount.page![0].price.toString();
                } else {
                  data2.price = "0";
                }

                //   print("RESPONSE13---" +dataAmount.page![0].amount.toString())
                // data2.price = "0";
                // print("RESPONSE4---" + data.length.toString() + " : " + listEventsDetails.length.toString());
                if (data.length == listEventsDetails.length) {
                  /*    ReduxHome.store?.dispatch(
                    SetPostsStateActionHome(
                      PostsStateHome(listEventDetails: listEventsDetails),
                    ),
                  );*/

                  if (action.placeId != "") {
                    ReduxHome.store!.dispatch(
                      SetPostsStateActionHome(
                        PostsStateHome(listEventsCalendarStore: listEventsDetails),
                      ),
                    );
                    print("RESPONSE10---" + ReduxHome.store!.state.postsState.listEventsCalendarStore.toString());
                  } else {
                    print("RESPONSE11---");
                    ReduxHome.store!.dispatch(
                      SetPostsStateActionHome(
                        PostsStateHome(listEventsCalendar: listEventsDetails),
                      ),
                    );
                  }
                }
              });
            });
          });
        });
      }

      // getEventsForDaySet();

      break;
    case AppSettings.statusCodeError:
      //   AlertWidget().message(action.context, response.message);

      break;
    default:
    //AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getUrlS3(NextDispatcher next, getUrlS3Action action, Store<AppState> store) async {
  var response = await endPointApi().getUrlS3Endpoint(action.id);
  print("prueba56: " + response.statusCode.toString());
  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      String url = response.data;

      break;
    case AppSettings.statusCodeError:
      // AlertWidget().message(action.context, response.message);

      break;
    default:
    //  AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getEventDetails(NextDispatcher next, getEventDetailsAction action, Store<AppState> store) async {
  var response = await endPointApi().getEventDetailsEndpoint(action.id);
  print("prueba56: " + response.statusCode.toString());
  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      //print("prueba57");
      EventDetailsModel? data = eventDetailsModelFromJson(response.data);
      // print("prueba57" + data.toString());
      ReduxHome.store?.dispatch(
        SetPostsStateActionHome(
          PostsStateHome(eventDetailsModel: data),
        ),
      );
      break;
    case AppSettings.statusCodeError:
      //  AlertWidget().message(action.context, response.message);

      break;
    default:
    //   AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getContracts(NextDispatcher next, getContractsAction action, Store<AppState> store) async {
  var response = await endPointApi().getContractsEndpoint(idUser: action.id);

  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      List<ContractsModel>? data = contractsModelFromJson(response.data);

      ReduxHome.store?.dispatch(
        SetPostsStateActionHome(
          PostsStateHome(listContracts: data),
        ),
      );
      break;
    case AppSettings.statusCodeError:
      //   AlertWidget().message(action.context, response.message);

      break;
    default:
    //  AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getCategories(NextDispatcher next, categoriesAction action, Store<AppState> store) async {
  var response = await endPointApi().getCategoriesEndpoint(action.id);
  print("prueba56: " + response.statusCode.toString());
  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      print("prueba57");
      List<ListCategoriesModel>? data = listCategoriesModelFromJson(response.data);

      var responseMixta = await endPointApi().getCategoriesEndpoint("3");
      List<ListCategoriesModel>? dataMixta = listCategoriesModelFromJson(responseMixta.data);
      print("mixta" + dataMixta!.length.toString());
      data.addAll(dataMixta);
      if (action.id == "1") {
        ReduxHome.store?.dispatch(
          SetPostsStateActionHome(
            PostsStateHome(listCategories: data),
          ),
        );
      } else {
        ReduxHome.store?.dispatch(
          SetPostsStateActionHome(
            PostsStateHome(listCategoriesPlace: data),
          ),
        );
      }
      break;
    case AppSettings.statusCodeError:
      // AlertWidget().message(action.context, response.message);

      break;
    default:
    // AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getPlace(NextDispatcher next, getPlacesAction action, Store<AppState> store) async {
  var response = await endPointApi().getPlacesEndpoint();

  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      List<PlaceListModel> data = placeListModelFromJson(response.data);

      ReduxHome.store?.dispatch(
        SetPostsStateActionHome(
          PostsStateHome(placeListModel: data),
        ),
      );

      List<ListPlaceDetailsModel> listPlaceDetails = [];
      print("resultado12: " + data.length.toString());
      for (var i = 0; i < data.length; i++) {
        endPointApi().getPlaceDetailsEndpoint(data[i].id.toString()).then((value) {
          print("resultado12: " + value.toString());

          ListPlaceDetailsModel data2 = listplaceDetailsModelFromJson(value.data!);
          endPointApi().getUrlS3Endpoint(data2.bannerUrl.toString()).then((valueImage) {
            data2.urlImageConverter = valueImage.data!.toString().toString();
            listPlaceDetails.add(data2);
            if (data.length == (listPlaceDetails.length + 1)) {
              ReduxHome.store?.dispatch(
                SetPostsStateActionHome(
                  PostsStateHome(listPlaceDetailsModel: listPlaceDetails),
                ),
              );
            }

            /*  endPointApi().getPlaceDetailsEndpoint(data2.placeId.toString()).then((valuePlace) {
              print("resultado: " + data.length.toString() + " : " + listEventsDetails.length.toString());

              PlaceDetailsModel dataPlace = placeDetailsModelFromJson(valuePlace.data!);
              data2.placeDetailsModel = dataPlace;
              if (data.length == (listEventsDetails.length + 1)) {
                ReduxHome.store?.dispatch(
                  SetPostsStateActionHome(
                    PostsStateHome(listEventDetails: listEventsDetails),
                  ),
                );
              }
            });*/
          });
        });
      }

      break;
    case AppSettings.statusCodeError:
      //   AlertWidget().message(action.context, response.message);

      break;
    default:
    //   AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getEvents(NextDispatcher next, getEventsAction action, Store<AppState> store) async {
  print("resultado1: ");
  var response = await endPointApi().getEventsEndpoint(context: action.context);

  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      List<EventListHomeModel> data = eventListHomeModelFromJson(response.data);
      ReduxHome.store!.dispatch(
        SetPostsStateActionHome(
          PostsStateHome(listevent: data),
        ),
      );
      List<ListEventDetailsModel> listEventsDetails = [];
      print("resultado24: " + data.length.toString());
      for (var i = 0; i < data.length; i++) {
        endPointApi().getEventDetailsEndpoint(data[i].id.toString()).then((value) {
          print("resultado25: " + value.toString());

          ListEventDetailsModel data2 = listeventDetailsModelFromJson(value.data!);
          endPointApi().getUrlS3Endpoint(data2.bannerUrl).then((valueImage) {
            print("resultado16: ");
            data2.urlImageConverter = valueImage.data!.toString().toString();
            listEventsDetails.add(data2);

            endPointApi().getPlaceDetailsEndpoint(data2.placeId.toString()).then((valuePlace) {
              print("resultado17: ");
              print("resultado18: " + data.length.toString() + " : " + listEventsDetails.length.toString());

              PlaceDetailsModel dataPlace = placeDetailsModelFromJson(valuePlace.data!);
              data2.placeDetailsModel = dataPlace;

              endPointApi().getLocalityPaginateEndpoint(eventId: data[i].id.toString()).then((valuePaginate) {
                print("resultado16: ");
                print("resultado26: " + valuePaginate.data.toString());
                LocalityPaginateDetailsModel dataAmount = localityPaginateDetailsModelFromJson(valuePaginate.data);

                if (dataAmount.page!.length != 0) {
                  //   print("resultado22: " + dataAmount.page![0].price.toString());
                  data2.price = dataAmount.page![0].price.toString();
                } else {
                  data2.price = "0";
                }
                print("resultado23: " + data.length.toString() + ": " + listEventsDetails.length.toString());

                if (data.length == listEventsDetails.length) {
                  ReduxHome.store?.dispatch(
                    SetPostsStateActionHome(
                      PostsStateHome(listEventDetails: listEventsDetails),
                    ),
                  );
                }
              });
            });
          });
        });
      }

      getEventsForDaySet();

      break;
    case AppSettings.statusCodeError:
      //  AlertWidget().message(action.context, response.message);

      break;
    default:
      AlertWidget().message(action.context, response.message);
  }
}
