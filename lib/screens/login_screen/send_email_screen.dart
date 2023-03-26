
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/screens/login_screen/sign_in_screen.dart';
import 'package:ritecare_hms/screens/login_screen/widgets/resueable_text_editable_widget.dart';
import 'package:ritecare_hms/utils/color_styles.dart';
import 'package:ritecare_hms/utils/screen_main_padding.dart';
import 'package:ritecare_hms/widgets/rounded_button.dart';

import '../../widgets/rite_image_container_widget.dart';
import '../languages/Widgets/language_toggle_btn_widget.dart';


class SendEmailScreen extends StatefulWidget {
  const SendEmailScreen({Key? key}) : super(key: key);

  @override
  State<SendEmailScreen> createState() => _SendEmailScreenState();
}

class _SendEmailScreenState extends State<SendEmailScreen> {

  TextEditingController sendEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.primaryColor,
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding:  EdgeInsets.all(ScreenMainPadding.screenPadding),
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
                      Text("app_conf".tr, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: ColorStyles.textGreen),),
                      LanguageToggleBtnWidget()
                    ],),
                    SizedBox(height: 30,),
                    Text("continue".tr, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey),),

            SizedBox(height: 20,),
                    ResueableEmailTextFieldWidget(
                      emailController: sendEmailController,
                      hintText: "Mobileapp.rite-hms.com*",
                    ),


                  ],
                ),

                SizedBox(height: 30,),
                RoundedButton(
                    title: "submit_btn".tr,
                    color: ColorStyles.textGreen,
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignInScreen()));
                    }),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: ColorStyles.primaryColor
                        ),
                        child: Icon(Icons.question_mark_outlined,color: Colors.white,size: 20,),
                    ),
                    SizedBox(width: 10,),
                    Text("needs_help".tr, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: ColorStyles.textGreen),),

                  ],
                )


              ],
            ),
          ),
        ),
      )
    );
  }

/*  Container(
  width: double.infinity,
  height: 200,
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(30),
  color: Colors.green,
  ),
  child:  Column(
  children: [
  SizedBox(height: 25,),
  Container(
  width: double.infinity,
  height: 175,
  decoration: BoxDecoration(
  borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
  color: Color(0xFFEFEFEF),
  ),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  SizedBox(height: 20,),
  Container(
  height: 100,
  width: 200,
  decoration: BoxDecoration(
  image: DecorationImage(
  fit: BoxFit.cover,
  image: AssetImage('assets/icons/rite.png')
  ),
  ),
  ),
  ],
  ),
  ),

  ],
  )
  ),*/
}
