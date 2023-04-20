
import 'package:get/get.dart';
import 'package:ritecare_hms/model/ot_management_model/ot_list_model.dart';

import '../../data/response/status.dart';
import '../../model/user_profile_model/user_profile_model.dart';
import '../../repository/search_repository/SearchRepository.dart';
import '../../shere_preference/login_preference.dart';

class UserProfileViewModel extends GetxController{


  final _api = SearchRepository();
  LoginPreference loginPreference = LoginPreference();
  var token;


  final rxRequestStatus = Status.LOADING.obs;
  final userProfile = UserProfileModel().obs;
  final otScheduleList = OtScheduleModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserProfile(UserProfileModel _value) => userProfile.value = _value;
  void setOtSchedule(OtScheduleModel _value) => otScheduleList.value = _value;
  void setError(String _value) => error.value = _value;


  /// get user profile view model
  void getUserProfile(){
    _api.getUserProfile().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setUserProfile(value);
      print("value${value}");
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }


/*
  /// get ot schedule
  void getSchedule(){
    print("ot schedul vm");
    _api.getOtSchedule().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setOtSchedule(value);
      print("ot schedul vm${value}");
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("viewModel error ${error.toString()}");
    });
  }
*/


}