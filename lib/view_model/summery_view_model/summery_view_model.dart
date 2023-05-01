
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:ritecare_hms/model/lab_test_model/status_model.dart';
import 'package:ritecare_hms/model/login_model/login_token_model.dart';
import 'package:ritecare_hms/resources/app_url/app_url.dart';

import '../../data/app_exceptions.dart';
import '../../data/response/status.dart';
import '../../model/lab_test_model/lab_test_list_model.dart';
import '../../model/lab_test_model/simple_list_models.dart';
import '../../model/lab_test_model/summery_model.dart';
import '../../model/patinet_list_model/patient_list_model.dart';
import '../../repository/search_repository/SearchRepository.dart';
import '../../shere_preference/login_preference.dart';
import 'package:http/http.dart' as http;

class SummeryViewModel{

  final _api = SearchRepository();
  LoginPreference loginPreference = LoginPreference();
  var token;
  dynamic list = [];
  dynamic startDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;
  dynamic endDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;
  dynamic statusId =''.obs;

  final sampleIdController = TextEditingController().obs;
  final invoNumController = TextEditingController().obs;



  final rxRequestStatus = Status.LOADING.obs;
  final labtestListData = LabTestListModel().obs;
  final sampleListItem = SampleTest().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setLabTestList(LabTestListModel _value) => labtestListData.value = _value;
  void setSampleList(SampleTest _value) => sampleListItem.value = _value;
  void setError(String _value) => error.value = _value;


  /// get lab test list data
  Future? getLabTestListData(){
    _api.getLabTestListApi().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setLabTestList(value);
      print("lab vm ${value.items}");
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }

  /// get sample list data
  Future? getSampleListData(){
    print("start date1 ${startDate}");
    _api.getSampleListData(startDate, endDate).then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setSampleList(value);
      print(" sample list vm ${value}");
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }



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

  //// get sample list status
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

      statusList.clear();
      for(Map i in data){
        statusList.add(StatusListModel.fromJson(i));
       // print(i["Name"]);
      }
      return statusList;
    }else{
      return statusList;
    }
  }


  ///get sample list
  Future<SampleTest> getSampleTestApiData()async {
    print('status id vm ${statusId}');
    print('start date id vm ${startDate}');
    print('end date id vm ${endDate}');

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
         print("test sample ${data}");

      return  SampleTest.fromJson(data);
    }else{
      return SampleTest.fromJson(data);
    }
  }
}