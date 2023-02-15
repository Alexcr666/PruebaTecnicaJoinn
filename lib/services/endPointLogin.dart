import 'dart:convert';
import 'dart:io';

import 'package:dj_mania/app/app_constants.dart';
import 'package:dj_mania/app/app_settings.dart';
import 'package:dj_mania/redux/app/app_state.dart';
import 'package:dj_mania/redux/login/store.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:http_parser/http_parser.dart';
import 'package:redux/redux.dart';

import 'package:http/http.dart' as http;

import 'package:http_parser/http_parser.dart';
import 'dart:io';

class endPointApiLogin {
  endPointApiLogin();

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

  static final LOGIN_URL = "/Login/Login";

  static final CREATE_USER_URL = "/User/Create";

  static final IDENTIFICATION_TYPE_URL = "/Common/ToListIdentificationType";

  static final UPDATE_USER = "/User/Update";

  /*Future<MyHttpResponse> getPlacesEndpoint() async {
    var url = Uri.http(baseUrl, PLACE_URL);

    MyHttpResponse response = await getRequest(url.toString());

    return response;
  }

  Future<MyHttpResponse> addUser(
      {String? email,
      String? password,
      String? name,
      String? lastname,
      String? identification,
      String? identificationType,
      String? phone,
      String? imageUrl,
      String? state}) async {
    var url = Uri.http(baseUrl, CREATE_USER_URL);

    MyHttpResponse response = await postRequest(url);

    return response;
  }*/

  Future<MyHttpResponse?> userUpdate({
    String? id,
    String? provider,
    String? identificationTypeId,
    String? identification,
    String? firstName,
    String? lastname,
    String? email,
    String? phoneNumber,
    String? password,
    String? imageUrl,
    String? state,
  }) async {
    //var url = Uri.http(baseUrl, UPDATE_USER);
    var url = "http://34.238.126.246$UPDATE_USER";

    Map<String, String> params;
    params = {
      "id": id!,
      "provider": provider!,
      "identificationTypeId": identificationTypeId!,
      "identification": identification!,
      "firstname": firstName!,
      "lastname": lastname!,
      "email": email!,
      "phoneNumber": phoneNumber!,
      //  "password": password!,
      "imageUrl": imageUrl!,
      "state": state!,
      "image": "a"
    };
    print("prueba " + url.toString() + ": " + params.toString());

    MyHttpResponse? response = await putRequestRawMultipart(url, jsonMap: params);

    return response;
  }

  Future<MyHttpResponse> recoverPassword({required String email}) async {
    var url = "http://34.238.126.246/User/RecoverAccount?email=$email";
    // print("prueba " + url.toString());

    /* Map<String, String> params;

    params = {"email": email, "id": id};
*/
    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> login({required String email, required String password, required String provider}) async {
    var url = Uri.http(baseUrl, LOGIN_URL);
    print("prueba " + url.toString());

    Map<String, String> params;

    params = {"provider": "local", "email": email, "password": password};

    MyHttpResponse response = await postRequestAuth(url, jsonMap: params);

    return response;
  }

  Future<MyHttpResponse> getUserId({required String id}) async {
    String url = "http://34.238.126.246/User/FindDetailByID?id=" + id;

    MyHttpResponse response = await getRequest(url);

    return response;
  }

  Future<MyHttpResponse> userUpdatePassword({String? password, String? id}) async {
    String url = "http://34.238.126.246/User/UpdatePassword";
    Map<String, String> params;

    params = {"id": id!, "password": password!};
    print("updatepassword: " + url + " : " + params.toString());
    MyHttpResponse response = await putRequestRaw(url, jsonMap: params);

    return response;
  }
}

Future<MyHttpResponse> postRequest2(Uri uri,
    {bool shouldRetry = true, required Map jsonMap, required Map additionalHeaders, bool mntFlag = true}) async {
  Map<String, String> headers = {
    // 'Authorization':
    //   "Bearer ${"" /*store.state.authState.initData.token*/ ?? ''}",
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
    'Content-Type': "application/json",
  };
  //if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);
  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.post(uri, body: json.encode(jsonMap), headers: headers);
  //print("prueba2:" + response.body.toString());

  var data = json.decode(utf8.decode(response.bodyBytes));
  // print("prueba602: "+data["status"]["code"].toString());
  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
}

Future<MyHttpResponse> postRequestAuth(Uri uri,
    {bool shouldRetry = true, Map? jsonMap, Map? additionalHeaders, bool mntFlag = true}) async {
  Map<String, String> headers = {
    //'Authorization': "Bearer " + accessToken,
    'Content-Type': "application/json",
  };
  // if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);
  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.post(uri, body: json.encode(jsonMap), headers: headers);
  print("prueba2:" + response.body.toString() + uri.toString() + jsonMap.toString());
  // print("prueba3:" + json.encode(jsonMap).toString());
  // if (response.statusCode == 505 && shouldRetry) {
  // } else if (response.statusCode == 511) {}

  var data = json.decode(utf8.decode(response.bodyBytes));
  // print("prueba602: "+data["status"]["code"].toString());
  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
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
  //print("prueba2:" + response.body.toString());
  // print("prueba3:" + json.encode(jsonMap).toString());
  // if (response.statusCode == 505 && shouldRetry) {
  // } else if (response.statusCode == 511) {}

  var data = json.decode(utf8.decode(response.bodyBytes));
  // print("prueba602: "+data["status"]["code"].toString());
  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
}

Future<MyHttpResponse> getRequestRawAuth(Uri uri, {bool shouldRetry = true, Map? additionalHeaders}) async {
  Map<String, String> headers2 = {
    // 'Authorization': "Bearer " + accessToken,
    'Content-Type': "application/json",
  };
  // if (additionalHeaders != null) headers2.addEntries(additionalHeaders.entries);

  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.get(uri, headers: headers2);
  // print(uri.replaceAll("%3F", "?").toString());
  var data = json.decode(utf8.decode(response.bodyBytes));
  print(response.body);
  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
}

Future<MyHttpResponse> getRequestRaw2(Uri uri, {bool shouldRetry = true, Map? additionalHeaders}) async {
  Map<String, String> headers = {
    // 'Authorization':
    //   "Bearer ${"" /*store.state.authState.initData.token*/ ?? ''}",
    'Content-Type': "application/json",
  };
  // if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);

  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.get(uri);
  // print(uri.replaceAll("%3F", "?").toString());
  var data = json.decode(utf8.decode(response.bodyBytes));
  print("responde: " + response.body);
  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
}

Future<MyHttpResponse> getRequestRaw(String uri, {bool shouldRetry = true, Map? additionalHeaders}) async {
  Map<String, String> headers = {
    // 'Authorization':
    //   "Bearer ${"" /*store.state.authState.initData.token*/ ?? ''}",
    'Content-Type': "application/json",
  };
  //if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);

  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.get(Uri(path: uri.replaceAll("%3F", "?")));
  print(uri.replaceAll("%3F", "?").toString());
  var data = json.decode(utf8.decode(response.bodyBytes));
  print(response.body);
  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
}

Future<MyHttpResponse> getRequest(String uri, {bool shouldRetry = true, Map? additionalHeaders}) async {
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
  var response = await http2.get(Uri.parse(uri), headers: headers);
  print(uri.replaceAll("%3F", "?").toString());
  print("RESPONSE: " + response.body + " STATUSCODE:  " + response.statusCode.toString());
  var data;
  try {
    data = json.decode(utf8.decode(response.bodyBytes));
  } catch (e) {}
  // var data = json.decode(utf8.decode(response.bodyBytes));

  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
}

String token =
    "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiIxMCIsIlByb3ZpZGVyIjpbImxvY2FsIiwiVXN1YXJpbyJdLCJnaXZlbl9uYW1lIjoiVGVyY2VyIiwiZW1haWwiOiJjbGllbnRlQGdtYWlsLmNvbSIsInJvbGUiOiJDbGllbnRlIHJlZ3VsYXIiLCJuYmYiOjE2NjI1NjM2MTMsImV4cCI6MTY2MjU2NzIxMywiaWF0IjoxNjYyNTYzNjEzLCJpc3MiOiJ3aXNhbWEuY29tLmNvIiwiYXVkIjoiY2xpZW50Lndpc2FtYS5jb20uY28ifQ.UhB9WJQ0OweNwXxQSyouZl4z_pGF9JjVWn4UOQhp4Dk2UgXMdbjZLarx4EbXsKyh-b60Mpv9-1Jldf81ldDtgg";
Future<MyHttpResponse> putRequest(
  String uri, {
  bool shouldRetry = true,
  required Map jsonMap,
  Map? additionalHeaders,
}) async {
  Map<String, String> headers = {
    'Authorization': "Bearer " + ReduxLogin.store!.state.postsState.userLoginModel!.token.toString(),
    //'Content-Type': "application/json",
  };
  //if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);

  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.put(Uri.parse(uri), body: jsonMap, headers: headers);
  print("prueba56put: " +
      uri.toString() +
      " " +
      response.body +
      " : " +
      response.statusCode.toString() +
      " : " +
      ReduxLogin.store!.state.postsState.userLoginModel!.token.toString());
  var data = json.decode(utf8.decode(response.bodyBytes));
  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
}

Future<MyHttpResponse?> putRequestRawMultipart(
  String uri, {
  bool shouldRetry = true,
  required Map<String, String> jsonMap,
  Map? additionalHeaders,
}) async {
  var postUri = Uri.parse(uri);
  var request = new http.MultipartRequest("PUT", postUri);

  var headers = {
    'Content-Type': 'multipart/form-data',
    'Authorization': "Bearer " + ReduxLogin.store!.state.postsState.userLoginModel!.token.toString(),
  };

  http.MultipartFile multipartFile = await http.MultipartFile.fromPath('image', ReduxLogin.store!.state.postsState.imageUserProfile!.path);

  request.files.add(multipartFile);

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
  return MyHttpResponse(response.statusCode, null, message: response.statusCode != 200 ? "exito" : '');
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

Future<MyHttpResponse> putRequestRaw(
  String uri, {
  bool shouldRetry = true,
  required Map jsonMap,
  Map? additionalHeaders,
}) async {
  Map<String, String> headers = {
    'Authorization': "Bearer " + ReduxLogin.store!.state.postsState.userLoginModel!.token.toString(),
    'Content-Type': "application/json",
  };
  //if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);

  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.put(Uri.parse(uri), body: json.encode(jsonMap), headers: headers);
  print("prueba56put: " +
      uri.toString() +
      " " +
      jsonMap.toString() +
      response.body +
      " : " +
      response.statusCode.toString() +
      " : " +
      ReduxLogin.store!.state.postsState.userLoginModel!.token.toString());
  var data = json.decode(utf8.decode(response.bodyBytes));
  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
}

Future<MyHttpResponse> deleteRequest(
  Uri uri, {
  bool shouldRetry = true,
  Map? additionalHeaders,
}) async {
  Map<String, String> headers = {
    // 'Authorization':
    //   "Bearer ${"" /*store.state.authState.initData.token*/ ?? ''}",
    'Content-Type': "application/json",
  };
  //if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);

  final ioc = new HttpClient();
  ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.get(uri, headers: headers);

  var data = json.decode(utf8.decode(response.bodyBytes));
  return MyHttpResponse(response.statusCode, data, message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
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
/*
class initApp {
 LoginResponseModel user;
  bool intro;
  int statusCode;

  dynamic data;

  initApp(this.user, this.data, this.statusCode, {this.intro});
}*/
