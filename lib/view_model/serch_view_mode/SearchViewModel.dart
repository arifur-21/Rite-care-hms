
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/model/search_model/SearchModel.dart';
import 'package:ritecare_hms/repository/search_repository/SearchRepository.dart';

import '../../data/response/status.dart';
import '../../shere_preference/login_preference.dart';
import 'package:http/http.dart' as http;

class SearchViewModel extends GetxController{

  final _api = SearchRepository();
  LoginPreference loginPreference = LoginPreference();
  var token;


  final rxRequestStatus = Status.LOADING.obs;
  final patientList = SearchModel().obs;
  final patientLists = <SearchModel>[].obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setPatientList(SearchModel _value) => patientList.value = _value;
  void setPatient(List<SearchModel> _value) => patientLists.value = _value;
  void setError(String _value) => error.value = _value;

  final patienidController = TextEditingController().obs;
  final patientCellNoController = TextEditingController().obs;


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

  dynamic patientCellId(){

    print("patient cell ${patientCellNoController.value.text}");

    _api.getPateintCell(patientCellNoController.value.text).then((value) {
      setRxRequestStatus(Status.SUCCESS);
      print("value ${value.toString()}");
      setPatient(value as List<SearchModel>);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }







}