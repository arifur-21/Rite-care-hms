import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/response/status.dart';
import '../../model/lab_test_model/summery_sub_item_model/lab_report_result_model/lab_report_result_model.dart';
import '../../model/lab_test_model/summery_sub_item_model/lab_report_result_model/save_edit_lab_report_model.dart';
import '../../repository/repository.dart';
import '../../repository/search_repository/SearchRepository.dart';
import '../../utils/utils.dart';

class LabReportResultViewModel extends GetxController{

  final _api = SearchRepository();
  final _repository = Repository();


  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  final tableRowDesignListItem = LabReportResultModel().obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setError(String _value) => error.value = _value;
  void setTableRowDesign(LabReportResultModel _value) => tableRowDesignListItem.value = _value;

  dynamic reportData;


  /// get table row design item
  void getLabReportResultData()async {
    print("test 1");
    setRxRequestStatus(Status.LOADING);
    await _api.getTableRowDesignItem().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setTableRowDesign(value);
      reportData = value.design;
      print("table row vm12 ${value.design!}");
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }


  /// operation Schedule status
  void saveEditLabReportResult({result})async{
   /* TextEditingController controlller = TextEditingController();
    for(controlller in result){
      print("controll data111 ${controlller.text}");
    }
          print("result ${controlller.text}");*/

  Map data = {
    'templateList': [jsonEncode(reportData)]

  };

    await _repository.saveEditLabReportResult(data).then((value){
      Utils.snakBar("status", 'status update successfull');
    }).onError((error, stackTrace) {
      Utils.snakBar("Error", error.toString());
      print("error occured : ${error.toString()}");
    });
  }

}