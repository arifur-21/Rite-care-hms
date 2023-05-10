import 'package:ritecare_hms/resources/app_url/app_url.dart';

import '../data/network/network_api_services.dart';
import '../model/lab_test_model/lab_test_list_model.dart';
import '../model/lab_test_model/lab_test_list_status_model.dart';
import '../model/lab_test_model/simple_list_models.dart';
import '../model/lab_test_model/status_model.dart';
import '../model/ot_management_model/ot_list_model.dart';
import '../model/ot_mangement_model/surgery_note_model.dart';
import '../model/register/blood_group_model/BloodGroupModel.dart';
import '../model/register/gender_model.dart';

class Repository{

  final _apiServices = NetworkApiServices();

  ////////////////// post api start ////////////
  Future<dynamic> loginApi(var data)async{
    dynamic response = await _apiServices.postLoginApi(data, AppUrl.loginApi);
    return response;

  }

  Future<dynamic> registerPatient(data)async{
    dynamic response = await _apiServices.postApiData(data, AppUrl.registerPatientApi);
    return response;
  }
  Future<dynamic> registrationUpdate(data)async{
    dynamic response = await _apiServices.postApiData(data, AppUrl.registerUpdateApi);
    return response;
  }
  /// post surgery note
  Future<dynamic> postSurgeryNote(var data)async{
    dynamic response = await _apiServices.postApiData(data, AppUrl.surgeryNoteUrl);
    return response;
  }

  /// post operation schedule status
  Future<dynamic> postOperationScheduleStatus(var data)async{
    dynamic response = await _apiServices.postApiData(data, AppUrl.operationScheduleStatusUrl);
    return response;
  }

  /// edit surgery note
  Future<dynamic> editSurgeryNote(var data)async{
    dynamic response = await _apiServices.postApiData(data, AppUrl.surgeryNoteUrl);
    return response;
  }

  ///  surgery note delete
  Future<dynamic> surgeryNoteDelete(data)async{
    dynamic response = await _apiServices.postApiData(data, AppUrl.surgeryNoteDeleteUrl);
    return response;
  }

  // post api  end //

  //////get object list data start /////////

  Future<BloodGroupModel> getBloodGroup()async{
    dynamic response = await _apiServices.getApiData(AppUrl.getBloodGroutUrl);
    return BloodGroupModel.fromJson(response);
  }

  Future<GenderModel> getGender()async{
    dynamic response = await _apiServices.getApiData(AppUrl.getGenderUrl);
    return GenderModel.fromJson(response);
  }
  /// get ot schdule
  Future<OtScheduleModel> getOtSchedule(dynamic startDate, dynamic endDate)async{
    dynamic response = await _apiServices.getApiData("https://mobileapp.rite-hms.com/OT/GetOperationScheduleList?pageNumber=1&pageSize=150&startDate=${startDate}&endDate=${endDate}&patientId=0&isMobileApp=true");
    return OtScheduleModel.fromJson(response);
  }

  //get lab test list data
  Future<LabTestListModel> getLabTestListApi(dynamic labStatus)async{
    dynamic response = await _apiServices.getApiData('https://mobileapp.rite-hms.com/Item/GetLabItemsByMedicalType?medicalTypeID=62&pageNumber=1&pageSize=25&categoryId=${labStatus}&searchTerm=&allData=undefined&ItemId=0&isLabItemSerialNo=false');
    return LabTestListModel.fromJson(response);
  }


  //get object list data end //


  ////////// get list of data start ///////////////



  //get surgery note data
   List<SurgeryNoteModel> getSurgeryNoteData = [];
  Future<List<SurgeryNoteModel>> getSurgeryNote(dynamic id)async{

    dynamic response = await _apiServices.getListOfApiData('https://mobileapp.rite-hms.com/OT/GetSurgeryNotes?surgeryId=${id}');
       getSurgeryNoteData.clear();
    for(Map i in response){
      SurgeryNoteModel data =  SurgeryNoteModel.fromJson(i);
      getSurgeryNoteData.add(data);
    }
    return getSurgeryNoteData;
  }

  //get sample list filter status
  List<StatusListModel> getSampleStatus = [];
  Future<List<StatusListModel>> getSampleListFilterStatusData()async{
    dynamic response = await _apiServices.getListOfApiData(AppUrl.sampleListFilterStatusUrl);
    getSampleStatus.clear();
    for(Map i in response){
      StatusListModel data =  StatusListModel.fromJson(i);
      getSampleStatus.add(data);
    }
    return getSampleStatus;
  }

  //get lab test list filter status
  List<LabTestListStatusModel> getLabTestStatus = [];
  Future<List<LabTestListStatusModel>> getLabTestListFilterStatusData()async{
    dynamic response = await _apiServices.getListOfApiData(AppUrl.labTestListFilterStatusUrl);
    getLabTestStatus.clear();
    for(Map i in response){
      LabTestListStatusModel data =  LabTestListStatusModel.fromJson(i);
      getLabTestStatus.add(data);
    }
    return getLabTestStatus;
  }


////////// get list of data end ///////////////

}