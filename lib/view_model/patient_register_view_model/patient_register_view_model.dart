
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/model/search_model/SearchModel.dart';
import 'package:ritecare_hms/resources/app_url/app_url.dart';

import '../../data/response/status.dart';
import '../../model/register/blood_group_model/BloodGroupModel.dart';
import '../../model/register/gender_model.dart';
import '../../model/register/rank_model.dart';
import '../../repository/repository.dart';
import '../../shere_preference/login_preference.dart';
import '../../utils/utils.dart';
import 'package:http/http.dart' as http;

class PatientRegisterViewModel extends GetxController{


  final _api = Repository();
  LoginPreference loginPreference = LoginPreference();
  var token;

  final  officalNOController = TextEditingController().obs;
  final  firstNameController = TextEditingController().obs;
  final  phoneNumberController = TextEditingController().obs;
  final  zipCodeController = TextEditingController().obs;
  final  rankController = TextEditingController().obs;
  final  uniController = TextEditingController().obs;
  final  emailController = TextEditingController().obs;

  final  lastNameController = TextEditingController().obs;
  final  patientOldIdController = TextEditingController().obs;
  final  nationalIdController = TextEditingController().obs;
  final  emergencyContactNumberController = TextEditingController().obs;
  final  emergencyNameContactController = TextEditingController().obs;
  final  emergencyContactRelationController = TextEditingController().obs;
  final  streetController = TextEditingController().obs;
  final  cityController = TextEditingController().obs;

  final rxRequestStatus = Status.LOADING.obs;
  final rankListItem = <RankModel>[].obs;
  final unitListItem = <RankModel>[].obs;

  RxString error = ''.obs;

  dynamic bloodGroupList = BloodGroupModel().obs;
  dynamic genderList = GenderModel().obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setPatientBlood(BloodGroupModel _value) => bloodGroupList.value = _value;
  void setRankList(List<RankModel> _value) => rankListItem.value = _value;
  void setUnitList(List<RankModel> _value) => unitListItem.value = _value;
  void setGender(GenderModel _value) => genderList.value = _value;
  void setError(String _value) => error.value = _value;




  /// get blood group
  void bloodGroup() async{
    setRxRequestStatus(Status.LOADING);
    await _api.getBloodGroup().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setPatientBlood(value);
      print("blood group ${value.data}");
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }


  void getGender() async{
    await _api.getGender().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setGender(value);
      print('erer${value}');
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }


  //registration short form
  void registerPatient({
    dynamic serviceId,
    dynamic genderId,
    dynamic bloodId,
    dynamic imageUrl,
    dynamic  dateOfBrith,
    dynamic isRetired,
    dynamic prefixId,
    dynamic statusId,
    dynamic relationId,
    dynamic rankId,
    dynamic unitId,
    dynamic patientPrefixName,
    dynamic patientStatusName,
    dynamic patientRelationName,
    dynamic bloodGroupName,
    dynamic genderName,
    dynamic rankName,
    dynamic unitName,
  }
      ){
    print("genderIdvm $genderId");
    print("bloodIdvm $bloodId");
    print("statusIdvm $statusId");
    print("preIdvm $prefixId");

    Map data =
    {
      "FirstName": firstNameController.value.text,
      "PhoneNumber": phoneNumberController.value.text,
      "GenderId": genderId,
      "BloodGroup": null,
      "BloodGroupId": bloodId,
      "DOB": dateOfBrith,
//  "NationalId": "",
      // "Occupation": "",
      // "Street": "",
      // "City": "",
      // "Zip": "",
//  "Country": "BD",
      "Email": emailController.value.text,
      "Photo": null,
      // "EmergencyNumber": "",
      // "EmergencyContactName": "",
      // "EmergencyContactRelation": "",
      "CreatedDate": dateOfBrith.toString(),
      "ServiceId": officalNOController.value.text,
      "RelationshipId": null,
      "RankId": rankId,
      "TradeId": null,
      "ServiceTypeId": 0,
      "RankTypeId": null,
      "UnitName": unitName.toString(),
      "RankName": rankName.toString(),
      "TradeName": null,
      "UnitId": unitId,
      "IsRetired": isRetired,
      "PatientPrefixId": prefixId,
      "PatientStatusId": null,
      // "Sex": null,
      //"OldDob": null,
      "Gender": {
        "Name": genderName.toString(),
        "Id": genderId
      },

      "Rank": {
        "Name": rankName,
        "Id": rankId
      },
      "Unit": {
        "Name": unitId,
        "Id": unitName

      },
      "Id": 776087
    };

    _api.registerPatient(data).then((value){
      if(value == "PatientExist") {
        Utils.snakBar("Registration", 'Already Exist.');
      }
      print(value);
      if(value['Id'] > 0) {
        Utils.snakBar("Registration", 'Registration successfully');
      }
      print("short form register ${value}");

    }).onError((error, stackTrace) {
      Utils.snakBar("Error", error.toString());
      print("error occured : ${error.toString()}");
    });

  }



  //registration full form
  void registerPatientFullForm({
    dynamic serviceId,
    dynamic genderId,
    dynamic bloodId,
    dynamic imageUrl,
    dynamic  dateOfBrith,
    dynamic isRetired,
    dynamic prefixId,
    dynamic statusId,
    dynamic relationId,
    dynamic rankId,
    dynamic unitId,
    dynamic patientPrefixName,
    dynamic patientStatusName,
    dynamic patientRelationName,
    dynamic bloodGroupName,
    dynamic genderName,
    dynamic rankName,
    dynamic unitName,
  }){


    Map data =
    {
      "FirstName": firstNameController.value.text,
      "LastName": lastNameController.value.text,
      "PhoneNumber": phoneNumberController.value.text,
      "GenderId": genderId,
      "BloodGroup": null,
      "BloodGroupId": bloodId,
      "DOB": dateOfBrith.toString(),
      "NationalId": nationalIdController.value.text,
      // "Occupation": "",
       "Street": streetController.value.text,
       "City": cityController.value.text,
      // "Zip": "",
//  "Country": "BD",
      "Email": emailController.value.text,
      "Photo": null,
       "EmergencyNumber": emergencyNameContactController.value.text,
       "EmergencyContactName": emergencyNameContactController.value.text,
       "EmergencyContactRelation": emergencyContactRelationController.value.text,
      "CreatedDate": dateOfBrith.toString(),
      "ServiceId": officalNOController.value.text,
      "RelationshipId": null,
      "RankId": rankId,
      "TradeId": null,
      "ServiceTypeId": 0,
      "RankTypeId": null,
      "UnitName": unitName,
      "RankName": rankName,
      "TradeName": null,
      "UnitId": unitId,
      "IsRetired": isRetired,
      "PatientPrefixId": prefixId,
      "PatientStatusId": null,
      // "Sex": null,
      //"OldDob": null,
      "Gender": {
        "Name": genderName,
        "Id": genderId
      },

      "Rank": {
        "Name": rankName,
        "Id": rankId
      },
      "Unit": {
        "Name": unitName,
        "Id": unitId

      },
      "Trade": null,
      "ParentPatient": null,
      "VisitNo": null,
      "PatientInvoiceShadowId": 0,
      "TenantId": 25,
      "Tenant": null,
      "Id": 776087
    };

    _api.registerPatient(data).then((value){
      if(value == "PatientExist") {
        Utils.snakBar("Registration", 'Already Exist.');
      }

      if(value['Id'] > 0) {
        Utils.snakBar("Registration", 'Registration successfully');
      }
    }).onError((error, stackTrace) {
      Utils.snakBar("Error", error.toString());
      print("error occured : ${error.toString()}");
    });

  }


  void patientRegistrationUpdate({
    dynamic service,
    dynamic status,
    dynamic relation,
    dynamic gender,
    dynamic prefix,
    dynamic blood,
    dynamic imageUrl,
    dynamic  dateOfBrith,
    dynamic isRetired,
  }
      ){


    Map data = {
      "OldId": patientOldIdController.value.text.toString(),
      "FirstName": "Rizwan",
      "PhoneNumber": phoneNumberController.value.text,
      "GenderId": 1,
      "BloodGroup": blood.toString(),
      "DOB": "/Date(1679901252000)/",
      "NationalId": nationalIdController.value.text,
      "Street": streetController.value.text,
      "City": cityController.value.text,
      "Country": "BD",
      "Email": emailController.value.text,
      "Photo": imageUrl.toString(),
      "EmergencyNumber": emergencyContactNumberController.value.text,
      "EmergencyContactName": emergencyNameContactController.value.text,
      "EmergencyContactRelation": emergencyContactRelationController.value.text,
      "CreatedDate": dateOfBrith.toString(),
      "UnitName": uniController.value.text,
      "RankName": rankController.value.text,
      "UnitId": 69,
      "IsRetired": false,
      "PatientPrefixId": 101,
      "PatientStatusId": null,
      "Gender": {
        "Name": gender,
        "Id": 1,
      },
      "PatientPrefix": {
        "Name": prefix,
        "Id": 101,
      },
      "PatientStatus": null,
      "Relationship": {
        "Name": relation,
        "Id": 1,
      },
      "Rank": {
        "Name": "Capt",
        "Id": 179,
      },
      "Unit": {
        "Name": "71 Bde",
        "Id": 69,
      },
    };

    _api.registrationUpdate(data).then((value){

      Utils.snakBar("Update", 'Update Successfull');
    }).onError((error, stackTrace) {
      Utils.snakBar("Error", error.toString());
      print("error occured : ${error.toString()}");
    });

  }






  //get rank data
  Future<List<RankModel>> getRankData()async{
    setRxRequestStatus(Status.LOADING);
   await _api.getRankListData().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setRankList(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error  ${error.toString()}");
    });

    return rankListItem;
  }

  //get unit data
  Future<List<RankModel>> getUnitData()async{
    setRxRequestStatus(Status.LOADING);
   await _api.getUnitListData().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setUnitList(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error cell ${error.toString()}");
    });

    return unitListItem;
  }

  Future<List<dynamic>> getPatientPrefix()async {
    var data;

    loginPreference.getToken().then((value){
      token = value.accessToken!;
    });

    final response = await http.get(Uri.parse(AppUrl.patientPrefixurl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'cache-control': 'no-cache'
        }
    );

    if(response.statusCode == 200){
      data  = jsonDecode(response.body) ;
      print("data prefix ${response.body.length}");
      return data;
    }else{
      return data;
    }
  }


  Future<List<dynamic>> getPatientStatus()async {
    var data;

    loginPreference.getToken().then((value){
      token = value.accessToken!;
    });

    final response = await http.get(Uri.parse(AppUrl.patientStatusurl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'cache-control': 'no-cache'
        }
    );

    if(response.statusCode == 200){
      data  = jsonDecode(response.body) ;
      print("data prefix ${response.body.length}");
      final dropdownData = List<dynamic>.from(data);
      return dropdownData;
    }else{
      return data;
    }
  }

  Future<List<dynamic>> getPatientRelation()async {
    var data;

    loginPreference.getToken().then((value){
      token = value.accessToken!;
    });

    final response = await http.get(Uri.parse(AppUrl.patientRelationurl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'cache-control': 'no-cache'
        }
    );

    if(response.statusCode == 200){
      data  = jsonDecode(response.body) ;
      print("data prefix ${response.body.length}");
      return data;
    }else{
      return data;
    }
  }


}