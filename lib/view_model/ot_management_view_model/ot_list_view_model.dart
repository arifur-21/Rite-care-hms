import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ritecare_hms/model/ot_management_model/ot_list_model.dart';
import 'package:ritecare_hms/model/ot_management_model/surgery_note_model.dart';

import '../../data/response/status.dart';
import '../../repository/repository.dart';
import '../../repository/search_repository/SearchRepository.dart';
import '../../shere_preference/login_preference.dart';
import 'package:http/http.dart' as http;

import '../../utils/utils.dart';

class OtListViewModel extends GetxController {
  final _api = Repository();

  final surgeryNoteController = TextEditingController().obs;


  final rxRequestStatus = Status.LOADING.obs;
  final otScheduleList = OtScheduleModel().obs;
  final surgeryNoteItem = <SurgeryNoteModel>[].obs;
  RxString error = ''.obs;
  SurgeryNoteModel surgeryNoteModel = SurgeryNoteModel();

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setOtSchedule(OtScheduleModel _value) => otScheduleList.value = _value;

  void setSurgeryNote(List<SurgeryNoteModel> _value) =>
      surgeryNoteItem.value = _value;

  void setError(String _value) => error.value = _value;

  dynamic startDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;
  dynamic endDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;
  dynamic id;


  /// get ot schedule
 Future<dynamic> getSchedule() async {
    setRxRequestStatus(Status.LOADING);
    await _api.getOtSchedule(startDate, endDate).then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setOtSchedule(value);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }

  Stream<dynamic> getNumbers(Duration refreshTime) async* {
    while (true) {
      await Future.delayed(refreshTime);
      yield await getSchedule();
    }
  }

  //get surgery not data
  Future<List<SurgeryNoteModel>> getSurgerNoteData() async {
    setRxRequestStatus(Status.LOADING);
    await _api.getSurgeryNote(id).then((value) {
      print("note ${value}");
      setRxRequestStatus(Status.SUCCESS);
      setSurgeryNote(value);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("vm error get surgery note ${error.toString()}");
    });

    return surgeryNoteItem;
  }

  //surgery note post
  void surgeryNotePost(dynamic noteId) async {
    print("vm noteId ${noteId}");
    Map data = {"Note": surgeryNoteController.value.text, "SurgeryId": noteId};
    await _api.postSurgeryNote(data).then((value) {
     getSurgerNoteData();
      Utils.snakBar("Ot", 'successfully');
    }).onError((error, stackTrace) {
      Utils.snakBar("Error", error.toString());
      print("error occured : ${error.toString()}");
    });
  }

  /// operation Schedule status
  void operationScheduleStatus(dynamic statusId, dynamic status, dynamic noteId) async {
    print("opSchedule ${statusId}");
    print("opSchedule status ${status}");
    print("note id ${noteId}");

    Map data = {
      "surgery": {
        "Id": noteId,
        "SurgeryTypeId": 39,
        "PatientId": 775985,
        "SurgeryItemId": 321154,
        "SurgeryStatusId": "$statusId",
        "UserId": 30515,
        "Active": true,
        "BranchId": 33,
        "TenantId": 25,
        "RoomId": 50337,
        "SurgeryScheduleDate": "$startDate",
        "StartTime": "00:00:00",
        "EndTime": "00:00:00",
        "InstrumentReceived": false,
        "InstrumentRefund": false,
        "Archived": false,
        "Disease": "saa",
        "ANS": "sdf",
        "ASA": "fds",
        "Ward": "sdf",
        "IsApproved": false,
        "ApprovedUserId": 0,
        "SurgeryServiceProviderMaps": null,
        "SurgeryType": {
          "Id": 39,
          "Name": "Cardiac",
          "Description": null,
          "UserId": 30515,
          "Active": true,
          "TenantId": 25
        },
        "SurgeryStatus": {
          "Id": "103",
          "Name": "Started",
          "UserId": 2,
          "Active": true,
          "SurgeryDetails": null
        },
        "OperationRoom": {
          "Id": 50337,
          "RoomNumber": "OT-4",
          "RoomName": "Operation Theater",
          "SurgeryTypeId": 39,
          "InchargeId": 30515,
          "NoOfBed": 2,
          "UserId": 30515,
          "Active": true,
          "BranchId": 33,
          "Branch": null,
          "TenantId": 25,
          "SurgeryType": {
            "Id": 39,
            "Name": "Cardiac",
            "Description": null,
            "UserId": 30515,
            "Active": true,
            "TenantId": 25
          },
          "User": {
            "Id": 30515,
            "ContactId": 102157,
            "UserName": "admin@rite.com.bd",
            "Contact": {
              "Id": 102157,
              "Active": true,
              "UserId": 30490,
              "TenantId": 25,
              "FirstName": "Alamgir",
              "LastName": "Kabir",
              "PhoneNumber": "123",
              "GenderId": 1,
              "Street": null,
              "City": null,
              "Zip": null,
              "Country": "BD",
              "Email": "admin@afip.com",
              "Fax": null,
              "WebSite": null,
              "Photo": null,
              "IsCompany": null
            }
          },
          "PostOperativeRooms": [
            {
              "Id": 54014,
              "OperationRoomId": 50337,
              "BedNo": 1,
              "Occupency": false,
              "UserId": 30515,
              "Active": true,
              "PatientId": null,
              "OperationRoom": null,
              "PostOperativePatientHistories": []
            },
            {
              "Id": 54015,
              "OperationRoomId": 50337,
              "BedNo": 2,
              "Occupency": false,
              "UserId": 30515,
              "Active": true,
              "PatientId": null,
              "OperationRoom": null,
              "PostOperativePatientHistories": []
            }
          ]
        },
        "Patient": {
          "Id": 775985,
          "OldId": null,
          "FirstName": "abcd",
          "LastName": "",
          "PhoneNumber": "0",
          "GenderId": 1,
          "BloodGroup": null,
          "BloodGroupId": null,
          "FatherName": null,
          "DOB": "2023-07-12T00:00:00",
          "NationalId": "",
          "Occupation": null,
          "Street": "",
          "City": "",
          "Zip": "",
          "Country": "BD",
          "Email": "",
          "Photo": null,
          "EmergencyNumber": "",
          "EmergencyContactName": "",
          "EmergencyContactRelation": "",
          "CreatedDate": "2023-04-13T16:40:42.617",
          "ServiceId": "7777898",
          "RelationshipId": null,
          "RankId": 0,
          "TradeId": null,
          "ServiceTypeId": 0,
          "RankTypeId": null,
          "UnitName": "37 ST BN",
          "RankName": "null",
          "TradeName": null,
          "UnitId": 0,
          "IsRetired": false,
          "PatientPrefixId": 0,
          "PatientStatusId": null,
          "Sex": null,
          "OldDob": null,
          "Relationship": null,
          "Rank": null,
          "Unit": null,
          "Trade": null
        },
        "Item": {
          "Name": "Open Heart Surgery",
          "GenericName": null,
          "Code": "OH-01",
          "ItemTypeId": 32,
          "MedicalTypeId": 63,
          "ItemCategoryId": 80847,
          "MeasurementUnitId": null,
          "SalePrice": 10000,
          "BuyPrice": 0,
          "ServiceProviderId": null,
          "ReferralAllowed": false,
          "Description": null,
          "DefaultReferrarFee": 0,
          "LabReportGroupId": null,
          "ItemType": null,
          "ItemCategory": {
            "Name": "General",
            "MedicalTypeId": 63,
            "ReferralCommission": null,
            "IsPathology": false,
            "SampleId": 0,
            "Items": [],
            "ItemSubCategories": [],
            "MedicalType": null,
            "TenantId": 25,
            "Tenant": null,
            "Id": 80847,
            "Active": true,
            "UserId": 30515,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          "MeasurementUnit": null,
          "MedicalType": null,
          "Inventory": null,
          "Id": 321154,
          "Active": true,
          "UserId": 30490,
          "HasErrors": false,
          "ErrorCount": 0,
          "NoErrors": true
        },
        "SurgeryNotes": ""
      }
    };
    await _api.postOperationScheduleStatus(data).then((value) {

      getSchedule();
      Utils.snakBar("status", 'note surgery successfully');
    }).onError((error, stackTrace) {
      Utils.snakBar("Error", error.toString());
      print("error occured : ${error.toString()}");
    });
  }

  //edit surgery note
  void editSurgeryNote(dynamic noteId, dynamic id) async {
    print("vm edit noteId ${noteId}");
    print("vm  edti noteId ${id}");
    Map data = {
      "Note": surgeryNoteController.value.text,
      "SurgeryId": noteId,
      "Id": id,
    };
    await _api.postSurgeryNote(data).then((value) {
      getSurgerNoteData();
      Utils.snakBar("Update", 'Update successfully');
    }).onError((error, stackTrace) {
      Utils.snakBar("Error", error.toString());
      print("error occured : ${error.toString()}");
    });
  }

  //delete surgery Note
  void deleteSurgeryNote(dynamic noteId, dynamic id) async {
    print("vm delete noteId ${noteId}");
    print("vm delete Id ${id}");
    Map data = {
      "UserId": 30515,
      "Active": true,
      "Id": id,
      "Note": "Bloodd",
      "SurgeryId": noteId
    };
    await _api.surgeryNoteDelete(data).then((value) {
      getSurgerNoteData();
      Utils.snakBar("Delete", 'Delete successfully');
    }).onError((error, stackTrace) {
      Utils.snakBar("Error", error.toString());
      print("error occured : ${error.toString()}");
    });
  }
}
