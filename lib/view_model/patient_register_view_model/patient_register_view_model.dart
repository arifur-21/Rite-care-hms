
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/model/search_model/SearchModel.dart';
import 'package:ritecare_hms/resources/app_url/app_url.dart';

import '../../data/response/status.dart';
import '../../model/register/blood_group_model/BloodGroupModel.dart';
import '../../model/register/gender_model.dart';
import '../../repository/register_patient_repository/patient_register_repository.dart';
import '../../shere_preference/login_preference.dart';
import '../../utils/utils.dart';
import 'package:http/http.dart' as http;

class PatientRegisterViewModel extends GetxController{


  final _api = RegisterPatientRepository();
  LoginPreference loginPreference = LoginPreference();
  var token;

  final  personalController = TextEditingController().obs;
  var  firstNameController = TextEditingController().obs;
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

  RxString gender = ''.obs;

  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;

  final bloodGroupList = BloodGroupModel().obs;
  final genderList = GenderModel().obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setPatientBlood(BloodGroupModel _value) => bloodGroupList.value = _value;
  void serGender(GenderModel _value) => genderList.value = _value;
  void setError(String _value) => error.value = _value;


  void registerPatient({
    dynamic service,
    dynamic status,
    dynamic relation,
    dynamic gender,
    dynamic prefix,
    dynamic blood,
    dynamic imageUrl,
    dynamic  dateOfBrith
  }
      ){


    Map data = {
      "FirstName": "Rizwan",
      "LastName": "",
      "PhoneNumber": phoneNumberController.value.text,
      "BloodGroup": blood.toString(),
      "DOB": dateOfBrith.toString(),
      "Email": emailController.value.text,
      "Photo": imageUrl.toString(),
      "EmergencyNumber": "",
      "EmergencyContactName": "",
      "EmergencyContactRelation": "",
      "CreatedDate": "/Date(1680881032977)/",
      "ServiceId": "987654",
      "RelationshipId": 1,
      "RankId": 179,
      "TradeId": null,
      "ServiceTypeId": 0,
      "RankTypeId": null,
      "UnitName": uniController.value.text,
      "RankName": rankController.value.text,
      "PatientStatusId": null,
      "Sex": null,
      "OldDob": null,
      "Gender": {
        "Name": gender
      },
      "PatientPrefix": {
        "Name": prefix
      },
      "PatientStatus": status.toString(),
      "Relationship": {
        "Name": relation
      }
    };

    _api.registerPatient(data).then((value){
      Utils.snakBar("Registration", 'Registration successfully');
    }).onError((error, stackTrace) {
      Utils.snakBar("Error", error.toString());
      print("error occured : ${error.toString()}");
    });

  }



  void registerPatientFullForm({
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
      "FirstName": "Rizwan",
      "LastName": lastNameController.value.text,
      "PhoneNumber": phoneNumberController.value.text,
      "BloodGroup": blood.toString(),
      "DOB": dateOfBrith.toString(),
      "NationalId": nationalIdController.value.text,
      "Street": streetController.value.text ,
      "City": cityController.value.text,
      "Email": emailController.value.text,
      "Photo": imageUrl.toString(),
      "EmergencyNumber": emergencyContactNumberController.value.text,
      "EmergencyContactName": emergencyNameContactController.value.text,
      "EmergencyContactRelation": emergencyContactRelationController.value.text,
      "CreatedDate": "/Date(1680881032977)/",
      "ServiceId": "987654",
      "RelationshipId": 1,
      "RankId": 179,
      "TradeId": null,
      "ServiceTypeId": 0,
      "RankTypeId": null,
      "UnitName": uniController.value.text,
      "RankName": rankController.value.text,
      "PatientStatusId": null,
      "Sex": null,
      "OldDob": patientOldIdController.value.text.toString(),
      "Gender": {
        "Name": gender
      },
      "PatientPrefix": {
        "Name": prefix
      },
      "PatientStatus": status.toString(),
      "Relationship": {
        "Name": relation
      }
    };

    _api.registerPatient(data).then((value){
      Utils.snakBar("Registration", 'Patient Registration Successfull');
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
      "Zip": "",
      "Country": "BD",
      "Email": emailController.value.text,
      "Photo": imageUrl.toString(),
      "EmergencyNumber": emergencyContactNumberController.value.text,
      "EmergencyContactName": emergencyNameContactController.value.text,
      "EmergencyContactRelation": emergencyContactRelationController.value.text,
      "CreatedDate": dateOfBrith.toString(),
      "UnitName": uniController.value.text,
      "RankName": rankController.value.text,
      "TradeName": "null",
      "UnitId": 69,
      "IsRetired": false,
      "PatientPrefixId": 101,
      "PatientStatusId": null,
      "Sex": "null",
      "OldDob": "null",
      "Gender": {
        "Name": gender,
        "Code": 101,
        "TypeName": "Male",
        "User": null,
        "BloodDonors": [],
        "Id": 1,
        "Active": true,
        "UserId": 2,
        "HasErrors": false,
        "ErrorCount": 0,
        "NoErrors": true
      },
      "PatientPrefix": {
        "Name": prefix,
        "Prefix": "O         ",
        "LanguageCode": "EN",
        "Id": 101,
        "Active": true,
        "UserId": null,
        "HasErrors": false,
        "ErrorCount": 0,
        "NoErrors": true
      },
      "PatientStatus": null,
      "Memberships": [],
      "PatientInvoices": [],
      "PatientServices": [],
      "Payments": [],
      "DoctorAppointments": [],
      "Relationship": {
        "Name": relation,
        "LanguageCode": null,
        "Id": 1,
        "Active": true,
        "UserId": null,
        "HasErrors": false,
        "ErrorCount": 0,
        "NoErrors": true
      },
      "Rank": {
        "Name": "Capt",
        "LanguageCode": null,
        "Id": 179,
        "Active": true,
        "UserId": null,
        "HasErrors": false,
        "ErrorCount": 0,
        "NoErrors": true
      },
      "Unit": {
        "Name": "71 Bde",
        "LanguageCode": null,
        "Id": 69,
        "Active": true,
        "UserId": null,
        "HasErrors": false,
        "ErrorCount": 0,
        "NoErrors": true
      },
      "Trade": null,
      "ParentPatient": null,
      "VisitNo": null,
      "PatientInvoiceShadowId": 0,
      "TenantId": 25,
      "Tenant": null,
      "Id": 775898,
      "Active": true,
      "UserId": null,
      "HasErrors": false,
      "ErrorCount": 0,
      "NoErrors": true
    };




    _api.registrationUpdate(data).then((value){

      Utils.snakBar("Update", 'Update Successfull');
    }).onError((error, stackTrace) {
      Utils.snakBar("Error", error.toString());
      print("error occured : ${error.toString()}");
    });

  }



  void BloodGroup(){
    print("test1");
    _api.getBloodGroup().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setPatientBlood(value);
      print("blood group ${value.data?.length}");
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }


  void getGender(){
    _api.getGender().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      serGender(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
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
      return data;
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