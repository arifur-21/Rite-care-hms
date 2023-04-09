
import '../../data/network/network_api_services.dart';
import '../../model/patinet_list_model/patient_list_model.dart';

class PatientListRepository{
  final _apiService = NetworkApiServices();

  Future<PatientListModel> getPatientList()async{
    dynamic response = await _apiService.getPatientList();
    print("id response ${response}");
    return PatientListModel.fromJson(response);
  }
}