
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ritecare_hms/model/login_model/login_token_model.dart';
import 'package:ritecare_hms/screens/home_screen.dart';
import 'package:ritecare_hms/shere_preference/login_preference.dart';

import '../../repository/login_repository/login_repository.dart';
import '../../utils/utils.dart';

class LoginViewModel extends GetxController{

  final _api = LoginRepository();

  LoginPreference loginPreference = LoginPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
 Object apiError = ''.obs;


  void loginApi(){
    loading.value = true;

    Map data ={
      'username' : emailController.value.text,
      'password' : passwordController.value.text,
      'grant_type' : 'password'
    };

    _api.loginApi(data).then((value){
      loading.value = false;

      LoginTokenModel loginTokenModel = LoginTokenModel(
        accessToken: value['access_token'],
      );

      loginPreference.saveToken(loginTokenModel).then((value){

        print("lovin  view model ${loginTokenModel.accessToken}");

       Get.to(HomeScreen());
        ////route

      }).onError((error, stackTrace){

      });
      Utils.snakBar("Login", 'Login successfully');
    }).onError((error, stackTrace) {
      apiError = error!;
      loading.value = false;
      Utils.snakBar("Error", error.toString());
    });

  }


}