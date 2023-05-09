
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/response/status.dart';
import '../../model/lab_test_model/simple_list_models.dart';
import '../../repository/repository.dart';

class SampleListViewModel extends GetxController{
/*  final _repository = Repository();

  dynamic startDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;
  dynamic endDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;
  dynamic statusId =''.obs;

  final sampleIdController = TextEditingController().obs;
  final invoNumController = TextEditingController().obs;

  final rxRequestStatus = Status.LOADING.obs;
  final sampleListItem = SampleTest().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setError(String _value) => error.value = _value;
  void setSampleList(SampleTest _value) => sampleListItem.value = _value;


  /// get sample list data
  Future? getSampleListData(){
    _repository.getSampleListData(startDate, endDate).then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setSampleList(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }*/


}