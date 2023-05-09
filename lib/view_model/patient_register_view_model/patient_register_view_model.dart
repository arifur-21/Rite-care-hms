
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/model/search_model/SearchModel.dart';
import 'package:ritecare_hms/resources/app_url/app_url.dart';

import '../../data/response/status.dart';
import '../../model/register/blood_group_model/BloodGroupModel.dart';
import '../../model/register/gender_model.dart';
import '../../repository/repository.dart';
import '../../shere_preference/login_preference.dart';
import '../../utils/utils.dart';
import 'package:http/http.dart' as http;

class PatientRegisterViewModel extends GetxController{


  final _api = Repository();
  LoginPreference loginPreference = LoginPreference();
  var token;

  final  personalController = TextEditingController().obs;
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

  RxString gender = ''.obs;


  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;

  dynamic bloodGroupList = BloodGroupModel().obs;
  dynamic genderList = GenderModel().obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setPatientBlood(BloodGroupModel _value) => bloodGroupList.value = _value;
  void serGender(GenderModel _value) => genderList.value = _value;
  void setError(String _value) => error.value = _value;


  //registration short form
  void registerPatient({
    dynamic service,
    dynamic status,
    dynamic relation,
    dynamic gender,
    dynamic prefix,
    dynamic blood,
    dynamic imageUrl,
    dynamic  dateOfBrith,
    dynamic isRetired,
    dynamic prefixId,
    dynamic statusId,
    dynamic relationId
  }
      ){


    Map data =
    {
      "FirstName": "Rizwan",
      "PhoneNumber": phoneNumberController.value.text,
    //  "GenderId": 1,
    //  "BloodGroup": null,
     // "BloodGroupId": null,
    //  "FatherName": null,
      "DOB": dateOfBrith.toString(),
      "Email": emailController.value.text,
      "Photo": imageUrl.toString(),
      "ServiceId": personalController.value.text,
      "RelationshipId": relationId,
      "BloodGroupId": blood,
      "RankId": 179,
      "UnitName": "71 Bde",
      //"RankName": "Capt",
     // "UnitId": 69,
      //"PatientStatus": status,
      //"PatientStatusId": statusId,
      "IsRetired": isRetired,
      "PatientPrefixId": prefixId,
      "Gender": {
        "Name": gender.toString(),
      //  "Id": 1
      },

      "Relationship": {
        "Name": relation.toString(),
        "Id": relationId
      },
      "Rank": {
        "Name": rankController.value.text,
        "Id": 179

      },
      "Unit": {
        "Name": "71 Bde",
        "Id": 69

      },
  //    "Id": 775898

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
    dynamic service,
    dynamic status,
    dynamic relation,
    dynamic gender,
    dynamic prefix,
    dynamic blood,
    dynamic imageUrl,
    dynamic  dateOfBrith,
    dynamic isRetired,
    dynamic prefixId,
    dynamic statusId,
    dynamic relationId
  }){


    Map data ={
      "FirstName": firstNameController.value.text,
      "PhoneNumber": phoneNumberController.value.text,
      "LastName": lastNameController.value.text,
      "NationalId": nationalIdController.value.text,
      //  "GenderId": 1,
      //  "BloodGroup": null,
      // "BloodGroupId": null,
      //  "FatherName": null,
      "DOB": dateOfBrith.toString(),
      "Email": emailController.value.text,
      "Photo": imageUrl.toString(),
      "ServiceId": personalController.value.text,
      "EmergencyNumber": emergencyContactNumberController.value.text,
      "EmergencyContactName": emergencyNameContactController.value.text,
      "EmergencyContactRelation": emergencyContactRelationController.value.text,
      "RelationshipId": relationId,
      "BloodGroupId": blood,
      "Street": streetController.value.text,
      "City": cityController.value.text,
      "RankId": 179,
      "UnitName": "71 Bde",
      //"RankName": "Capt",
      // "UnitId": 69,
      "BloodGroup": blood,
      "PatientStatusId": "statusId",
      "PatientStatus": "status",
      "IsRetired": isRetired,
      "PatientPrefixId": prefixId,
      "Gender": {
        "Name": "Male",
        "Code": 101,
        "TypeName": "Male",
      },

      "Relationship": {
        "Name": relation.toString(),
        "Id": relationId
      },
      "Rank": {
        "Name": rankController.value.text,
        "Id": 179

      },
      "Unit": {
        "Name": "71 Bde",
        "Id": 69

      },


    };

    _api.registerPatient(data).then((value){
      if(value == "PatientExist") {
        Utils.snakBar("Registration", 'Already Exist.');
      }

      print('patient stauts ${gender}');
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



  Future? BloodGroup(){
    print("blood group vm");
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
      print('erer${value}');
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