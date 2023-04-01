
import '../../data/network/network_api_services.dart';
import '../../resources/app_url/app_url.dart';

class RegisterPatientRepository{


  final _apiService = NetworkApiServices();

  Future<dynamic> registerPatient(data)async{

    dynamic response = await _apiService.patientRegistration(data, AppUrl.registerPatientApi);
    return response;

  }
}