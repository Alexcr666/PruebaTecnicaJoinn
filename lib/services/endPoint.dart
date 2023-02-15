import 'dart:convert';
import 'dart:io';

import 'package:dj_mania/Components/carStore.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/app/app_constants.dart';
import 'package:dj_mania/app/app_settings.dart';
import 'package:dj_mania/data/model/event/eventDetailsModel.dart';
import 'package:dj_mania/redux/app/app_state.dart';
import 'package:dj_mania/redux/login/store.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:dj_mania/sharedPreferences/sharePreferences.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:redux/redux.dart';

import 'package:http/http.dart' as http;

class endPointApi {
  endPointApi();

  Store<AppState>? store;

  Future<void> loadStore(Store<AppState> store) async {
    this.store = store;
  }

  static const bool debug = AppSettings.debug;
  static const String version = AppSettings.version;
  static const String mnt = '';
  /* static const String baseUrl = AppSettings.debug
      ? 'backdcm.zutrics.com:8000'
      : 'backdcm.zutrics.com:8000'; */

  static const String baseUrl = AppSettings.debug ? "34.238.126.246" : "34.238.126.246";

  static final PLACE_URL = "Category/FindByID?id=2";
  static final EVENTS_URL = "Event/ToList";
  static final CREATE_USER_URL = "/User/Register";

  static final IDENTIFICATION_TYPE_URL = "/Common/ToListIdentificationType";

  static final UPDATE_USER = "/User/Update";

  static final CONTRACTS_URL = "/Contract/ToList";

  static final CATEGORIES_URL = "Category/FindByID?id=2";

  Future<MyHttpResponse> getTaxListPaginate() async {
    String url = "http://34.238.126.246/Tax/Paginate?page=0&pageSize=100";

    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getListLike() async {
    String url = "http://34.238.126.246/Event/AllEventsLike";

    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse?> checkout(
      {String? amount, String? description, String? orderId, String? returnUrl, String? transactionIdentifier}) async {
    Map<String, String> params;
    params = {
      "checkout_logo": "https://multimedia.corprensa.com/la-prensa/assets/logo_laprensa_panama.svg",
      "description": description.toString(),
      "amount": amount.toString(),
      "return_url": returnUrl.toString(),
      "order_id": orderId.toString(),
      "transaction_identifier": transactionIdentifier.toString()
    };

    //var url = Uri.http(baseUrl, CREATE_USER_URL);
    String url = "http://34.238.126.246/User/Register";
    MyHttpResponse? response = await postRequestMultipart(url, jsonMap: params);
    print("registro" + response.toString());

    return response;
  }
  //GET TICKETS USER

  Future<MyHttpResponse> getDashboardPlaceContractEndpoint(String id) async {
    String url = "http://34.238.126.246/Place/Paginate?contractID=$id&page=0&pageSize=100";
    // print("requesturl" + url.toString());
    MyHttpResponse response = await getRequest(url);

    return response;
  }

//GET TICKETS USER

  Future<MyHttpResponse> getTicketsPurchaseDataDetailsEndpoint(String id) async {
    String url = "http://34.238.126.246/Purchase/FindDetailByID?id=$id";
    // print("requesturl" + url.toString());
    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getEventsPaginateEndpoint(String id) async {
    String url = "http://34.238.126.246/Event/Paginate?categoryID=$id";
    // print("requesturl" + url.toString());
    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getEventsPaginatePlaceIdEndpoint(String id) async {
    String url = "http://34.238.126.246/Event/Paginate?placeID=$id";
    print("requesturl" + url.toString());
    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getPlacePaginateEndpoint(String id) async {
    String url = "http://34.238.126.246/Place/Paginate?categoryID=$id&page=0&pageSize=100";
    // print("requesturl" + url.toString());
    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getTicketsPurchaseUserDataEndpoint(String idUser) async {
    String url = "http://34.238.126.246/Purchase/Paginate?userID=$idUser&page=0&pageSize=100";
    // print("requesturl" + url.toString());
    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getTicketsPurchaseFiltersUserEndpoint(String status) async {
    String url = "http://34.238.126.246/purchase/findsales?status=$status";
    // print("requesturl" + url.toString());
    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getTicketsPurchaseUserEndpoint(String idUser) async {
    String url = "http://34.238.126.246/Purchase/Paginate?userID=$idUser";
    // print("requesturl" + url.toString());
    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getQrEndpoint() async {
    String url = "http://34.238.126.246/ticket/findmetadata?id=8";
    // print("requesturl" + url.toString());
    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getTicketsEndpoint({String? eventId, String? pageSize, String? page}) async {
    String url = "http://34.238.126.246/Ticket/Paginate?eventID=$eventId&page=$page&pageSize=$pageSize";
    print("requesturl" + url.toString());
    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getLocalityPaginateEndpoint({String? eventId}) async {
    String url = "http://34.238.126.246/Locality/Paginate?eventID=" + eventId!;
    print("requesturl" + url.toString());
    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getTicketsLocalityEndpoint({String? locality}) async {
    String url = "http://34.238.126.246/Ticket/Paginate?localityID=" + locality!;
    print("requesturl" + url.toString());
    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getUrlS3Endpoint(String urlD) async {
    String url = "http://34.238.126.246/S3/GetUrl?key=" + urlD.toString();
    print("requesturl---" + url.toString());
    MyHttpResponse response = await getRequestString(url);
    print("requesturl-2---" + response.data.toString());
    return response;
  }

  Future<MyHttpResponse> getImageEvents(String id) async {
    //var url = Uri.http(baseUrl, PLACE_URL);

    String url = "http://34.238.126.246/Event/FindDetailByID?id=" + id;

    MyHttpResponse response = await getRequest(url);

    EventDetailsModel? data = eventDetailsModelFromJson(response.data);

    String url2 = "http://34.238.126.246/S3/GetUrl?key=" + data.bannerUrl.toString();
    print("prueba45---: " + url2.toString());
    MyHttpResponse response2 = await getRequest(url2);
    print("prueba46: " + response2.toString());
    return response2;
  }

  Future<MyHttpResponse> getPlacesContractsEndpoint({String? contracts}) async {
    //var url = Uri.http(baseUrl, PLACE_URL);
    String url = "http://34.238.126.246/Place/Paginate?contractID=$contracts&page=0&pageSize=100";

    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getPlacesEndpoint() async {
    //var url = Uri.http(baseUrl, PLACE_URL);
    String url = "http://34.238.126.246/Place/ToList";

    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getEventDetailsEndpoint(String id) async {
    //var url = Uri.http(baseUrl, PLACE_URL);
    String url = "http://34.238.126.246/Event/FindDetailByID?id=" + id.toString();
    print("resultado31" + url.toString() + ReduxLogin.store!.state.postsState.userLoginModel!.token.toString());
    MyHttpResponse response = await getRequest(url);
    print("resultado32" + response.data.toString());
    return response;
  }

  Future<MyHttpResponse> getPlaceDetailsEndpoint(String id) async {
    //var url = Uri.http(baseUrl, PLACE_URL);
    String url = "http://34.238.126.246/Place/FindDetailByID?id=" + id;

    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getIdentificationType() async {
    //var url = Uri.http(baseUrl, PLACE_URL);
    String url = "http://34.238.126.246/Common/ToListIdentificationType";

    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getContractsEndpoint({String? idUser}) async {
    //var url = Uri.http(baseUrl, CONTRACTS_URL);
    String url = "http://34.238.126.246/Contract/ToList?userID=$idUser";

    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getCategoriesEndpoint(String id) async {
    // var url = Uri.http(baseUrl, CATEGORIES_URL);
    var url = "http://34.238.126.246/Category/ToList?type=" + id;
    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse?> addUser(
      {String? email,
      String? password,
      String? name,
      String? lastname,
      String? identification,
      String? identificationType,
      String? phone,
      String? imageUrl,
      String? state}) async {
    Map<String, String> params;
    params = {
      "provider": "local",
      "email": email!,
      "password": password!,
      "firstname": name!,
      "lastname": lastname!,
      "identification": identification!,
      "identificationTypeId": /*identificationType!*/ "1",
      "phone": phone!,
      "imageUrl": imageUrl!,
      "state": state!,
    };

    //var url = Uri.http(baseUrl, CREATE_USER_URL);
    String url = "http://34.238.126.246/User/Register";
    MyHttpResponse? response = await postRequestMultipart(url, jsonMap: params);
    print("registro" + response.toString());

    return response;
  }

  Future<MyHttpResponse> updateUser(
      {String? email,
      String? password,
      String? name,
      String? lastname,
      String? identification,
      String? identificationType,
      String? phone,
      String? imageUrl,
      String? state}) async {
    var url = Uri.http(baseUrl, UPDATE_USER);

    MyHttpResponse response = await putRequest(url);

    return response;
  }

  Future<MyHttpResponse> getIdentificationType2(BuildContext context) async {
    var url = "http://34.238.126.246/Common/ToListIdentificationType";
    //var url = Uri.http(baseUrl, IDENTIFICATION_TYPE_URL);
    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> getEventsEndpoint({BuildContext? context}) async {
    //var url = Uri.http(baseUrl, EVENTS_URL);
    var url = "http://34.238.126.246/Event/ToList";
    MyHttpResponse response = await getRequest(url.toString(), context: context);

    return response;
  }

  Future<MyHttpResponse> getTotalLikes(String id) async {
    //var url = Uri.http(baseUrl, EVENTS_URL);
    var url = "http://34.238.126.246/Event/TotalLike?id=" + id;
    MyHttpResponse response = await getRequest(url.toString());

    return response;
  }

  Future<MyHttpResponse> addTotalLikes(String? id, String? eventId, String? userId, String? likeDate) async {
    //var url = Uri.http(baseUrl, EVENTS_URL);

    var url = "http://34.238.126.246/Event/AddLike";

    Map<String, String> params;

    params = {
      "id": id!,
      "eventID": eventId!,
      "userID": userId!,
      "likeDate": likeDate!,
    };

    MyHttpResponse response = await postRequestRaw(Uri.parse(url), jsonMap: params);
    print("responseadd: " + response.data.toString());
    return response;
  }

  Future<MyHttpResponse> deleteLike(String? id, String? eventId, String? userId, String? likeDate) async {
    //var url = Uri.http(baseUrl, EVENTS_URL);
    var url = "http://34.238.126.246/Event/DeleteLike?id=" + eventId.toString();

    Map<String, String> params;

    /* params = {
      "id": id!,
      "eventID": eventId!,
      "userID": userId!,
      "likeDate": likeDate!,
    };*/

    MyHttpResponse response = await deleteRequest(Uri.parse(url));
    print("responseadd: " + response.data.toString() + " . : " + url.toString());
    return response;
  }

  Future<MyHttpResponse> getEventsCalendarEndpoint({String? startDate, String? endDate, String? placeId, BuildContext? context}) async {
    //var url = Uri.http(baseUrl, EVENTS_URL);
    var url = "http://34.238.126.246/Event/ToList?startEvent=$startDate&endEvent=$endDate";
    if (placeId != "") {
      url = "http://34.238.126.246/Event/ToList?placeID=" + placeId!;
    }

    MyHttpResponse response = await getRequest(url.toString(), context: context);

    return response;
  }

  Future<MyHttpResponse> getEventsEndpoint2({required String circleId, required String type}) async {
    var url = Uri.http(baseUrl, PLACE_URL);

    Map<String, String> params;

    params = {"circle_id": circleId, "type": type};

    MyHttpResponse response = await postRequestAuth(url, jsonMap: params);

    return response;
  }

//LOCALITY

  Future<MyHttpResponse> getListLocalityEndpoint({BuildContext? context, String? eventId}) async {
    //var url = Uri.http(baseUrl, EVENTS_URL);
    var url = "http://34.238.126.246/Locality/ToList?eventID=" + eventId.toString();
    MyHttpResponse response = await getRequest(url, context: context);

    return response;
  }

  List<Map<String, String>> ticket = [];
  Future<MyHttpResponse?> createPaymentEvent(
      {String? id,
      String? userId,
      String? datePurchase,
      String? paymentCode,
      String? paymentStatus,
      List<TicketList>? ticket,
      List<TaxList>? taxes}) async {
    /* Map params;
    params = {
      "id": id,
      "userID": userId,
      "datePurchase": datePurchase,
      "paymentCode": paymentCode,
      "paymentStatus": paymentStatus,
      "tickets": ticket,
      "taxes": taxes,
    };*/
    Map<String, Object> params2;

    /*params2 = {
      //"id": id.toString(),
      // "userID": userId.toString(),
      //  "datePurchase": datePurchase.toString(),
      "paymentCode": paymentCode.toString(),
      "paymentStatus": paymentStatus.toString(),
      "tickets": ticket!.toList().toString(),
      "taxes": taxes!.toList().toString()
    };*/

    /* params2 = {
      "paymentCode": paymentCode.toString(),
      "paymentStatus": " success",
      "tickets": [
        {"id": "5", "localityId": "9", "amount": "10", "unitPrice": "1"}
      ],
      "taxes": [
        {"id": "1", "taxId": "1", "percent": "0.19", "value": "1"}
      ]
    };

    params2 = {
      "paymentCode": "1222",
      "paymentStatus": "success",
      "tickets": [
        {"id": "7", "localityId": "10", "amount": "12", "unitPrice": "1"}
      ],
      "taxes": [
        {"id": "2", "taxId": "2", "percent": "0.2", "value": "1"}
      ]
    };*/
    //var jsonTickets = jsonEncode(ticket!.map((e) =>  TaxList.toJson()).toList());
    //var jsonTax = jsonEncode(taxes!.map((e) => e.toJson()).toList());

    /*params2 = {
      "paymentCode": "10032s",
      "paymentStatus": "success",
      // "tickets": ticket!.toString(),
      //"tickets": ticket!.toList(),
      //  "taxes": taxes!.toList(),
      "tickets": [
        {"id": "7", "localityId": "10", "amount": "12", "unitPrice": "1"}
      ],
      "taxes": [
        {"id": "2", "taxId": "2", "percent": "0.2", "value": "1"}
      ]
      // "taxes": taxes!.toString()
    };*/
    /* params2 = {
      "paymentCode": "122s2",
      "paymentStatus": "success",
      "tickets": [
        {"id": "7", "localityId": "10", "amount": "12", "unitPrice": "1"}
      ],
      "taxes": [
        {"id": "2", "taxId": "2", "percent": "0.2", "value": "1"}
      ]
    };*/
    //print("paymentresult: " + params2.toString());
    //var url = Uri.http(baseUrl, CREATE_USER_URL);
    String url = "http://34.238.126.246/Purchase/Create";
//String json = "";
    //for (var i = 0; i < ticket!.length; i++) {}
    // print("json: " + ticket.toString());
    List<Map<String, String>> ticketData = [
      //   {"id": "7", "localityId": "10", "amount": "12", "unitPrice": "1"}
    ];

    List<Map<String, String>> taxData = [];

    for (var i = 0; i < ticket!.length; i++) {
      TicketList data = ticket[i];
      ticketData.add({
        "id": data.id.toString(),
        "localityId": data.localityId.toString(),
        "amount": data.amount.toString(),
        "unitPrice": data.unitPrice.toString()
      });
    }

    for (var i = 0; i < taxes!.length; i++) {
      TaxList dataTax = taxes[i];
      taxData.add({
        "id": dataTax.id.toString(),
        "taxId": dataTax.taxId.toString(),
        "percent": dataTax.percent.toString(),
        "value": dataTax.value.toString()
      });
    }
    params2 = {
      "paymentCode": paymentCode.toString(),
      "paymentStatus": " success",
      //  "tickets": ticket!.toList(),
      //  "tickets": json.toString(),
      "tickets": ticketData,
      "taxes": taxData,
    };
    print("params: " + params2.toString());
    MyHttpResponse? response = await postRequestAuth(Uri.parse(url), jsonMap: params2);
    print("registro: " +
        url.toString() +
        " : " +
        response.data.toString() +
        " : " +
        response.statusCode.toString() +
        "  params: " +
        params2.toString());

    return response;
  }

  Future<MyHttpResponse> updatePaymentCar(String? id, String? eventId, String? userId, String? likeDate) async {
    //var url = Uri.http(baseUrl, EVENTS_URL);
    var url = "http://34.238.126.246/Purchase/UpdatePaymentStatus";

    Map<String, String> params;

    params = {"purchaseID": "0", "status": "string"};

    MyHttpResponse response = await deleteRequest(Uri.parse(url), jsonMap: params);
    print("responseadd: " + response.data.toString());
    return response;
  }

  Future<MyHttpResponse> getNumberTicketsEndpoint({BuildContext? context, String? eventId}) async {
    //var url = Uri.http(baseUrl, EVENTS_URL);
    var url = "http://34.238.126.246/Locality/ToList?eventID=" + eventId.toString();
    MyHttpResponse response = await getRequest(url, context: context);

    return response;
  }

  Future<MyHttpResponse> recoverPasswordEndpoint({BuildContext? context, String? email}) async {
    //var url = Uri.http(baseUrl, EVENTS_URL);
    var url = "http://34.238.126.246/User/RecoverAccount?email=$email";
    MyHttpResponse response = await getRequest(url, context: context);

    return response;
  }

  Future<MyHttpResponse> ticketLocalityEndpoint({BuildContext? context, String? id}) async {
    //var url = Uri.http(baseUrl, EVENTS_URL);
    var url = "http://34.238.126.246/Locality/FindDetailByID?id=" + id!;
    MyHttpResponse response = await getRequest(url, context: context);

    return response;
  }

  Future<MyHttpResponse> deleteUserEndpoint(String? id, String delete) async {
    //var url = Uri.http(baseUrl, EVENTS_URL);
    var url = "http://34.238.126.246/User/Delete?id=1";

    Map<String, String> params;

    params = {"id": "0", "status": "string"};

    MyHttpResponse response = await deleteRequest(Uri.parse(url), jsonMap: params);
    print("responseadd: " + response.data.toString());
    return response;
  }

//D
}

Future<MyHttpResponse> postRequest2(Uri uri,
    {bool shouldRetry = true, required Map jsonMap, required Map additionalHeaders, bool mntFlag = true}) async {
  Map<String, String> headers = {
    'Authorization': ReduxLogin.store!.state.postsState.userLoginModel! == null
        ? ""
        : "Bearer " + ReduxLogin.store!.state.postsState.userLoginModel!.token.toString(),
    'Content-Type': "application/json",
  };
  //headers.addEntries(additionalHeaders.entries);
  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.post(uri, body: json.encode(jsonMap), headers: headers);
  //print("prueba2:" + response.body.toString());
  // print("prueba3:" + json.encode(jsonMap).toString());
  // if (response.statusCode == 505 && shouldRetry) {
  // } else if (response.statusCode == 511) {}

  var data = json.decode(utf8.decode(response.bodyBytes));
  // print("prueba602: "+data["status"]["code"].toString());
  return MyHttpResponse(response.statusCode, response.body, message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
}

Future<MyHttpResponse> postRequestRaw(Uri uri, {bool shouldRetry = true, Map? jsonMap, Map? additionalHeaders, bool mntFlag = true}) async {
  Map<String, String> headers = {
    'Authorization': ReduxLogin.store!.state.postsState.userLoginModel! == null
        ? ""
        : "Bearer " + ReduxLogin.store!.state.postsState.userLoginModel!.token.toString(),
    'Content-Type': "application/json",
  };
  //if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);
  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.post(uri, body: json.encode(jsonMap), headers: headers);
  //print("prueba2:" + response.body.toString());
  print("prueba2:" +
      uri.toString() +
      jsonMap.toString() +
      "result:---" +
      response.body.toString() +
      "---STATUS: " +
      response.statusCode.toString() +
      jsonMap.toString() +
      "---HEADERS: " +
      headers.toString());
  var data;
  try {
    data = json.decode(utf8.decode(response.bodyBytes));
  } catch (e) {}
  // print("prueba602: "+data["status"]["code"].toString());
  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
}

Future<MyHttpResponse> postRequestAuth22(Uri uri,
    {bool shouldRetry = true, var jsonMap, Map? additionalHeaders, bool mntFlag = true}) async {
  Map<String, String> headers = {
    'Authorization': "Bearer " + ReduxLogin.store!.state.postsState.userLoginModel!.token.toString(),
    'Content-Type': "application/json",
  };
  // if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);
  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.post(uri, body: json.encode(jsonMap), headers: headers);
  // print("prueba2:" + response.body.toString() + " :    " + jsonMap.toString());
  // print("prueba3:" + json.encode(jsonMap).toString());
  // if (response.statusCode == 505 && shouldRetry) {
  // } else if (response.statusCode == 511) {}

  var data = json.decode(utf8.decode(response.bodyBytes));
  // print("prueba602: "+data["status"]["code"].toString());
  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? "mensaje" : '');
}

Future<MyHttpResponse> postRequestAuth(Uri uri,
    {bool shouldRetry = true, Map? jsonMap, Map? additionalHeaders, bool mntFlag = true}) async {
  Map<String, String> headers = {
    'Authorization': ReduxLogin.store!.state.postsState.userLoginModel! == null
        ? ""
        : "Bearer " + ReduxLogin.store!.state.postsState.userLoginModel!.token.toString(),
    'Content-Type': "application/json",
  };
  // if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);
  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.post(uri, body: json.encode(jsonMap), headers: headers);
  print("prueba2:" + response.body.toString() + " :    " + jsonMap.toString());
  // print("prueba3:" + json.encode(jsonMap).toString());
  // if (response.statusCode == 505 && shouldRetry) {
  // } else if (response.statusCode == 511) {}

  var data = json.decode(utf8.decode(response.bodyBytes));
  // print("prueba602: "+data["status"]["code"].toString());
  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? "mensaje" : '');
}

Future<MyHttpResponse> postRequest(Uri uri, {bool shouldRetry = true, Map? jsonMap, Map? additionalHeaders, bool mntFlag = true}) async {
  Map<String, String> headers = {
    'Authorization': ReduxLogin.store!.state.postsState.userLoginModel! == null
        ? ""
        : "Bearer " + ReduxLogin.store!.state.postsState.userLoginModel!.token.toString(),
    //'Content-Type': "application/json",
  };
  // if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);
  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.post(uri, body: json.encode(jsonMap), headers: headers);
  print("prueba2:" +
      uri.toString() +
      jsonMap.toString() +
      "result:---" +
      response.body.toString() +
      "---STATUS: " +
      response.statusCode.toString() +
      jsonMap.toString() +
      "---HEADERS: " +
      headers.toString());
  // print("prueba3:" + json.encode(jsonMap).toString());
  // if (response.statusCode == 505 && shouldRetry) {
  // } else if (response.statusCode == 511) {}

  var data = json.decode(utf8.decode(response.bodyBytes));

  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
}

Future<MyHttpResponse> getRequestString(String uri, {bool shouldRetry = true, Map? additionalHeaders}) async {
  Map<String, String> headers = {
    'Authorization': ReduxLogin.store!.state.postsState.userLoginModel! == null
        ? ""
        : "Bearer " + ReduxLogin.store!.state.postsState.userLoginModel!.token.toString(),
    //'Content-Type': "application/json",
  };
  //if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);

  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.get(Uri.parse(uri.toString()), headers: headers);
  print("pruebaurl: " + uri.toString());
  var data = response.body;
  print("RESPONSE---->" + response.body);
  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? "" : '');
}

String token =
    "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiIyIiwiUHJvdmlkZXIiOlsibG9jYWwiLCJVc3VhcmlvIl0sImdpdmVuX25hbWUiOiJQcmltZXIiLCJlbWFpbCI6ImFkbWluaXN0cmFkb3JAZ21haWwuY29tIiwicm9sZSI6IlPDunBlciBhZG1pbmlzdHJhZG9yIiwibmJmIjoxNjYyMzc4NzQyLCJleHAiOjE2NjIzODIzNDIsImlhdCI6MTY2MjM3ODc0MiwiaXNzIjoid2lzYW1hLmNvbS5jbyIsImF1ZCI6ImNsaWVudC53aXNhbWEuY29tLmNvIn0.o9UagXVO0Rx8J0MDwvUim4dZHzFj5X-mJQqsAnFktZNLbhxfAloKjMSK35xQfJ2-lAAjMwiaa_1r7wF_YVYIAg";

Future<MyHttpResponse> getRequest(String uri, {bool shouldRetry = true, Map? additionalHeaders, BuildContext? context}) async {
  Map<String, String> headers = {
    'Authorization': /*ReduxLogin.store!.state.postsState.userLoginModel! == null
        ? "Bearer " + token
        : */
        "Bearer " + ReduxLogin.store!.state.postsState.userLoginModel!.token.toString(),
    //'Content-Type': "application/json",
  };
  //if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);

  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);

  var response = await http2.get(Uri.parse(uri.toString()), headers: headers);

  print("pruebaurlget: " + uri.toString() + ":    " + headers.toString());
  print("RESPONSEGE---->" + uri.toString() + " " + response.body + response.statusCode.toString());
  if (response.statusCode == 401) {
    AppSharedPreference().clearDataUser(context!).then((value) {});
  }
  var data = json.decode(utf8.decode(response.bodyBytes));

  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
}

Future<MyHttpResponse> putRequest(
  Uri uri, {
  bool shouldRetry = true,
  Map? additionalHeaders,
}) async {
  Map<String, String> headers = {
    'Authorization': ReduxLogin.store!.state.postsState.userLoginModel! == null
        ? ""
        : "Bearer " + ReduxLogin.store!.state.postsState.userLoginModel!.token.toString(),
    //'Content-Type': "application/json",
  };
  //if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);

  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.put(uri, headers: headers);

  var data = json.decode(utf8.decode(response.bodyBytes));
  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
}

Future<MyHttpResponse> deleteRequest(Uri uri, {Map? jsonMap}) async {
  Map<String, String> headers = {
    'Authorization': "Bearer " + ReduxLogin.store!.state.postsState.userLoginModel!.token.toString(),
    //'Content-Type': "application/json",
  };
  //if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);

  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.delete(uri, headers: headers);
  print("responselike: " + response.body.toString() + response.statusCode.toString());
  var data;
  try {
    data = json.decode(utf8.decode(response.bodyBytes));
  } catch (e) {}
  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? "eliminado" : '');
}

class MyHttpResponse {
  int statusCode;
  String message;
  dynamic data;

  MyHttpResponse(this.statusCode, this.data, {required this.message});

  @override
  String toString() {
    return 'MyHttpResponse{statusCode: $statusCode, message: $message, data: $data}';
  }
}

Future<MyHttpResponse?> postRequestMultipart(
  String uri, {
  bool shouldRetry = true,
  required Map<String, String> jsonMap,
  Map? additionalHeaders,
}) async {
  var postUri = Uri.parse(uri);
  var request = new http.MultipartRequest("POST", postUri);

  var headers = {
    'Content-Type': 'multipart/form-data',
    'Authorization': "Bearer " + ReduxLogin.store!.state.postsState.userLoginModel!.token.toString(),
  };

  //http.MultipartFile multipartFile = await http.MultipartFile.fromPath('image', ReduxLogin.store!.state.postsState.imageUserProfile!.path);

  //request.files.add(multipartFile);

  request.headers.addAll(headers);
  request.fields.addAll(jsonMap);
  //request.fields.addAll(jsonMap);

  /*request.fields['Email'] = 'blah@gmail.com';
  request.fields['Id'] = '2';
  request.fields['provider'] = 'provider';
  request.fields['lastname'] = 'firstname';
  request.fields['firstname'] = 'firstname';*/
  request.fields['roles'] = '1';

  //request.files
  //  .add(new http.MultipartFile.fromBytes('image', await File(""), contentType: MediaType('image', 'jpeg')));
  // Future<http.StreamedResponse> data = request.send();
  // var data = json.decode(utf8.decode(response.bodyBytes));
  // return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');

  var response = await request.send();

  print("RESPONSE-- " + response.statusCode.toString() + "  :  ");

  String data2 = await response.stream.bytesToString();
  // listen for response
  print("respuesta--: " + data2);
  /*request.send().then((response) {
    print("respuesta: " + response.statusCode.toString()+" : "+response.stream.);
    //if (response.statusCode == 200) print("Uploaded!");
  });*/
  return MyHttpResponse(response.statusCode, data2.toString(), message: response.statusCode != 200 ? "exito" : '');
  /*Map<String, String> headers = {
    'Authorization': "Bearer " + ReduxLogin.store!.state.postsState.userLoginModel!.token.toString(),
    'Content-Type': "multipart/form-data",
  };
  //if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);

  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.put(Uri.parse(uri), body: jsonMap, headers: headers);
  print("prueba56put: " +
      uri.toString() +
      " " +
      jsonMap.toString() +
      "---RESPONSE:" +
      response.body +
      " : " +
      response.statusCode.toString() +
      " : " +
      ReduxLogin.store!.state.postsState.userLoginModel!.token.toString());*/

  // var data = json.decode(utf8.decode(response.bodyBytes));
  //return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
}

/*
class initApp {
 LoginResponseModel user;
  bool intro;
  int statusCode;

  dynamic data;

  initApp(this.user, this.data, this.statusCode, {this.intro});
}*/
