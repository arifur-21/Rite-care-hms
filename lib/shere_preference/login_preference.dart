
import 'package:get/get.dart';
import 'package:ritecare_hms/model/login_model/login_token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPreference {

  Future<bool> saveToken(LoginTokenModel responseModel) async{

    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('access_token', responseModel.accessToken.toString());
    sp.setString('refresh_token', responseModel.refreshToken.toString());
  //  sp.setString('expires_in', responseModel.expiresIn.toString());


    return true;
  }

  Future<LoginTokenModel> getToken() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token =  sp.getString('access_token');
    String? refreshToken =  sp.getString('refresh_token');
    dynamic? expiresToken =  sp.getString('expires_in');

    return LoginTokenModel(
        accessToken: token,
       refreshToken: refreshToken,
        //expiresIn: expiresToken

    );
  }

  Future<bool> removeLoginToken() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}