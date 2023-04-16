
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:ritecare_hms/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:ritecare_hms/resources/app_url/app_url.dart';
import 'package:ritecare_hms/shere_preference/login_preference.dart';
import '../app_exceptions.dart';

class NetworkApiServices extends BaseApServices {

  LoginPreference loginPreference = LoginPreference();
  var token;


  ///get search patien data by id
  @override
  Future getPatientById(String id) async {
    loginPreference.getToken().then((value) {
      token = value.accessToken!;
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

  ///// user profile
  @override
  Future getUserProfile() async{
    loginPreference.getToken().then((value) {
      token = value.accessToken!;
    });

    dynamic responseJson;

    try {
      final response = await http.get(
          Uri.parse(
              'https://mobileapp.rite-hms.com/Login/GetLoggedinUser'),
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

  ///login user
  @override
  Future postApi(var data, String url) async {
    if (kDebugMode) {
      print('user data $data');
    }
    dynamic responseJson;

    try {
      final response = await http.post(Uri.parse(url), body: data).timeout(
          Duration(seconds: 10));

      ///body: jsonEncode(data)
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  ///register patient
  @override
  Future patientRegistration(registerData, String url) async {
    loginPreference.getToken().then((value) {
      token = value.accessToken!;
    });

    if (kDebugMode) {
      print('patient data1 : $registerData');
    }
    dynamic responseJson;

    try {
      final response = await http.post(
          Uri.parse(url),
          body: jsonEncode(registerData),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'cache-control': 'no-cache'
          }

      ).timeout(Duration(seconds: 10));

      ///body: jsonEncode(data)
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  @override
  Future<List<dynamic>> getPatientByCellNo(String id) async {

    loginPreference.getToken().then((value) {
      token = value.accessToken!;
    });

    dynamic responseJson;

    try {
      final response = await http.get(
          Uri.parse(
              'https://mobileapp.rite-hms.com/Patient/GetPatientByPhone?phoneNumber=${id}'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'cache-control': 'no-cache'
          }
      ).timeout(Duration(seconds: 30));

      responseJson = returnResponse(response);
      print("response json12 ${responseJson.length}");
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  @override
  Future getBloodGroup() async {
    loginPreference.getToken().then((value) {
      token = value.accessToken!;
    });

    dynamic responseJson;

    try {
      final response = await http.get(
          Uri.parse(
              'https://mobileapp.rite-hms.com/Blood/GetAllAsync'),
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
  Future getGender()async {
    loginPreference.getToken().then((value) {
      token = value.accessToken!;
    });

    dynamic responseJson;

    try {
      final response = await http.get(
          Uri.parse(
              'https://mobileapp.rite-hms.com/Gender/GetAllAsync'),
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

  ////update register
  @override
  Future patientRegistrationUpdate(updateData, String url)async {
    loginPreference.getToken().then((value) {
      token = value.accessToken!;
    });

    if (kDebugMode) {
      print('patient data1 : $updateData');
    }
    dynamic responseJson;

    try {
      final response = await http.post(
          Uri.parse(url),
          body: jsonEncode(updateData),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'cache-control': 'no-cache'
          }

      ).timeout(Duration(seconds: 10));

      ///body: jsonEncode(data)
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  @override
  Future<List> getPatientByOfficialNo(String id) async {
    loginPreference.getToken().then((value) {
      token = value.accessToken!;
    });

    dynamic responseJson;

    try {
      final response = await http.get(
          Uri.parse(
              'https://mobileapp.rite-hms.com/Patient/GetPatientByServiceId?serviceNumber=${id}&oldData=false'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'cache-control': 'no-cache'
          }
      ).timeout(Duration(seconds: 30));

      responseJson = returnResponse(response);
      print("response json1 ${responseJson.length}"); ///WHID%20ALI
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  @override
  Future<List> getPatientByName(String id) async {
    loginPreference.getToken().then((value) {
      token = value.accessToken!;
    });

    dynamic responseJson;

    try {
      final response = await http.get(
          Uri.parse(
              'https://mobileapp.rite-hms.com/Patient/SearchPatientByPartialName?name=${id}&partialFullSearch=true'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'cache-control': 'no-cache'
          }
      ).timeout(Duration(seconds: 30));

      responseJson = returnResponse(response);
      print("response json1 ${responseJson.length}");
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }


  ///sample test status
  @override
  Future<List> getSimpleTestStatus()async {
    loginPreference.getToken().then((value) {
      token = value.accessToken!;
    });

    dynamic responseJson;

    try {
      final response = await http.get(
          Uri.parse(
              'https://mobileapp.rite-hms.com/Item/GetAllLabStatus'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'cache-control': 'no-cache'
          }
      ).timeout(Duration(seconds: 30));

      responseJson = returnResponse(response);
      print("response simple status ${responseJson.length}");
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }


  //// response status
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        print("object res ${responseJson.length}");
        return responseJson;
      case 400:
        throw InvalidUrlException;
      default:
        throw featchDataException(
            "Error accoured while communication with server" +
                response.statusCode.toString());
    }
  }




}


