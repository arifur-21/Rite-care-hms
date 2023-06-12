import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/response/status.dart';
import '../../model/lab_test_model/lab_test_list_model.dart';
import '../../model/lab_test_model/lab_test_list_status_model.dart';
import '../../repository/repository.dart';

class LabTestListViewModel extends GetxController {
  final _repository = Repository();

  final rxRequestStatus = Status.LOADING.obs;
  final labtestListData = LabTestListModel().obs;

  final labTestListFilterStatus = <LabTestListStatusModel>[].obs;
  RxString error = ''.obs;

  final items = <Items>[].obs;
  RxInt categoryId = 0.obs;
  RxInt pageNumber = 0.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setLabTestList(LabTestListModel value) {
    labtestListData.value = value;

    items.value.addAll(value.items??[]);
  }

///  void setItemList(List<Items> value) => items.value = value;

  void setlabTestListFilterStatus(List<LabTestListStatusModel> value) =>
      labTestListFilterStatus.value = value;

  void setError(String value) => error.value = value;

  final labTestStatusController = TextEditingController().obs;

  RxBool loading = true.obs;


  /// get lab test list data

  Future<LabTestListModel> getLabTestListData({labStatus, required int page}) async {
    categoryId.value = labStatus;
    //pageNumber.value ++;
    print(("lab status $labStatus"));
    print("pageNumber vm  ${pageNumber.value}");
    print("category id vm  ${categoryId.value}");
    // setRxRequestStatus(Status.LOADING);
    try {
      final libModel = await _repository.getLabTestListApi(categoryId.value, page);
      setRxRequestStatus(Status.SUCCESS);
      setLabTestList(libModel);

   ///   setItemList(libModel.items?.toList() ?? []);
      print("lab test list VM length ${libModel.items?.length}");
      return libModel;
    } catch (error) {
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
      rethrow;
    }
  }

  //get lab test list filter status
  Future<List<LabTestListStatusModel>> getLabTestListStatusData() async {
    //  setRxRequestStatus(Status.LOADING);
    await _repository.getLabTestListFilterStatusData().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setlabTestListFilterStatus(value);
      print("sample status ${value}");
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("sample list filter status ${error.toString()}");
    });
    return labTestListFilterStatus;
  }
}
