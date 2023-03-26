
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:ritecare_hms/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions.dart';

class NetworkApiServices extends BaseApServices{

  @override
  Future postApi(var data, String url)async {
    if(kDebugMode){
      print('user data $data');
    }
    dynamic responseJson;

    try{
      final response = await http.post(Uri.parse(url), body: data).timeout(Duration(seconds: 10)); ///body: jsonEncode(data)
      responseJson = returnResponse(response);
    }on SocketException{
      throw InternetException("");
    }on RequestTimeOut{
      throw RequestTimeOut('');
    }
    if(kDebugMode){
      print("network api $responseJson");
    }
    return responseJson;
  }


  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:

        throw InvalidUrlException;
      default:
        throw featchDataException("Error accoured while communication with server"+ response.statusCode.toString());
    }
  }

}