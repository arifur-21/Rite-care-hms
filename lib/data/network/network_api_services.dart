
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:ritecare_hms/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:ritecare_hms/resources/app_url/app_url.dart';
import 'package:ritecare_hms/shere_preference/login_preference.dart';
import '../../model/login_model/login_token_model.dart';
import '../app_exceptions.dart';

class NetworkApiServices extends BaseApServices {

  LoginPreference loginPreference = LoginPreference();
  dynamic token;
  dynamic refresh_token;


  ///get search patien data by id
  @override
  Future getPatientById(String id) async {

    loginPreference.getToken().then((value) async {
      token = await value.accessToken!;
      refresh_token = value.refreshToken!;

    });
    dynamic responseJson;
    try {
      final response = await http.get(
          Uri.parse(
              'https://mobileapp.rite-hms.com/Patient/GetPatientById?id=${id}&oldId=false'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'cache-control': 'no-cache'
          }
      ).timeout(Duration(seconds: 30));
      responseJson = returnResponse(response);
      print("response json ${responseJson.length}");
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }

    return responseJson;
  }

  ///// get object list data
  @override
  Future getApiData(String url) async{


   await loginPreference.getToken().then((value) {

      token = value.accessToken!;
      refresh_token = value.refreshToken!;
    });
    dynamic responseJson;

    try {
      final response = await http.get(
          Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'cache-control': 'no-cache'
          }
      ).timeout(Duration(seconds: 30));
      responseJson = returnResponse(response);
      print("response json ${responseJson.length}");
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }

    return responseJson;

  }

  @override
  Future<List> getListOfApiData(String url) async {
    loginPreference.getToken().then((value) {
      token = value.accessToken!;
      refresh_token = value.refreshToken!;
    });

    dynamic responseJson;
    try {
      final response = await http.get(
          Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'cache-control': 'no-cache'
          }
      ).timeout(Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut('Request Time Out');
    }
    return responseJson;
  }

  /// login api
  @override
  Future postLoginApi(dynamic data, String url) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url),
          body: data).timeout(
          Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  //post api
  @override
  Future postApiData(dynamic postData, String url) async {

    loginPreference.getToken().then((value) {
      token = value.accessToken!;
      refresh_token = value.refreshToken!;
    });
    dynamic responseJson;

    try {
      final response = await http.post(
          Uri.parse(url),
          body: jsonEncode(postData),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'cache-control': 'no-cache'
          }

      ).timeout(Duration(seconds: 30));
      responseJson = returnResponse(response);
      print(response.body);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;


  }

  Future regenerateToken() async{
    loginPreference.getToken().then((value) {
      token = value.accessToken!;
      refresh_token = value.refreshToken!;
    });

    dynamic responseJson;

      final response = await http.post(
          Uri.parse('https://mobileapp.rite-hms.com/auth/token'),
          headers: {
            'grant_type': 'refresh_token',
          },
        body: {
      'grant_type': 'refresh_token',
      'refresh_token': '${refresh_token}',
      },
      );
      //print("refresh token ${response.body}");
      if(response.statusCode == 200){
        final json = jsonDecode(response.body);
      /*  LoginTokenModel loginTokenModel = LoginTokenModel(
            accessToken: json,
        );
*/
      //  loginPreference.saveToken(loginTokenModel);

        final accessToken = json['access_token'];
        print(accessToken);
        LoginTokenModel loginTokenModel = LoginTokenModel(
          accessToken: accessToken,
        );

        return loginTokenModel;
      }else{
        throw Exception('Failed to refresh access token');
      }
      print("token response ${response.body}");
      token = response.body;

    return responseJson;
  }

  //// api exception handler
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      /*case 401:
        throw InvalidUrlException();*/
      case 401:
     print("object unAuthorize");
       return regenerateToken();
      case 400:
        throw InvalidUrlException;
      default:
        throw featchDataException(
            "Error accoured while communication with server" +
                response.statusCode.toString());
    }
  }


}


