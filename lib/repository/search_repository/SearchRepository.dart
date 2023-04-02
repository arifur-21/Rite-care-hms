
import 'dart:math';

import 'package:ritecare_hms/model/search_model/SearchModel.dart';
import 'package:ritecare_hms/resources/app_url/app_url.dart';

import '../../data/network/network_api_services.dart';


class SearchRepository{

  final _apiServices = NetworkApiServices();
  List<SearchModel> getPatientCellNoApi = [];
  List<SearchModel> response = [];

  Future<SearchModel> getSearch(String id)async{
    dynamic response = await _apiServices.getPatientById(id);
    return SearchModel.fromJson(response);
  }

  List<SearchModel> searchData =[];
  Future<List<SearchModel>> getPateintCell(String id)async{
    dynamic response = await _apiServices.getPatientByCellNo(id);
    print("responsesf111 ${response.toString()}");
    for(Map i in response){
      print(i['FirstName']);
    searchData =  SearchModel.fromJson(i) as List<SearchModel> ;
    }

    return searchData;
    ///response.map((e) => SearchModel.fromJson(e)).toList();
  }




}