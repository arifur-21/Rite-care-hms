
import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:ritecare_hms/model/patinet_list_model/patient_list_model.dart';

import '../../data/response/status.dart';
import '../../resources/app_url/app_url.dart';
import '../../shere_preference/login_preference.dart';
import 'package:http/http.dart' as http;

class PatientListViewModel{



  LoginPreference loginPreference = LoginPreference();
  var token;



  Future<PatientListModel> getPatientsList()async {
    var data;

    loginPreference.getToken().then((value){
      token = value.accessToken!;
    });

    final response = await http.get(Uri.parse(AppUrl.patientListUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'cache-control': 'no-cache'
        }
    );
    data  = jsonDecode(response.body) ;
    if(response.statusCode == 200){
    //  print("patien list ${data}");
      return PatientListModel.fromJson(data);
    }else{
      return PatientListModel.fromJson(data);
    }
  }

}