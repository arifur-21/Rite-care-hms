
abstract class BaseApServices{

  Future<dynamic> getPatientById(String id);
  Future<dynamic> getPatientByCellNo(String cellNO);

  Future<dynamic> postApi(dynamic data, String url);
  Future<dynamic> patientRegistration(dynamic postData, String url);

}