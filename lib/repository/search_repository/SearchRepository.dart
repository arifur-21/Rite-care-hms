
import 'package:ritecare_hms/model/search_model/SearchModel.dart';
import 'package:ritecare_hms/resources/app_url/app_url.dart';

import '../../data/network/network_api_services.dart';

class SearchRepository{

  final _apiServices = NetworkApiServices();

  Future<SearchModel> getSearch(String id)async{
    dynamic response = await _apiServices.getPatientById(id);
    return SearchModel.fromJson(response);
  }

  Future<SearchModel> getPatientDataByCellNO(String cellNO)async{
    dynamic response = await _apiServices.getPatientByCellNo(cellNO);
    print('repository data111 $response');

    return SearchModel.fromJson(response);
  }


}