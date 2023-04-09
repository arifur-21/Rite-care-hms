
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/model/search_model/SearchModel.dart';
import 'package:ritecare_hms/repository/search_repository/SearchRepository.dart';

import '../../data/response/status.dart';
import '../../model/blood_group_model/BloodGroupModel.dart';
import '../../shere_preference/login_preference.dart';
import 'package:http/http.dart' as http;

class SearchViewModel extends GetxController{

  final _api = SearchRepository();
  LoginPreference loginPreference = LoginPreference();
  var token;
  bool patientFound  = false;

  final rxRequestStatus = Status.LOADING.obs;
  final patientList = SearchModel().obs;
  final bloodGroupList = BloodGroupModel().obs;
  final patientListItem = <SearchModel>[].obs;

  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setPatientList(SearchModel _value) => patientList.value = _value;
  void setPatientBlood(BloodGroupModel _value) => bloodGroupList.value = _value;
  void setPatient(List<SearchModel> _value) => patientListItem.value = _value;
  void setError(String _value) => error.value = _value;

  final patienidController = TextEditingController().obs;
  final patientCellNoController = TextEditingController().obs;
  final patientNameController = TextEditingController().obs;
  final patientOfficialNumberController = TextEditingController().obs;



  void searchPatient(){

    print("patientId ${patienidController.value.text}");

    _api.getSearch(patienidController.value.text).then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setPatientList(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }


  Future<List<SearchModel>> searchPatientCellNum()async{

    _api.getPateintCell(patientCellNoController.value.text).then((value) {
      print("test 1");
      setRxRequestStatus(Status.SUCCESS);
      print("cell number ${value}");
      print("object");

      setPatient(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
     print("viewModel error cell ${error.toString()}");
    });
   // print("item ${patientListItem.}")

    return patientListItem;
  }


  Future<List<dynamic>> getPatientsCell()async {
    var data;

    loginPreference.getToken().then((value){
      token = value.accessToken!;
    });

    final response = await http.get(Uri.parse("https://mobileapp.rite-hms.com/Patient/GetPatientByPhone?phoneNumber=${patientCellNoController.value.text}"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'cache-control': 'no-cache'
        }
    );

    if(response.statusCode == 200){

      data  = jsonDecode(response.body) ;
      return data;
    }else{
      return data;
    }
  }

  Future<List<dynamic>> getPatientByName()async {
    var data;
    loginPreference.getToken().then((value){
      token = value.accessToken!;
    });

    final response = await http.get(Uri.parse("https://mobileapp.rite-hms.com/Patient/SearchPatientByPartialName?name=${patientNameController.value.text}&partialFullSearch=true"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'cache-control': 'no-cache'
        }
    );

    if(response.statusCode == 200){
      data  = jsonDecode(response.body) ;
      return data;
    }else{
      return data;
    }
  }

  Future<List<dynamic>> getPatientByOfficialNumber()async {
    var data;

    loginPreference.getToken().then((value){
      token = value.accessToken!;
    });

    final response = await http.get(Uri.parse("https://mobileapp.rite-hms.com/Patient/GetPatientByServiceId?serviceNumber=${patientOfficialNumberController.value.text}&oldData=false"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'cache-control': 'no-cache'
        }
    );

    if(response.statusCode == 200){
      data  = jsonDecode(response.body) ;
      return data;
    }else{
      return data;
    }
  }



}