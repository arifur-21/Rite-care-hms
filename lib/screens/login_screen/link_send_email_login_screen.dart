
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/utils/screen_main_padding.dart';
import 'package:ritecare_hms/widgets/rite_image_container_widget.dart';
import 'package:ritecare_hms/widgets/rounded_button.dart';

import '../../utils/color_styles.dart';
import '../languages/Widgets/language_toggle_btn_widget.dart';

class LinkSendEnailLoginScreen extends StatefulWidget {
  const LinkSendEnailLoginScreen({Key? key}) : super(key: key);

  @override
  State<LinkSendEnailLoginScreen> createState() => _LinkSendEnailLoginScreenState();
}

class _LinkSendEnailLoginScreenState extends State<LinkSendEnailLoginScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.primaryColor,
      ),
      body: Column(
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
                    LanguageToggleBtnWidget()

                  ],
                ),
                SizedBox(height: 100,),
                 Text("send_link".tr, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: ColorStyles.textGreen),),


                SizedBox(height: 20,),


                RoundedButton(title: "log_in".tr, color: ColorStyles.textGreen, onTap: (){}),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
