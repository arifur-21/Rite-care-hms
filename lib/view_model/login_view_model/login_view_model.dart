
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ritecare_hms/model/login_model/login_token_model.dart';
import 'package:ritecare_hms/screens/home_screen.dart';
import 'package:ritecare_hms/shere_preference/login_preference.dart';
import '../../repository/repository.dart';
import '../../resources/routes/routes.dart';
import '../../utils/utils.dart';

class LoginViewModel extends GetxController{

  final _api = Repository();

  LoginPreference loginPreference = LoginPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;



  void loginApi(){
    loading.value = true;
    Map data ={
      'grant_type' : 'password',
      'scope' : 'all',
      'username' : emailController.value.text,
      'password' : passwordController.value.text,

    };

    _api.loginApi(data).then((value){
      loading.value = false;
      print("access token login ${value}");

      LoginTokenModel loginTokenModel = LoginTokenModel(
        accessToken: value['access_token'],
        refreshToken: value['refresh_token'],
        expiresIn: value['expires_in'],
        tokenType: value['token_type']
      );

      loginPreference.saveToken(loginTokenModel).then((value){
        Get.toNamed(RoutesName.homeScreen);

      }).onError((error, stackTrace){

      });
      Utils.snakBar("Login", 'Login successfully');
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snakBar("Error", error.toString());
    });

  }


}