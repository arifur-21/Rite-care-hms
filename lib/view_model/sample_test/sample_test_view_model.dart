
import 'dart:convert';

import '../../shere_preference/login_preference.dart';
import 'package:http/http.dart' as http;

class SampleTestViewModel{
  LoginPreference loginPreference = LoginPreference();
  var token;

  // get sample list data
  Future<List<dynamic>> getSimpleListData()async {
    var data;

    loginPreference.getToken().then((value){
      token = value.accessToken!;
    });

    final response = await http.get(Uri.parse("https://mobileapp.rite-hms.com/Item/GetInvoiceSampleIDByMedicalType?id=775925&statusid=0&medicalTypeID=62&DateStart=2023-04-06&DateEnd=2023-04-06&pageNumber=1&pageSize=25&invoiceId=undefined&sampleId=null"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'cache-control': 'no-cache'
        }
    );

    if(response.statusCode == 200){
      data  = jsonDecode(response.body) ;
      return data;
    }else{
      return data;
    }
  }

}