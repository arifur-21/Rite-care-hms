
import 'package:get/get.dart';

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
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserProfile(UserProfileModel _value) => userProfile.value = _value;
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

}