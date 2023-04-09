
import '../../data/network/network_api_services.dart';
import '../../model/blood_group_model/BloodGroupModel.dart';
import '../../model/register/gender_model.dart';
import '../../resources/app_url/app_url.dart';

class RegisterPatientRepository{


  final _apiService = NetworkApiServices();

  Future<dynamic> registerPatient(data)async{
    dynamic response = await _apiService.patientRegistration(data, AppUrl.registerPatientApi);
    return response;

  }

  Future<dynamic> registrationUpdate(data)async{
    dynamic response = await _apiService.patientRegistrationUpdate(data, AppUrl.registerUpdateApi);
    return response;

  }

  Future<BloodGroupModel> getBloodGroup()async{
    dynamic response = await _apiService.getBloodGroup();
    print("id response ${response}");
    return BloodGroupModel.fromJson(response);
  }


  Future<GenderModel> getGender()async{
    dynamic response = await _apiService.getGender();
    print("id response ${response}");
    return GenderModel.fromJson(response);
  }


}