
import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ritecare_hms/model/lab_test_model/summery_model.dart';
import 'package:ritecare_hms/model/search_model/SearchModel.dart';
import 'package:ritecare_hms/resources/app_url/app_url.dart';

import '../../data/network/network_api_services.dart';
import '../../model/lab_test_model/lab_test_list_model.dart';
import '../../model/lab_test_model/simple_list_models.dart';
import '../../model/lab_test_model/status_model.dart';
import '../../model/ot_management_model/ot_list_model.dart';
import '../../model/patinet_list_model/patient_list_model.dart';
import '../../model/user_profile_model/user_profile_model.dart';
import '../../view_model/serch_view_mode/SearchViewModel.dart';


class SearchRepository{

  final _apiServices = NetworkApiServices();
  List<SearchModel> getPatientCellNoApi = [];
  List<SearchModel> response = [];


  Future<SearchModel> getSearch(String id)async{
    dynamic response = await _apiServices.getPatientById(id);
    return SearchModel.fromJson(response);
  }



  /// get user profile
  Future<UserProfileModel> getUserProfile()async{
    dynamic response = await _apiServices.getApiData(AppUrl.userProfile);
    return UserProfileModel.fromJson(response);
  }


  //get sample list data
  Future<SampleTest> getSampleListData(startDate, endDate,statusId)async{
    dynamic response = await _apiServices.getApiData('https://mobileapp.rite-hms.com/Item/GetInvoiceSampleIDByMedicalType?id=775925&statusid=${statusId}&medicalTypeID=62&DateStart=${startDate}&DateEnd=${endDate}&pageNumber=1&pageSize=25&invoiceId=undefined&sampleId=null');
    return SampleTest.fromJson(response);
  }

  //get summery list data
  Future<SummeryModel> getSummeryListData(startDate, endDate,statusId)async{
    dynamic response = await _apiServices.getApiData('https://mobileapp.rite-hms.com/Item/GetPatientInvoicebyMedicalType?id=0&statusid=$statusId&medicalTypeID=62&DateStart=${startDate}&DateEnd=${endDate}&pageNumber=1&pageSize=25&invoiceId=undefined&sampleId=null&itemId=undefined');
    return SummeryModel.fromJson(response);
  }

  /// get patient list
  Future<PatientListModel> getPatientList()async{
    dynamic response = await _apiServices.getApiData(AppUrl.patientListUrl);
    return PatientListModel.fromJson(response);
  }



  List<SearchModel> searchData =[];
  Future<List<SearchModel>> getPatientByOccicialNo(String id)async{
    dynamic response = await _apiServices.getListOfApiData('https://mobileapp.rite-hms.com/Patient/GetPatientByServiceId?serviceNumber=${id}&oldData=false');

    searchData.clear();
    for(Map i in response){
      SearchModel data =  SearchModel.fromJson(i);
      searchData.add(data);
    }
    return searchData;
  }

  List<SearchModel> searchDataOfficial =[];
  Future<List<SearchModel>> getPateintByCellNO(String id)async{

    dynamic response = await _apiServices.getListOfApiData('https://mobileapp.rite-hms.com/Patient/GetPatientByPhone?phoneNumber=${id}');
    searchDataOfficial.clear();
    for(Map i in response){
      SearchModel data =  SearchModel.fromJson(i);
      searchDataOfficial.add(data);
    }
    return searchDataOfficial;
  }


  List<SearchModel> searchDataByName =[];
  Future<List<SearchModel>> getPateintByName(String id)async{

    dynamic response = await _apiServices.getListOfApiData('https://mobileapp.rite-hms.com/Patient/SearchPatientByPartialName?name=${id}&partialFullSearch=true');
    searchDataOfficial.clear();
    for(Map i in response){
      SearchModel data =  SearchModel.fromJson(i);
      searchDataOfficial.add(data);
    }
    return searchDataOfficial;
  }

}