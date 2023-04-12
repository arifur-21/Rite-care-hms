
import 'dart:convert';
import 'dart:io';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:ritecare_hms/model/lab_test_model/status_model.dart';
import 'package:ritecare_hms/model/login_model/login_token_model.dart';
import 'package:ritecare_hms/resources/app_url/app_url.dart';

import '../../data/app_exceptions.dart';
import '../../data/response/status.dart';
import '../../model/lab_test_model/lab_test_list_model.dart';
import '../../model/lab_test_model/simple_list_models.dart';
import '../../model/lab_test_model/summery_model.dart';
import '../../model/patinet_list_model/patient_list_model.dart';
import '../../shere_preference/login_preference.dart';
import 'package:http/http.dart' as http;

class SummeryViewModel{

  LoginPreference loginPreference = LoginPreference();
  var token;
  dynamic list = [];


  ///summery list data
  Future<SummeryModel> getSummeryListData()async {
    var data;

    loginPreference.getToken().then((value){
      token = value.accessToken!;
    });

    final response = await http.get(Uri.parse('https://mobileapp.rite-hms.com/Item/GetPatientInvoicebyMedicalType?id=0&statusid=0&medicalTypeID=62&DateStart=2023-04-06&DateEnd=2023-04-06&pageNumber=1&pageSize=25&invoiceId=undefined&sampleId=null&itemId=undefined'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'cache-control': 'no-cache'
        }
    );
    data  = jsonDecode(response.body) ;
    if(response.statusCode == 200){
     // print("summery data ${data}");
      return SummeryModel.fromJson(data);
    }else{
      return SummeryModel.fromJson(data);
    }
  }


  //// get sample list 1
  List<StatusListModel> statusList = [];
  Future<List<StatusListModel>> getSampleTestStatus()async {
    var data;

    loginPreference.getToken().then((value){
      token = value.accessToken!;
    });

    final response = await http.get(Uri.parse("https://mobileapp.rite-hms.com/Item/GetAllLabStatus"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'cache-control': 'no-cache'
        }
    );

    if(response.statusCode == 200){
      data  = jsonDecode(response.body) ;
      for(Map i in data){
        statusList.add(StatusListModel.fromJson(i));
       // print(i["Name"]);
      }
      return statusList;
    }else{
      return statusList;
    }
  }


  ///get sample list 2
  Future<SampleTest> getSampleTestApiData()async {
    var data;
    loginPreference.getToken().then((value){
      token = value.accessToken!;
    });

    final response = await http.get(Uri.parse('https://mobileapp.rite-hms.com/Item/GetInvoiceSampleIDByMedicalType?id=775925&statusid=0&medicalTypeID=62&DateStart=2023-04-06&DateEnd=2023-04-06&pageNumber=1&pageSize=25&invoiceId=undefined&sampleId=null'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'cache-control': 'no-cache'
        }
    );
    data  = jsonDecode(response.body) ;
       if(response.statusCode == 200){
   //   print(("sample test111 ${data['items'][0]['InvoiceNo']}"));


      return  SampleTest.fromJson(data);
    }else{
      return SampleTest.fromJson(data);
    }
  }

  ///get lab test list
  Future<LabTestListModel> getLabTestList()async {

    loginPreference.getToken().then((value){
      token = value.accessToken!;
    });


    var response = await http.get(Uri.parse('https://mobileapp.rite-hms.com/Item/GetLabItemsByMedicalType?medicalTypeID=62&pageNumber=1&pageSize=25&categoryId=null&searchTerm=&allData=undefined&ItemId=0&isLabItemSerialNo=false'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'cache-control': 'no-cache'
        }
    );

    dynamic data  = jsonDecode(response.body) ;

    print("data list11 :${data}");

    if(response.statusCode == 200){
      LabTestListModel a = LabTestListModel.fromJson(data);
      print("data list12:${a.items}");
      return LabTestListModel.fromJson(data);
    }else{
      return LabTestListModel.fromJson(data);
    }
  }

///  get lab  test

 /* Future<LabTestListModel> getLabTest()async {
    dynamic responseJson;
    print("test1");


    try {
      print("test2");
      final response = await http.get(Uri.parse('https://mobileapp.rite-hms.com/Item/GetLabItemsByMedicalType?medicalTypeID=62&pageNumber=1&pageSize=25&categoryId=null&searchTerm=&allData=undefined&ItemId=0&isLabItemSerialNo=false'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'cache-control': 'no-cache'
          }
      ).timeout(Duration(seconds: 30));

      responseJson = returnResponse(response);
      print("object${responseJson}");

    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return LabTestListModel.fromJson(responseJson);
  }*/



  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        print("object res ${responseJson.length}");
        return responseJson;
      case 400:
        print("object error}");
        throw InvalidUrlException;
      default:
        throw featchDataException(
            "Error accoured while communication with server" +
                response.statusCode.toString());
    }
  }

}