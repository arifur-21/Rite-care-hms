
import 'package:ritecare_hms/model/search_model/SearchModel.dart';



abstract class BaseApServices{

  //// search api
  Future<dynamic> getPatientById(String id);
  Future<List<dynamic>> getPatientByCellNo(String id);
  Future<List<dynamic>> getPatientByOfficialNo(String id);
  Future<List<dynamic>> getPatientByName(String id);
  Future<List<dynamic>> getSimpleTestStatus();

  //user profile
  Future<dynamic> getUserProfile();

  Future<dynamic> getBloodGroup();
  Future<dynamic> getGender();

  ////post api
  Future<dynamic> postApi(dynamic data, String url);
  Future<dynamic> patientRegistration(dynamic postData, String url);
  Future<dynamic> patientRegistrationUpdate(dynamic postData, String url);

}