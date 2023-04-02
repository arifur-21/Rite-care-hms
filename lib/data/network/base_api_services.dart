
import 'package:ritecare_hms/model/search_model/SearchModel.dart';



abstract class BaseApServices{

  Future<dynamic> getPatientById(String id);

  Future<List<SearchModel>> getPatientByCellNo(String id);

  Future<dynamic> postApi(dynamic data, String url);
  Future<dynamic> patientRegistration(dynamic postData, String url);

}