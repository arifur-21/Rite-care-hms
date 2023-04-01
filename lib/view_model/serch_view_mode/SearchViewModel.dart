
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/model/search_model/SearchModel.dart';
import 'package:ritecare_hms/repository/search_repository/SearchRepository.dart';

import '../../data/response/status.dart';

class SearchViewModel extends GetxController{

  final _api = SearchRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final patientList = SearchModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setPatientList(SearchModel _value) => patientList.value = _value;
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


  void searchPatienByCellNO(){

    print("patient CellNO id : ${patientCellNoController.value.text}");

    _api.getPatientDataByCellNO(patientCellNoController.value.text).then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setPatientList(value);
      print("Value ${value.toString()}");
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }


}