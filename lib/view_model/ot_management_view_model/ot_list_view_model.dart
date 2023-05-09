import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ritecare_hms/model/ot_management_model/ot_list_model.dart';
import 'package:ritecare_hms/model/ot_mangement_model/surgery_note_model.dart';

import '../../data/response/status.dart';
import '../../repository/repository.dart';
import '../../repository/search_repository/SearchRepository.dart';
import '../../shere_preference/login_preference.dart';
import 'package:http/http.dart' as http;

import '../../utils/utils.dart';

class OtListViewModel extends GetxController{

  final _api = Repository();
  final _repo = Repository();
  LoginPreference loginPreference = LoginPreference();
  var token;
  dynamic id;

  final surgeryNoteController = TextEditingController().obs;


  final rxRequestStatus = Status.LOADING.obs;
  final otScheduleList = OtScheduleModel().obs;
  final surgeryNoteItem = <SurgeryNoteModel>[].obs;
  RxString error = ''.obs;
  SurgeryNoteModel surgeryNoteModel = SurgeryNoteModel();

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setOtSchedule(OtScheduleModel _value) => otScheduleList.value = _value;
  void setSurgeryNote(List<SurgeryNoteModel> _value) => surgeryNoteItem.value = _value;
  void setError(String _value) => error.value = _value;

  dynamic startDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;
  dynamic endDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;


  /// get ot schedule
  Future<void>? getSchedule(){
    _api.getOtSchedule(startDate, endDate).then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setOtSchedule(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }

  //get surgery not data
  Future<List<SurgeryNoteModel>> getSurgerNoteData()async{
    setRxRequestStatus(Status.LOADING);
    _api.getSurgeryNote(id).then((value) {
      print("note ${value}");
      setRxRequestStatus(Status.SUCCESS);
      setSurgeryNote(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("vm error get surgery note ${error.toString()}");
    });

    return surgeryNoteItem;
  }


  //surgery note post
  void surgeryNotePost(dynamic noteId){
    print("vm noteId ${noteId}");
    Map data =   {
      "Note": surgeryNoteController.value.text,
      "SurgeryId": noteId
    };
    _api.postSurgeryNote(data).then((value){
      Utils.snakBar("ot surgery", 'note surgery successfully');
    }).onError((error, stackTrace) {
      Utils.snakBar("Error", error.toString());
      print("error occured : ${error.toString()}");
    });
  }

  /// operation Schedule status
  void operationScheduleStatus(dynamic statusId, dynamic status, dynamic noteId){
    print("opSchedule ${statusId}");
    print("opSchedule status ${status}");
    print("note id ${noteId}");
    Map data = {
      "Id": noteId,
      "SurgeryTypeId": 39,
      "PatientId": 260647,
      "SurgeryItemId": 321154,
      "SurgeryStatusId": statusId,
      "UserId": 30515,
      "Active": true,
      "BranchId": 33,
      "TenantId": 25,
      "RoomId": 50334,
      "SurgeryScheduleDate": "2023-04-17T00:00:00",
      "StartTime": "14:35:00",
      "EndTime": "00:00:00",
      "IsApproved": false,
      "ApprovedUserId": 0,
      "SurgeryServiceProviderMaps": null,
      "SurgeryStatus": {
        "Id": statusId,
        "Name": status,
        "UserId": 2,
        "Active": true
      }

    };
    _api.postOperationScheduleStatus(data).then((value){
      Utils.snakBar("status", 'note surgery successfully');
    }).onError((error, stackTrace) {
      Utils.snakBar("Error", error.toString());
      print("error occured : ${error.toString()}");
    });
  }

  //edit surgery note
  void editSurgeryNote(dynamic noteId, dynamic id){
    print("vm edit noteId ${noteId}");
    print("vm  edti noteId ${id}");
    Map data =   {
      "Note": surgeryNoteController.value.text,
      "SurgeryId": noteId,
      "Id": id,
    };
    _api.postSurgeryNote(data).then((value){
      Utils.snakBar("ot surgery", 'note surgery successfully');
    }).onError((error, stackTrace) {
      Utils.snakBar("Error", error.toString());
      print("error occured : ${error.toString()}");
    });
  }

  //delete surgery Note
  void deleteSurgeryNote(dynamic noteId, dynamic id){
    print("vm delete noteId ${noteId}");
    print("vm delete Id ${id}");
    Map data = {
      "UserId": 30515,
      "Active": true,
      "Id": id,
      "Note": "Bloodd",
      "SurgeryId": noteId
    };
    _api.surgeryNoteDelete(data).then((value){
      Utils.snakBar("ot surgery", 'note surgery successfully');
    }).onError((error, stackTrace) {
      Utils.snakBar("Error", error.toString());
      print("error occured : ${error.toString()}");
    });
  }






}