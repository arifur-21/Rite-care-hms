
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:ritecare_hms/model/lab_test_model/status_model.dart';
import 'package:ritecare_hms/model/login_model/login_token_model.dart';
import 'package:ritecare_hms/repository/repository.dart';
import 'package:ritecare_hms/resources/app_url/app_url.dart';

import '../../data/app_exceptions.dart';
import '../../data/response/status.dart';
import '../../model/lab_test_model/lab_test_list_model.dart';
import '../../model/lab_test_model/simple_list_models.dart';
import '../../model/lab_test_model/summery_model.dart';
import '../../model/lab_test_model/summery_sub_item_model/lab_report_result_model/lab_report_result_model.dart';
import '../../model/lab_test_model/summery_sub_item_model/lab_test_name_sugg_model.dart';
import '../../model/lab_test_model/summery_sub_item_model/table_row_design_model.dart';

import '../../model/patinet_list_model/patient_list_model.dart';
import '../../model/register/number_check_model.dart';
import '../../repository/search_repository/SearchRepository.dart';
import '../../shere_preference/login_preference.dart';
import 'package:http/http.dart' as http;

import '../../utils/utils.dart';
import '../login_view_model/logged_in_user_model.dart';

class SummeryViewModel{

  final _api = SearchRepository();
  final _repository = Repository();
  LoginPreference loginPreference = LoginPreference();
  var token;
  dynamic list = [];
  dynamic startDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;
  dynamic endDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;



  final sampleIdController = TextEditingController().obs;
  final invoNumController = TextEditingController().obs;

  final textController = TextEditingController().obs;

  dynamic resultData;




  final rxRequestStatus = Status.LOADING.obs;
  final labtestListData = LabTestListModel().obs;
  final sampleListItem = SampleTest().obs;
  final summeryListItem = SummeryModel().obs;
  final tableRowDesignListItem = TableRowDesignModel().obs;
  final sampleListFilterStatus = <StatusListModel>[].obs;
  final labTestNameSuggList = <LabTestNameSuggModel>[].obs;
  final numberCehckList = <NumberCheckModel>[].obs;
  final loggedInUser = LoggedInUserModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setLabTestList(LabTestListModel _value) => labtestListData.value = _value;
  void setSampleList(SampleTest _value) => sampleListItem.value = _value;
  void setSummeryList(SummeryModel _value) => summeryListItem.value =  _value;
  void setTableRowDesign(TableRowDesignModel _value) => tableRowDesignListItem.value = _value;
  void setSampleListFilterStatus(List<StatusListModel> _value) => sampleListFilterStatus.value = _value;
  void setLabTestNameSugg(List<LabTestNameSuggModel> _value) => labTestNameSuggList.value = _value;
  void setNumberCheckData(List<NumberCheckModel> _value) => numberCehckList.value = _value;
  void setLoggedInData(LoggedInUserModel _value) => loggedInUser.value = _value;
  void setError(String _value) => error.value = _value;




  //get rank data
  Future<List<LabTestNameSuggModel>> getLabTestNameSuggData()async {
   // setRxRequestStatus(Status.LOADING);
    await _repository.getLabTestNameSuggData().then((value) {
      resultData = value;
      setRxRequestStatus(Status.SUCCESS);
      setLabTestNameSugg(value);
        }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error  ${error.toString()}");
    });

    return labTestNameSuggList;
  }


  /// get logged in user data
 Future<void> getLoggedInUserData() async{
   await _api.getLoggedInUserData().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setLoggedInData(value);

    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }


    /// get sample list data
  void getSampleListData({ dynamic statusId = 0, dynamic page = 1,dynamic serviceId = 0})async {
    setRxRequestStatus(Status.LOADING);

    await loginPreference.getServiceId().then((value) => {
      serviceId = value.setviceId
    });
    print("service sample  $serviceId");
   await _api.getSampleListData(startDate, endDate, statusId, page, serviceId).then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setSampleList(value);

    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }

  /// get summery list data
  void getSummeryListData({statusId = 0, dynamic page = 1,dynamic serviceId = 0})async {
print("test");
    setRxRequestStatus(Status.LOADING);
   /*await loginPreference.getServiceId().then((value) => {
      serviceId = value.setviceId
    });*/
   print("summery serviceId ${serviceId}");
    await _api.getSummeryListData(startDate, endDate, statusId, page,serviceId).then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setSummeryList(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }

  /// get table row design item
  Future getTableRowDesignItem()async {
    print("test 1");
    setRxRequestStatus(Status.LOADING);
    await _api.getTableRowDesignItem().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setTableRowDesign(value);
      print("table row vm12 ${value.design!}");
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }


  //get sample and summery list filter status
  Future<List<StatusListModel>> getSampleListFilterStatus()async{
   // setRxRequestStatus(Status.LOADING);
   await  _repository.getSampleListFilterStatusData().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setSampleListFilterStatus(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
    });
    return sampleListFilterStatus;
  }

  /// operation Schedule status
  void saveEditLabReportResult({dynamic result})async{
    print("text controller ${textController.value.text}");

    print("result : $result");

  /*  await _repository.saveEditLabReportResult(result).then((value){
      Utils.snakBar("status", 'status update successfull');
    }).onError((error, stackTrace) {
      Utils.snakBar("Error", error.toString());
      print("error occured : ${error.toString()}");
    });*/
  }


  /// operation Schedule status
  void updatePatientServiceMarkAsPrintStatus(dynamic statusId, dynamic status)async{
    print("printed statusid ${statusId}");
    print("printed status ${status}");

    Map data = {
      "InvoiceNo": 1001410,
      "PatientID": 776079,
      "InvoiceDate": "/Date(1684404034000)/",
      "DueDate": "/Date(1684404034000)/",
      "InvoiceStatusId": 2,
      "LabStatusId": 5,
      "TotalAmount": 120,
      "TotalDiscount": 0,
      "ItemDiscount": null,
      "IsRefunded": false,
      "IsReturn": false,
      "ModifiedBy": 30515,
      "IsBothSideDiscount": false,
      "DiscountPercentage": 0,
      "DiscountNote": null,
      "PatientAdmission": null,
      "IsAnyCompleteItem": false,
      "Advance": 0,
      "Vat": 0,
      "IsVatPaid": false,
      "InvoicePayments": [
        {
          "PatientInvoiceId": 551367,
          "Amount": 120,
          "PaymentID": 490154,
          "PatientInvoice": null,
          "Payment": null,
          "PaymentDate": "/Date(1684403598023)/",
          "IsDue": false,
          "IsAdvance": false,
          "User": null,
          "UserName": "(admin@rite.com.bd) Alamgir Kabir",
          "TenantId": 25,
          "Tenant": null,
          "Id": 479369,
          "Active": true,
          "UserId": 30515,
          "HasErrors": false,
          "ErrorCount": 0,
          "NoErrors": true
        }
      ],
      "Patient": {
        "OldId": null,
        "FirstName": "Rizwan",
        "LastName": "",
        "PhoneNumber": "3434",
        "GenderId": 0,
        "BloodGroup": null,
        "BloodGroupId": null,
        "FatherName": null,
        "DOB": "/Date(1683655200000)/",
        "NationalId": "",
        "Occupation": "",
        "Street": "",
        "City": "",
        "Zip": "",
        "Country": null,
        "Email": "",
        "Photo": "null",
        "EmergencyNumber": "",
        "EmergencyContactName": "",
        "EmergencyContactRelation": "",
        "CreatedDate": "/Date(1684121558953)/",
        "ServiceId": "3431",
        "RelationshipId": null,
        "RankId": 179,
        "TradeId": null,
        "ServiceTypeId": null,
        "RankTypeId": null,
        "UnitName": "71 Bde",
        "RankName": "Capt",
        "TradeName": null,
        "UnitId": 0,
        "IsRetired": false,
        "PatientPrefixId": 0,
        "PatientStatusId": null,
        "Sex": null,
        "OldDob": null,
        "Gender": null,
        "PatientPrefix": null,
        "PatientStatus": null,
        "Memberships": [],
        "PatientInvoices": [],
        "PatientServices": [],
        "Payments": [],
        "DoctorAppointments": [],
        "Relationship": null,
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
        "Unit": null,
        "Trade": null,
        "ParentPatient": null,
        "VisitNo": null,
        "PatientInvoiceShadowId": 0,
        "TenantId": 25,
        "Tenant": null,
        "Id": 776079,
        "Active": true,
        "UserId": null,
        "HasErrors": false,
        "ErrorCount": 0,
        "NoErrors": true
      },
      "User": {
        "ContactId": 102157,
        "UserName": "admin@rite.com.bd",
        "Password": "c25b7b368ed58e0983836a4866361c14",
        "RoleId": 225,
        "IsConsolidateReport": false,
        "IsHrmUser": false,
        "CreatedDate": "/Date(1678359605383)/",
        "LanguageCode": null,
        "LoginId": 0,
        "PatientStatusId": 0,
        "Coa": null,
        "HrmAccessToken": null,
        "HrmUrl": null,
        "TenantName": null,
        "Contact": {
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
          "IsCompany": null,
          "ServiceProviders": [],
          "ServiceProviderType": 0,
          "Gender": {
            "Name": "Male",
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
          "TenantId": 25,
          "Tenant": null,
          "Id": 102157,
          "Active": true,
          "UserId": 30490,
          "HasErrors": false,
          "ErrorCount": 0,
          "NoErrors": true
        },
        "Role": {
          "Name": "Admin",
          "TenantId": 25,
          "Tenant": null,
          "Id": 225,
          "Active": true,
          "UserId": 30490,
          "HasErrors": false,
          "ErrorCount": 0,
          "NoErrors": true
        },
        "UserTypeId": 3,
        "IsPermittedForeignMission": false,
        "IsOTApproval": false,
        "Expenses": null,
        "PatientServices": null,
        "UserPatientStatusList": [
          {
            "PatientStatusId": 1,
            "UserId": null,
            "IsSelected": false,
            "CreatedDate": null,
            "User": null,
            "PatientStatus": {
              "Name": "VIP",
              "Prefix": "V         ",
              "LanguageCode": null,
              "Id": 1,
              "Active": true,
              "UserId": null,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "TenantId": 0,
            "Tenant": null,
            "Id": 188,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "PatientStatusId": 2,
            "UserId": null,
            "IsSelected": false,
            "CreatedDate": null,
            "User": null,
            "PatientStatus": {
              "Name": "VVIP",
              "Prefix": "VV",
              "LanguageCode": null,
              "Id": 2,
              "Active": true,
              "UserId": null,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "TenantId": 0,
            "Tenant": null,
            "Id": 189,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "PatientStatusId": 3,
            "UserId": null,
            "IsSelected": false,
            "CreatedDate": null,
            "User": null,
            "PatientStatus": {
              "Name": "ForeignMission",
              "Prefix": "F         ",
              "LanguageCode": null,
              "Id": 3,
              "Active": true,
              "UserId": null,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "TenantId": 0,
            "Tenant": null,
            "Id": 190,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          }
        ],
        "ImportTenantId": 0,
        "ImportBranchId": 0,
        "UserItemCategories": [
          {
            "ItemCategoryId": 70676,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11714,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70709,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11715,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70699,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11716,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70694,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11717,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 80842,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11718,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70700,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11719,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 80843,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11720,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70675,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11721,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70695,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11722,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70696,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11723,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70697,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11724,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70698,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11725,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 80844,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11726,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 80845,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11727,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70704,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11728,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70692,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11729,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70677,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11730,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 80846,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11731,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70708,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11732,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          }
        ],
        "InActive": false,
        "BranchId": 33,
        "Branch": null,
        "TenantId": 25,
        "Tenant": null,
        "Id": 30515,
        "Active": true,
        "UserId": null,
        "HasErrors": false,
        "ErrorCount": 0,
        "NoErrors": true
      },
      "ModifiedByUser": {
        "ContactId": 0,
        "UserName": "admin@rite.com.bd",
        "Password": null,
        "RoleId": 0,
        "IsConsolidateReport": false,
        "IsHrmUser": false,
        "CreatedDate": "/Date(1678359605383)/",
        "LanguageCode": null,
        "LoginId": 0,
        "PatientStatusId": 0,
        "Coa": null,
        "HrmAccessToken": null,
        "HrmUrl": null,
        "TenantName": null,
        "Contact": {
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
          "IsCompany": null,
          "ServiceProviders": [],
          "ServiceProviderType": 0,
          "Gender": {
            "Name": "Male",
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
          "TenantId": 25,
          "Tenant": null,
          "Id": 102157,
          "Active": true,
          "UserId": 30490,
          "HasErrors": false,
          "ErrorCount": 0,
          "NoErrors": true
        },
        "Role": null,
        "UserTypeId": 0,
        "IsPermittedForeignMission": false,
        "IsOTApproval": false,
        "Expenses": null,
        "PatientServices": null,
        "UserPatientStatusList": [
          {
            "PatientStatusId": 1,
            "UserId": null,
            "IsSelected": false,
            "CreatedDate": null,
            "User": null,
            "PatientStatus": {
              "Name": "VIP",
              "Prefix": "V         ",
              "LanguageCode": null,
              "Id": 1,
              "Active": true,
              "UserId": null,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "TenantId": 0,
            "Tenant": null,
            "Id": 188,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "PatientStatusId": 2,
            "UserId": null,
            "IsSelected": false,
            "CreatedDate": null,
            "User": null,
            "PatientStatus": {
              "Name": "VVIP",
              "Prefix": "VV",
              "LanguageCode": null,
              "Id": 2,
              "Active": true,
              "UserId": null,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "TenantId": 0,
            "Tenant": null,
            "Id": 189,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "PatientStatusId": 3,
            "UserId": null,
            "IsSelected": false,
            "CreatedDate": null,
            "User": null,
            "PatientStatus": {
              "Name": "ForeignMission",
              "Prefix": "F         ",
              "LanguageCode": null,
              "Id": 3,
              "Active": true,
              "UserId": null,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "TenantId": 0,
            "Tenant": null,
            "Id": 190,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          }
        ],
        "ImportTenantId": 0,
        "ImportBranchId": 0,
        "UserItemCategories": [
          {
            "ItemCategoryId": 70676,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11714,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70709,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11715,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70699,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11716,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70694,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11717,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 80842,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11718,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70700,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11719,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 80843,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11720,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70675,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11721,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70695,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11722,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70696,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11723,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70697,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11724,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70698,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11725,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 80844,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11726,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 80845,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11727,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70704,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11728,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70692,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11729,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70677,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11730,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 80846,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11731,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          {
            "ItemCategoryId": 70708,
            "UserId": null,
            "IsSelected": true,
            "CreatedDate": null,
            "User": null,
            "ItemCategory": null,
            "TenantId": 0,
            "Tenant": null,
            "Id": 11732,
            "Active": true,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          }
        ],
        "InActive": false,
        "BranchId": 33,
        "Branch": null,
        "TenantId": 25,
        "Tenant": null,
        "Id": 30515,
        "Active": true,
        "UserId": null,
        "HasErrors": false,
        "ErrorCount": 0,
        "NoErrors": true
      },
      "LabStatus": {
        "Name": "Printed",
        "PatientInvoices": [],
        "LanguageCode": null,
        "Id": 5,
        "Active": true,
        "UserId": null,
        "HasErrors": false,
        "ErrorCount": 0,
        "NoErrors": true
      },
      "InvoiceStatus": null,
      "PatientServices": [
        {
          "PatientID": 776079,
          "ItemId": 300942,
          "InvoiceID": 551367,
          "ReceiptId": null,
          "PatientAdmissionId": null,
          "NurseStationId": null,
          "ServiceListPrice": 120,
          "ServiceActualPrice": 120,
          "ServiceQuantity": 1,
          "ServiceDate": "/Date(1684404030000)/",
          "ReferralPaidDate": null,
          "ModifiedDate": null,
          "CheckoutTime": null,
          "ServiceProviderId": 71199,
          "DoctorId": 71199,
          "DoctorName": "CMH Ghatail OPD",
          "ReturnQantity": null,
          "ReturnPrice": null,
          "ReturnPaid": null,
          "ReferrerPaidUserId": null,
          "ReferrerPaidUser": null,
          "Discount": 0,
          "DiscountAfterInvoice": false,
          "IsBothSideDiscount": true,
          "DiscountPercentage": 0,
          "Refund": false,
          "RefundApprovedBy": null,
          "RefundStatus": null,
          "RefundApproval": false,
          "IsReturn": false,
          "RefundNote": null,
          "Billed": true,
          "ReferralFee": 0,
          "ReferralFeePaid": false,
          "ReferralFeeActual": 0,
          "DeliveryDate": "/Date(1684432800000)/",
          "DeliveryTime": null,
          "ReportFormatName": null,
          "LabStatusId": 5,
          "InventoryId": null,
          "ModifiedBy": 30515,
          "PrescriptionItemId": null,
          "SampleId": 10002409,
          "Sl": "01",
          "IsSpecialItem": true,
          "PackageItemId": null,
          "PackageSeviceId": null,
          "SlideNumber": null,
          "SignApprovedDate": "/Date(1684404315767)/",
          "SignApprovedBy": 50648,
          "IsForeignMission": false,
          "IsBarCodePrint": true,
          "SignApprovedByUser": null,
          "Item": {
            "Name": "Glucose Random (RBS)",
            "GenericName": null,
            "Code": "116",
            "CompanyName": null,
            "ItemTypeId": 32,
            "MedicalTypeId": 62,
            "ItemSpecimentId": 128,
            "ItemCategoryId": 70676,
            "ItemSubCategoryId": null,
            "ItemGroupCategoryId": null,
            "ItemSubGroupCategoryId": null,
            "SupplierOrVendorId": null,
            "Strength": null,
            "Formulation": null,
            "IsAntibiotic": false,
            "MedicineTypeId": null,
            "IsSurgeryItem": false,
            "MeasurementUnitId": null,
            "SalePrice": 120,
            "BuyPrice": 0,
            "ServiceProviderId": null,
            "ReferralAllowed": true,
            "Description": "",
            "DefaultReferrarFee": 0,
            "LabReportGroupId": 137,
            "NurseStationId": null,
            "NurseStation": null,
            "TaskTypeId": 101,
            "TaskType": null,
            "LabCountDay": 1,
            "IsLabReportItem": false,
            "IsActive": true,
            "CreatedDate": "/Date(1678358731363)/",
            "NoEquipment": false,
            "IsCustomTemplate": false,
            "LabItemSerialNo": -1,
            "NoDiscount": false,
            "ShortCode": "GR",
            "IsSlideRequired": false,
            "BedOccupancies": [],
            "Inventories": [],
            "Item_ItemGroup": [],
            "ItemDefaults": [],
            "ItemReorders": [],
            "InitialSetupItems": [],
            "ServiceProviderSurgeryPrices": [],
            "ItemType": null,
            "ItemSpeciment": {
              "Name": "blood",
              "MedicalTypeId": 62,
              "Items": [],
              "MedicalType": null,
              "TenantId": 25,
              "Tenant": null,
              "Id": 128,
              "Active": true,
              "UserId": 30491,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "ItemCategory": {
              "Name": "Biochemistry",
              "MedicalTypeId": 62,
              "ReferralCommission": 40,
              "IsPathology": true,
              "SampleId": 10000000,
              "Items": [],
              "ItemSubCategories": [],
              "MedicalType": null,
              "TenantId": 25,
              "Tenant": null,
              "Id": 70676,
              "Active": true,
              "UserId": 30490,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "ItemSubCategory": null,
            "ItemGroupCategory": null,
            "ItemSubGroupCategory": null,
            "MedicineType": null,
            "MeasurementUnit": null,
            "MedicalType": null,
            "ServiceProvider": null,
            "LabReportGroup": {
              "Name": "Biochemistry",
              "Items": [],
              "BranchId": 0,
              "Branch": null,
              "TenantId": 25,
              "Tenant": null,
              "Id": 137,
              "Active": true,
              "UserId": 30491,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "SupplierOrVendor": null,
            "PackageDetails": [],
            "PatientServices": [],
            "ReceiptPayments": [],
            "InventoryItem": [],
            "ItemRequisition": [],
            "Item_SuplierOrVendors": [],
            "ExpiryDate": "N/A",
            "Inventory": null,
            "Quantity": 0,
            "PrescriptionItemId": null,
            "ParentItemId": 0,
            "ParentCategoryId": 0,
            "IsSpecialItem": false,
            "GroupFormatName": null,
            "BranchId": 0,
            "Branch": null,
            "TenantId": 25,
            "Tenant": null,
            "Id": 300942,
            "Active": true,
            "UserId": 30490,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          "LabStatus": null,
          "Inventory": null,
          "User": null,
          "ModifiedByUser": {
            "ContactId": 0,
            "UserName": "admin@rite.com.bd",
            "Password": null,
            "RoleId": 0,
            "IsConsolidateReport": false,
            "IsHrmUser": false,
            "CreatedDate": "/Date(1678359605383)/",
            "LanguageCode": null,
            "LoginId": 0,
            "PatientStatusId": 0,
            "Coa": null,
            "HrmAccessToken": null,
            "HrmUrl": null,
            "TenantName": null,
            "Contact": {
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
              "IsCompany": null,
              "ServiceProviders": [],
              "ServiceProviderType": 0,
              "Gender": {
                "Name": "Male",
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
              "TenantId": 25,
              "Tenant": null,
              "Id": 102157,
              "Active": true,
              "UserId": 30490,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "Role": null,
            "UserTypeId": 0,
            "IsPermittedForeignMission": false,
            "IsOTApproval": false,
            "Expenses": null,
            "PatientServices": null,
            "UserPatientStatusList": [
              {
                "PatientStatusId": 1,
                "UserId": null,
                "IsSelected": false,
                "CreatedDate": null,
                "User": null,
                "PatientStatus": {
                  "Name": "VIP",
                  "Prefix": "V         ",
                  "LanguageCode": null,
                  "Id": 1,
                  "Active": true,
                  "UserId": null,
                  "HasErrors": false,
                  "ErrorCount": 0,
                  "NoErrors": true
                },
                "TenantId": 0,
                "Tenant": null,
                "Id": 188,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "PatientStatusId": 2,
                "UserId": null,
                "IsSelected": false,
                "CreatedDate": null,
                "User": null,
                "PatientStatus": {
                  "Name": "VVIP",
                  "Prefix": "VV",
                  "LanguageCode": null,
                  "Id": 2,
                  "Active": true,
                  "UserId": null,
                  "HasErrors": false,
                  "ErrorCount": 0,
                  "NoErrors": true
                },
                "TenantId": 0,
                "Tenant": null,
                "Id": 189,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "PatientStatusId": 3,
                "UserId": null,
                "IsSelected": false,
                "CreatedDate": null,
                "User": null,
                "PatientStatus": {
                  "Name": "ForeignMission",
                  "Prefix": "F         ",
                  "LanguageCode": null,
                  "Id": 3,
                  "Active": true,
                  "UserId": null,
                  "HasErrors": false,
                  "ErrorCount": 0,
                  "NoErrors": true
                },
                "TenantId": 0,
                "Tenant": null,
                "Id": 190,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              }
            ],
            "ImportTenantId": 0,
            "ImportBranchId": 0,
            "UserItemCategories": [
              {
                "ItemCategoryId": 70676,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11714,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 70709,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11715,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 70699,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11716,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 70694,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11717,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 80842,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11718,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 70700,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11719,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 80843,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11720,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 70675,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11721,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 70695,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11722,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 70696,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11723,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 70697,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11724,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 70698,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11725,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 80844,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11726,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 80845,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11727,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 70704,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11728,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 70692,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11729,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 70677,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11730,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 80846,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11731,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              {
                "ItemCategoryId": 70708,
                "UserId": null,
                "IsSelected": true,
                "CreatedDate": null,
                "User": null,
                "ItemCategory": null,
                "TenantId": 0,
                "Tenant": null,
                "Id": 11732,
                "Active": true,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              }
            ],
            "InActive": false,
            "BranchId": 33,
            "Branch": null,
            "TenantId": 25,
            "Tenant": null,
            "Id": 30515,
            "Active": true,
            "UserId": null,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          "Patient": {
            "OldId": null,
            "FirstName": "Rizwan",
            "LastName": "",
            "PhoneNumber": "3434",
            "GenderId": 0,
            "BloodGroup": null,
            "BloodGroupId": null,
            "FatherName": null,
            "DOB": "/Date(1683655200000)/",
            "NationalId": "",
            "Occupation": "",
            "Street": "",
            "City": "",
            "Zip": "",
            "Country": null,
            "Email": "",
            "Photo": "null",
            "EmergencyNumber": "",
            "EmergencyContactName": "",
            "EmergencyContactRelation": "",
            "CreatedDate": "/Date(1684121558953)/",
            "ServiceId": "3431",
            "RelationshipId": null,
            "RankId": 179,
            "TradeId": null,
            "ServiceTypeId": null,
            "RankTypeId": null,
            "UnitName": "71 Bde",
            "RankName": "Capt",
            "TradeName": null,
            "UnitId": 0,
            "IsRetired": false,
            "PatientPrefixId": 0,
            "PatientStatusId": null,
            "Sex": null,
            "OldDob": null,
            "Gender": null,
            "PatientPrefix": null,
            "PatientStatus": null,
            "Memberships": [],
            "PatientInvoices": [],
            "PatientServices": [],
            "Payments": [],
            "DoctorAppointments": [],
            "Relationship": null,
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
            "Unit": null,
            "Trade": null,
            "ParentPatient": null,
            "VisitNo": null,
            "PatientInvoiceShadowId": 0,
            "TenantId": 25,
            "Tenant": null,
            "Id": 776079,
            "Active": true,
            "UserId": null,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          "PatientInvoice": null,
          "ServiceProvider": {
            "ContactId": 112169,
            "Title": "",
            "ServiceProviderTypeId": 56,
            "NurseStationId": null,
            "DepartmentId": 532,
            "Degree": "",
            "Speciality": "",
            "Description": "",
            "Code": "1002",
            "AssignedToAllUsers": true,
            "IsInHouse": true,
            "IsReferer": true,
            "Designation": "",
            "HasSigningPermission": false,
            "IsSurgeon": false,
            "JoiningDate": null,
            "CreatedDate": "/Date(1644483532000)/",
            "ReferrerTypeId": 29,
            "Contact": {
              "FirstName": "CMH",
              "LastName": "Ghatail OPD",
              "PhoneNumber": "111",
              "GenderId": 1,
              "Street": "",
              "City": "",
              "Zip": "",
              "Country": "BD",
              "Email": "",
              "Fax": "",
              "WebSite": "null",
              "Photo": "null",
              "IsCompany": null,
              "ServiceProviders": [],
              "ServiceProviderType": 56,
              "Gender": {
                "Name": "Male",
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
              "TenantId": 25,
              "Tenant": null,
              "Id": 112169,
              "Active": true,
              "UserId": 30515,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "Department": {
              "Name": "Medicine",
              "LabCategoryId": null,
              "IsCMH": true,
              "ServiceProviders": [],
              "TenantId": 25,
              "Tenant": {
                "Name": "mobileapp",
                "Url": "mobileapp",
                "BranchName": null,
                "BranchList": null,
                "Id": 25,
                "Active": true,
                "UserId": 10082,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              "Id": 532,
              "Active": true,
              "UserId": 30490,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "ReferrerType": {
              "Name": "None",
              "TenantId": 25,
              "Tenant": null,
              "Id": 29,
              "Active": true,
              "UserId": null,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "Items": [],
            "PatientAdmissions": [],
            "NurseStationInchargeList": [],
            "ServiceProviderType": {
              "Name": "Doctor",
              "ServiceProviders": [],
              "LanguageCode": null,
              "Id": 56,
              "Active": true,
              "UserId": null,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "DepartmentName": null,
            "ReferralFee": 0,
            "BranchId": 33,
            "Branch": {
              "Name": "Main",
              "IsMainBranch": false,
              "TenantId": 25,
              "Tenant": {
                "Name": "mobileapp",
                "Url": "mobileapp",
                "BranchName": null,
                "BranchList": null,
                "Id": 25,
                "Active": true,
                "UserId": 10082,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              "Id": 33,
              "Active": true,
              "UserId": 2,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "TenantId": 25,
            "Tenant": null,
            "Id": 71199,
            "Active": true,
            "UserId": null,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          "PrescriptionItem": null,
          "Doctor": {
            "ContactId": 112169,
            "Title": "",
            "ServiceProviderTypeId": 56,
            "NurseStationId": null,
            "DepartmentId": 532,
            "Degree": "",
            "Speciality": "",
            "Description": "",
            "Code": "1002",
            "AssignedToAllUsers": true,
            "IsInHouse": true,
            "IsReferer": true,
            "Designation": "",
            "HasSigningPermission": false,
            "IsSurgeon": false,
            "JoiningDate": null,
            "CreatedDate": "/Date(1644483532000)/",
            "ReferrerTypeId": 29,
            "Contact": {
              "FirstName": "CMH",
              "LastName": "Ghatail OPD",
              "PhoneNumber": "111",
              "GenderId": 1,
              "Street": "",
              "City": "",
              "Zip": "",
              "Country": "BD",
              "Email": "",
              "Fax": "",
              "WebSite": "null",
              "Photo": "null",
              "IsCompany": null,
              "ServiceProviders": [],
              "ServiceProviderType": 56,
              "Gender": {
                "Name": "Male",
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
              "TenantId": 25,
              "Tenant": null,
              "Id": 112169,
              "Active": true,
              "UserId": 30515,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "Department": {
              "Name": "Medicine",
              "LabCategoryId": null,
              "IsCMH": true,
              "ServiceProviders": [],
              "TenantId": 25,
              "Tenant": {
                "Name": "mobileapp",
                "Url": "mobileapp",
                "BranchName": null,
                "BranchList": null,
                "Id": 25,
                "Active": true,
                "UserId": 10082,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              "Id": 532,
              "Active": true,
              "UserId": 30490,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "ReferrerType": {
              "Name": "None",
              "TenantId": 25,
              "Tenant": null,
              "Id": 29,
              "Active": true,
              "UserId": null,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "Items": [],
            "PatientAdmissions": [],
            "NurseStationInchargeList": [],
            "ServiceProviderType": {
              "Name": "Doctor",
              "ServiceProviders": [],
              "LanguageCode": null,
              "Id": 56,
              "Active": true,
              "UserId": null,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "DepartmentName": null,
            "ReferralFee": 0,
            "BranchId": 33,
            "Branch": {
              "Name": "Main",
              "IsMainBranch": false,
              "TenantId": 25,
              "Tenant": {
                "Name": "mobileapp",
                "Url": "mobileapp",
                "BranchName": null,
                "BranchList": null,
                "Id": 25,
                "Active": true,
                "UserId": 10082,
                "HasErrors": false,
                "ErrorCount": 0,
                "NoErrors": true
              },
              "Id": 33,
              "Active": true,
              "UserId": 2,
              "HasErrors": false,
              "ErrorCount": 0,
              "NoErrors": true
            },
            "TenantId": 25,
            "Tenant": null,
            "Id": 71199,
            "Active": true,
            "UserId": null,
            "HasErrors": false,
            "ErrorCount": 0,
            "NoErrors": true
          },
          "NurseStation": null,
          "ReceiptPayment": null,
          "PatientAdmission": null,
          "ImagingDetails": [],
          "PatientServicePayments": null,
          "SignContactId": 132436,
          "Isgroup": false,
          "PatientServiceIds": null,
          "GroupItemIds": null,
          "MedicalTypeId": 0,
          "BeforeReturnPrice": 0,
          "ReturnBackupPrice": 0,
          "FullReturnServiceListPrice": 0,
          "Amount": 0,
          "MedicalTypeName": null,
          "PreviousDoctorName": null,
          "HasImage": false,
          "BranchId": 33,
          "Branch": null,
          "TenantId": 25,
          "Tenant": null,
          "Id": 933695,
          "Active": true,
          "UserId": 30515,
          "HasErrors": false,
          "ErrorCount": 0,
          "NoErrors": true
        }
      ],
      "Refunds": [],
      "PatientInvoiceShadows": [],
      "Amount": 0,
      "MedicalTypeName": null,
      "IsDueCollection": false,
      "BranchId": 33,
      "Branch": null,
      "TenantId": 25,
      "Tenant": null,
      "Id": 551367,
      "Active": true,
      "UserId": 30515,
      "HasErrors": false,
      "ErrorCount": 0,
      "NoErrors": true
    };

    await _repository.updatePatientServiceMarkAsPrintStatus(data).then((value){
      Utils.snakBar("status", 'status update successfull');
    }).onError((error, stackTrace) {
      Utils.snakBar("Error", error.toString());
      print("error occured : ${error.toString()}");
    });
  }





}