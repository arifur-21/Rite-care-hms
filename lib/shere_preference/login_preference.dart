
import 'package:get/get.dart';
import 'package:ritecare_hms/model/login_model/login_token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPreference {

  Future<bool> saveToken(LoginTokenModel responseModel) async{

    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('access_token', responseModel.accessToken.toString());


    return true;
  }

  Future<LoginTokenModel> getToken() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token =  sp.getString('access_token');

    return LoginTokenModel(
        accessToken: token,
       //
    );
  }

  Future<bool> removeLoginToken() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}