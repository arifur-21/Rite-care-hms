
import 'package:ritecare_hms/model/search_model/SearchModel.dart';



abstract class BaseApServices{

  Future<dynamic> getPatientById(String id);
  Future<dynamic> getBloodGroup();
  Future<dynamic> getGender();
  Future<dynamic> getPatientList();


  Future<List<dynamic>> getPatientByCellNo(String id);

  Future<dynamic> postApi(dynamic data, String url);

  Future<dynamic> patientRegistration(dynamic postData, String url);
  Future<dynamic> patientRegistrationUpdate(dynamic postData, String url);

}