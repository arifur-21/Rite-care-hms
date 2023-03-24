
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/screens/login_screen/sign_in_screen.dart';
import 'package:ritecare_hms/screens/login_screen/widgets/resueable_text_editable_widget.dart';
import 'package:ritecare_hms/utils/screen_main_padding.dart';
import 'package:ritecare_hms/widgets/rite_image_container_widget.dart';
import 'package:ritecare_hms/widgets/rounded_button.dart';

import '../../utils/color_styles.dart';
import '../languages/Widgets/language_toggle_btn_widget.dart';
import 'link_send_email_login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController sendEmailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(

        backgroundColor: ColorStyles.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(ScreenMainPadding.screenPadding),
              child: Column(
              children: [
              RiteImageContainerWidet(),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("forgot_pass".tr, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorStyles.textGreen),),
                    LanguageToggleBtnWidget(),
                  ],
                ),
                SizedBox(height: 50,),
                Text("pass_reset".tr, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: ColorStyles.textGreen),),
                SizedBox(height: 20,),


                ResueableTextEditableWidget(
                    lableText: "Email",
                    controllerText: sendEmailController,
                    prefixIcon: Icons.email_outlined,
                    keybordType: TextInputType.emailAddress),

                SizedBox(height: 30,),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  RoundedButton(title: "back_btn".tr, color: ColorStyles.textGreen, onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignInScreen()));
                  }),
                  RoundedButton(title: "submit_btn".tr, color: ColorStyles.textGreen, onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LinkSendEnailLoginScreen()));

                  }),
                ],)

        ],
    ),
            )
          ],
        ),
      ),
    );
  }
}
