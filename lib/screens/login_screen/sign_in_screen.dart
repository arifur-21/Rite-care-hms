

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/screens/home_screen.dart';
import 'package:ritecare_hms/screens/languages/Widgets/language_toggle_btn_widget.dart';
import 'package:ritecare_hms/screens/login_screen/widgets/resueable_text_editable_widget.dart';
import 'package:ritecare_hms/screens/login_screen/widgets/resueable_text_field_password_widget.dart';
import 'package:ritecare_hms/utils/color_styles.dart';
import 'package:ritecare_hms/utils/screen_main_padding.dart';
import 'package:ritecare_hms/widgets/rounded_button.dart';

import '../../utils/app_layout.dart';
import '../../widgets/rite_image_container_widget.dart';
import 'forgot_password_screen.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  bool isClick = true;

  @override
  void initState() {
    setState(() {
      isClick = !isClick;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final size = AppLayout.getSize(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorStyles.primaryColor,
        ),

        body: Container(
          child: Padding(
            padding:  EdgeInsets.all(ScreenMainPadding.screenPadding),
            child: SingleChildScrollView(
              child: Column(

                children: [
                  RiteImageContainerWidet(),
                  SizedBox(height: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("app_conf".tr, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: ColorStyles.textGreen),),
                          LanguageToggleBtnWidget()
                        ],
                      ),
                      SizedBox(height: 30,),
                      Text("continue".tr, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey),),

                      SizedBox(height: 20,),

                      ResueableTextEditableWidget(
                          lableText: "Email",
                          controllerText: emailController,
                          prefixIcon: Icons.email_outlined,
                        keybordType: TextInputType.emailAddress,),
                      SizedBox(height: 20,),

                      ResueableTextFieldPasswordWidget(
                        lableText: 'Password',
                        controllerText: passwordController,
                        prefixIcon: Icons.lock_outline,
                        keybordType: TextInputType.text,)

                    ],
                  ),

                  SizedBox(height: 20,),
                  RoundedButton(
                      title: "submit_btn".tr,
                      color: ColorStyles.textGreen,
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
                      },),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock, size: 30, color: ColorStyles.primaryColor,),
                      SizedBox(width: 10,),
              InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ForgotPasswordScreen()));
                  },
                  child: Text("forgot_pass".tr, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: ColorStyles.textGreen),)),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: ColorStyles.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text("success_text".tr, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)),
                    ),
                  )


                ],
              ),
            ),
          ),
        )
    );
  }

}
