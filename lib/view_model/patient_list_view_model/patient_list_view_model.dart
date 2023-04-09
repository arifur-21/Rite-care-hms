
import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:ritecare_hms/model/patinet_list_model/patient_list_model.dart';
import 'package:ritecare_hms/repository/patient_list_repository/patient_list_repository.dart';

import '../../data/response/status.dart';
import '../../shere_preference/login_preference.dart';
import 'package:http/http.dart' as http;

class PatientListViewModel{

  final _api = PatientListRepository();

  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  final patientList = PatientListModel().obs;

  LoginPreference loginPreference = LoginPreference();
  var token;


  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setPatientList(PatientListModel _value) => patientList.value = _value;
  void setError(String _value) => error.value = _value;

  List<PatientListModel>? getPatientList(){
    print("test1");
    _api.getPatientList().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setPatientList(value);
      print("patient list ${value.items?.length}");
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }


  Future<PatientListModel> getPatientsList()async {
    var data;

    loginPreference.getToken().then((value){
      token = value.accessToken!;
    });

    final response = await http.get(Uri.parse('https://mobileapp.rite-hms.com/Patient/GetPatientList?pageNumber=1&pageSize=25&startDate=undefined&endDate=undefined&unitId=null&bloodGroupId=null'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'cache-control': 'no-cache'
        }
    );
    data  = jsonDecode(response.body) ;
    if(response.statusCode == 200){

      print("patient list ${response.body.length}");
      return PatientListModel.fromJson(data);
    }else{
      return PatientListModel.fromJson(data);
    }
  }

}