
import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ritecare_hms/screens/login_screen/sign_in_screen.dart';
import 'package:ritecare_hms/screens/login_screen/slider_screen/slider_screen.dart';


import 'package:ritecare_hms/shere_preference/login_preference.dart';

import '../screens/home_screen.dart';

class SplashServices{

  LoginPreference userPreference = LoginPreference();

  void isLogin(){
    userPreference.getToken().then((value){


      if(value.accessToken!.isEmpty || value.accessToken.toString() == 'null') {
        Get.to(SignInScreen());
      }else{
        Get.to(HomeScreen());
      }

      /*if(value.isLogin == false || value.isLogin.toString() == 'null'){
        //Timer(const Duration(seconds: 3), ()=> Get.toNamed(RoutesName.loginView));
        Get.to(SliderScreen());

      }else{
       // Timer(const Duration(seconds: 3), ()=> Get.toNamed(RoutesName.homeScreen));
        Get.to(HomeScreen());

      }*/
    });

  }
}