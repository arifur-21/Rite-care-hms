
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/response/status.dart';
import '../../model/lab_test_model/lab_test_list_model.dart';
import '../../model/lab_test_model/lab_test_list_status_model.dart';
import '../../repository/repository.dart';

class LabTestListViewModel extends GetxController{
  final _repository = Repository();

  final rxRequestStatus = Status.LOADING.obs;
  final labtestListData = LabTestListModel().obs;
  final labTestListFilterStatus = <LabTestListStatusModel>[].obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setLabTestList(LabTestListModel _value) => labtestListData.value =  _value;
  void setlabTestListFilterStatus(List<LabTestListStatusModel> _value) => labTestListFilterStatus.value = _value;
  void setError(String _value) => error.value = _value;

  final  labTestStatusController = TextEditingController().obs;

  RxBool loading = true.obs;


  /// get lab test list data


  Future<void> getLabTestListData({labStatus, dynamic page }) async{
    print("lsb status id123$labStatus");
    print("page number $page");
  //setRxRequestStatus(Status.LOADING);
   await _repository.getLabTestListApi(labStatus, page).then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setLabTestList(value);
      print("labtest list data ${value.items}");

    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });

  }

  //get lab test list filter status
  Future<List<LabTestListStatusModel>> getLabTestListStatusData()async{
    //  setRxRequestStatus(Status.LOADING);
    await  _repository.getLabTestListFilterStatusData().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setlabTestListFilterStatus(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("sample list filter status ${error.toString()}");
    });
    return labTestListFilterStatus;
  }



}