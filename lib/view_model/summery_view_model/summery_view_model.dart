
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:ritecare_hms/model/lab_test_model/status_model.dart';
import 'package:ritecare_hms/model/login_model/login_token_model.dart';
import 'package:ritecare_hms/repository/repository.dart';
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
  final _repository = Repository();
  LoginPreference loginPreference = LoginPreference();
  var token;
  dynamic list = [];
  dynamic startDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;
  dynamic endDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;


  final sampleIdController = TextEditingController().obs;
  final invoNumController = TextEditingController().obs;



  final rxRequestStatus = Status.LOADING.obs;
  final labtestListData = LabTestListModel().obs;
  final sampleListItem = SampleTest().obs;
  final summeryListItem = SummeryModel().obs;
  final sampleListFilterStatus = <StatusListModel>[].obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setLabTestList(LabTestListModel _value) => labtestListData.value = _value;
  void setSampleList(SampleTest _value) => sampleListItem.value = _value;
  void setSummeryList(SummeryModel _value) => summeryListItem.value = _value;
  void setSampleListFilterStatus(List<StatusListModel> _value) => sampleListFilterStatus.value = _value;
  void setError(String _value) => error.value = _value;



  /// get sample list data
  void getSampleListData({ dynamic statusId = 0})async {
    setRxRequestStatus(Status.LOADING);
   await _api.getSampleListData(startDate, endDate, statusId).then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setSampleList(value);
      print("sample list length vm ${value.items?.length}");
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());

      print("viewModel error ${error.toString()}");
    });
  }

  /// get summery list data
  void getSummeryListData({statusId = 0})async {
    setRxRequestStatus(Status.LOADING);
    await _api.getSummeryListData(startDate, endDate, statusId).then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setSummeryList(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }


  //get sample and summery list filter status
  Future<List<StatusListModel>> getSampleListFilterStatus()async{
   // setRxRequestStatus(Status.LOADING);
   await  _repository.getSampleListFilterStatusData().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setSampleListFilterStatus(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
    });
    return sampleListFilterStatus;
  }




}