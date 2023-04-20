import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ritecare_hms/model/ot_management_model/ot_list_model.dart';

import '../../data/response/status.dart';
import '../../repository/search_repository/SearchRepository.dart';
import '../../shere_preference/login_preference.dart';
import 'package:http/http.dart' as http;

class OtListViewModel extends GetxController{

  final _api = SearchRepository();
  LoginPreference loginPreference = LoginPreference();
  var token;


  final rxRequestStatus = Status.LOADING.obs;
  final otScheduleList = OtScheduleModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setOtSchedule(OtScheduleModel _value) => otScheduleList.value = _value;
  void setError(String _value) => error.value = _value;


  dynamic startDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;
  dynamic endDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;

  /*LoginPreference loginPreference = LoginPreference();
  var token;

  Future<OtScheduleModel> getOtListData()async {
    var data;

    loginPreference.getToken().then((value){
      token = value.accessToken!;
    });

    final response = await http.get(Uri.parse('https://mobileapp.rite-hms.com/OT/GetOperationScheduleList?pageNumber=1&pageSize=150&startDate=${startDate}&endDate=${endDate}&patientId=0&isMobileApp=true'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'cache-control': 'no-cache'
        }
    );
    data  = jsonDecode(response.body);
   // print('status:${response.statusCode}');


    print("test1");
    if(response.statusCode == 200){
    // print(("ot list model1 ${data}"));
      print(("respnse api11 ${data}"));
     // print("ot ${a}");
      return OtScheduleModel.fromJson(data);
    }else{
      return OtScheduleModel.fromJson(data);
    }
  }
*/
  /// get ot schedule
  void getSchedule(){
    print("ot schedul vm ${startDate}");
    _api.getOtSchedule(startDate, endDate).then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setOtSchedule(value);
      print("ot schedul vm${value}");
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }


}