
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
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

   await loginPreference.getToken().then((value)  {
      token =  value.accessToken!;
      refresh_token =  value.refreshToken!;

    });
    dynamic responseJson;
    try {
      final response = await http.get(
          Uri.parse(
              '${AppUrl.base_url}/Patient/GetPatientById?id=${id}&oldId=false'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'cache-control': 'no-cache'
          }
      ).timeout(Duration(seconds: 30));
      responseJson = returnResponse(response);
      print("response json ${responseJson.length}");
    } on SocketException {
      throw UrlException();
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }on InternetException{
      throw InternetException();
    }

    return responseJson;
  }


  ///// get object list data
  @override
  Future getApiData(String url) async{
   await loginPreference.getToken().then((value) {
      token =  value.accessToken!;
      refresh_token =  value.refreshToken!;
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
  await  loginPreference.getToken().then((value) {
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
      if(response.body.isEmpty){
      throw featchDataException(" ");
      }else{
        responseJson = returnResponse(response);
      }


    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut('Request Time Out');
    }
    return responseJson;
  }

  /// login post api
  @override
  Future postLoginApi(dynamic data, String url) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url),
          body: data).timeout(
          Duration(seconds: 30));
      responseJson = returnResponse(response);
    } catch(e){
      if(e is SocketException){
        print(e.toString());
      }else if(e is TimeoutException){
        throw RequestTimeOut("");
      }
    }
    return responseJson;
  }

  //post api
  @override
  Future postApiData(dynamic postData, String url) async {

  await  loginPreference.getToken().then((value) {
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
      print("response repo ${response.body}");
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;


  }

  Future regenerateToken() async{
  await  loginPreference.getToken().then((value) {
      token = value.accessToken!;
      refresh_token = value.refreshToken!;
    });


      final response = await http.post(
          Uri.parse(AppUrl.loginApi),
          headers: {
            'grant_type': 'refresh_token',
          },
        body: {
      'grant_type': 'refresh_token',
      'refresh_token': '${refresh_token}',
      },
      );
      if(response.statusCode == 200){
        final json = jsonDecode(response.body);

        final accessToken = json['access_token'];
        print(accessToken);
        LoginTokenModel loginTokenModel = LoginTokenModel(
          accessToken: accessToken,
        );

        return loginTokenModel;
      }else{
        throw Exception('Failed to refresh access token');
      }

  }

  //// api exception handler
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:

        dynamic responseJson =  jsonDecode(response.body);
        return responseJson;

      case 401:
     print("unAuthorize");
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


