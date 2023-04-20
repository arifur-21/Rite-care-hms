
import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ritecare_hms/model/search_model/SearchModel.dart';
import 'package:ritecare_hms/resources/app_url/app_url.dart';

import '../../data/network/network_api_services.dart';
import '../../model/lab_test_model/status_model.dart';
import '../../model/ot_management_model/ot_list_model.dart';
import '../../model/user_profile_model/user_profile_model.dart';
import '../../view_model/serch_view_mode/SearchViewModel.dart';


class SearchRepository{

  final _apiServices = NetworkApiServices();
  List<SearchModel> getPatientCellNoApi = [];
  List<SearchModel> response = [];


  Future<SearchModel> getSearch(String id)async{
    dynamic response = await _apiServices.getPatientById(id);
    print("id response ${response}");
    return SearchModel.fromJson(response);
  }

  /// get user profile
  Future<UserProfileModel> getUserProfile()async{
    dynamic response = await _apiServices.getApiData(AppUrl.userProfile);
    print("id response ${response}");
    return UserProfileModel.fromJson(response);
  }

  /// get ot schdule
   Future<OtScheduleModel> getOtSchedule(dynamic startDate, dynamic endDate)async{
    dynamic response = await _apiServices.getApiData("https://mobileapp.rite-hms.com/OT/GetOperationScheduleList?pageNumber=1&pageSize=150&startDate=2023-04-12&endDate=2023-04-18&patientId=0&isMobileApp=true");
    return OtScheduleModel.fromJson(response);
  }


  List<SearchModel> searchData =[];
  Future<List<SearchModel>> getPatientByOccicialNo(String id)async{

    dynamic response = await _apiServices.getPatientByOfficialNo(id);
    print("responsesf111 ${response.toString()}");

    searchData.clear();
    for(Map i in response){
      SearchModel data =  SearchModel.fromJson(i);
      searchData.add(data);

    }

    return searchData;

  }

  List<SearchModel> searchDataOfficial =[];
  Future<List<SearchModel>> getPateintByCellNO(String id)async{

    dynamic response = await _apiServices.getPatientByCellNo(id);
    print("responses repository ${response.toString()}");

    searchDataOfficial.clear();
    for(Map i in response){
      SearchModel data =  SearchModel.fromJson(i);
      searchDataOfficial.add(data);
    }
    return searchDataOfficial;
  }


  List<SearchModel> searchDataByName =[];
  Future<List<SearchModel>> getPateintByName(String id)async{

    dynamic response = await _apiServices.getPatientByName(id);
    print("responsesf111 ${response.toString()}");

    searchDataOfficial.clear();
    for(Map i in response){
      SearchModel data =  SearchModel.fromJson(i);
      searchDataOfficial.add(data);
    }
    return searchDataOfficial;
  }


/// get sample test status repo
  List<StatusListModel> statusList =[];
  Future<List<StatusListModel>> getSampleTestStatus()async{

    dynamic response = await _apiServices.getSimpleTestStatus();
    print("response sample status repo ${response.toString()}");

    statusList.clear();
    for(Map i in response){
      StatusListModel data =  StatusListModel.fromJson(i);
      statusList.add(data);

    }

    return statusList;

  }







}