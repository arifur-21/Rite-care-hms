
import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ritecare_hms/model/search_model/SearchModel.dart';
import 'package:ritecare_hms/resources/app_url/app_url.dart';

import '../../data/network/network_api_services.dart';
import '../../model/blood_group_model/BloodGroupModel.dart';
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

  List<SearchModel> searchData =[];
  Future<List<SearchModel>> getPateintCell(String id)async{

    dynamic response = await _apiServices.getPatientByCellNo(id);
    print("responsesf111 ${response.toString()}");

    for(Map i in response){
      print("cell data ${i}");
      SearchModel data =  SearchModel.fromJson(i);
      searchData.add(data);

    }

    return searchData;
    ///response.map((e) => SearchModel.fromJson(e)).toList();
  }

}