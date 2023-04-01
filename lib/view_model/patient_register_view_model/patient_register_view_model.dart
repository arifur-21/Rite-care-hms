
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/model/patient/PatientRegisterModel.dart';

import '../../repository/register_patient_repository/register_patient.dart';
import '../../utils/utils.dart';

class PatientRegisterViewModel extends GetxController{

  final _api = RegisterPatientRepository();

  final serviceTypeController = TextEditingController().obs;
  final patientPrefixController = TextEditingController().obs;
  final patientStatusController = TextEditingController().obs;
  final fullNameController = TextEditingController().obs;
  final dynamic genderController = TextEditingController().obs;
  final bloodTypeController = TextEditingController().obs;
  final phoneNumberController = TextEditingController().obs;
  final zipCodeController = TextEditingController().obs;
  final dateOfBirthController = TextEditingController().obs;

  void registerPatient(){

/*
    PatientRegisterModel  patientRegisterModel = PatientRegisterModel(
       firstName: fullNameController.value.text.toString(),
      genderId: genderController.value.text,
      phoneNumber: phoneNumberController.toString(),
      zip: zipCodeController.toString(),
    );*/


    Map data = {
      "OldId": null,
      "FirstName": "Rizwan",
      "LastName": "",
      "PhoneNumber": "0174569874",
      "GenderId": 1,
      "BloodGroup": null,
      "BloodGroupId": null,
      "FatherName": null,
      "DOB": "/Date(859399200000)/",
      "NationalId": "",
      "Street": "",
      "City": "",
      "Zip": "",
      "Country": "BD",
      "Email": "",
      "Photo": null,
      "EmergencyNumber": "",
      "EmergencyContactName": "",
      "EmergencyContactRelation": "",
      "CreatedDate": "/Date(1679901252427)/",
      "ServiceId": "987654",
      "RelationshipId": 1,
      "RankId": 179,
      "TradeId": null
    };

    _api.registerPatient(data).then((value){
      print("value : $value");
      Utils.snakBar("Login", 'Login successfully');
    }).onError((error, stackTrace) {
      Utils.snakBar("Error", error.toString());
      print("error occured : ${error.toString()}");
    });

  }


}