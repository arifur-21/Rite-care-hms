
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ritecare_hms/screens/login_screen/sign_in_screen.dart';
import 'package:ritecare_hms/utils/color_styles.dart';
import 'package:ritecare_hms/widgets/rounded_button.dart';

import '../../widgets/rite_image_container_widget.dart';
import 'send_email_screen.dart';

class StartedScreen extends StatelessWidget {
  const StartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.primaryColor,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Expanded(
            child: Container(
              width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: ColorStyles.primaryColor,
            ),
            child:  Column(
              children: [
                SizedBox(height: 25,),
                Expanded(

                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                      color: Color(0xFFEFEFEF),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 400,),
                        
                       RoundedButton(title: "Get Started", color: ColorStyles.textGreen,
                           onTap: (){
                             Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SendEmailScreen()));
                       })

                      ],
                    ),
                  ),
                ),

              ],
            )
      ),
          )
        ],
      ),
    );
  }
}
