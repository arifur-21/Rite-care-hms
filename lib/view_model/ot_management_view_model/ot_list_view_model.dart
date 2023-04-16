import 'dart:convert';

import 'package:get/get.dart';
import 'package:ritecare_hms/model/ot_management_model/ot_list_model.dart';

import '../../shere_preference/login_preference.dart';
import 'package:http/http.dart' as http;

class OtListViewModel extends GetxController{

  RxString startDate = ''.obs;
  RxString endDate = ''.obs;

  LoginPreference loginPreference = LoginPreference();
  var token;


  Future<OtListModel> getOtListData()async {
    var data;

    loginPreference.getToken().then((value){
      token = value.accessToken!;
    });

    final response = await http.get(Uri.parse('https://mobileapp.rite-hms.com/OT/GetOperationScheduleList?pageNumber=1&pageSize=25&startDate=2023-04-15&endDate=2023-04-15&patientId=0'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'cache-control': 'no-cache'
        }
    );
    data  = jsonDecode(response.body) ;
   // print('status:${response.statusCode}');
    if(response.statusCode == 200){
     // print(("ot list model1 ${data['items']}"));
     dynamic a = jsonDecode(data['items']);
      print("ot list model ${a[0]['Id']}");
      return OtListModel.fromJson(data);
    }else{
      return OtListModel.fromJson(data);
    }
  }


}