import 'package:flutter/material.dart';
import 'package:ritecare_hms/screens/home_screen.dart';
import 'package:ritecare_hms/widgets/reuseable_text_filed.dart';
import 'package:ritecare_hms/widgets/rounded_button.dart';

import '../../utils/color_styles.dart';
import '../../utils/screen_main_padding.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/circular_profile_image_widget.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/popup_button_widget.dart';
import '../user_profile_screen/components/profile_image_container_widget.dart';
import '../../widgets/reuseable_header_container_widget.dart';
import 'full_form_register_screen.dart';

class ShortForm extends StatefulWidget {
  const ShortForm({super.key});

  @override
  State<ShortForm> createState() => _ShortFormState();
}

class _ShortFormState extends State<ShortForm> {
  TextEditingController serviceTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawer: Drawer(

          child:DrawerWidget(),
        ),

        appBar: AppBar(
          backgroundColor: ColorStyles.primaryColor,
          actions: [
            AppBarWidget(),

            ///popup menu item
            PopUpButtonWidget()

          ],
        ),

        body: Stack(
          children: [
            SingleChildScrollView(

              child: Padding(
                padding: EdgeInsets.all(ScreenMainPadding.screenPadding),
                child: Column(
                  children: [

                    ReuseableHeaderContainerWidget(
                      titleText: '',
                      leadingText: 'Patient Registration',
                      tralingIcon: "assets/icons/cancel.png",
                      onTap: (){
                        /////////route
                      },

                    ),

                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RoundedButton(
                          title: 'Full Form',
                          color: Colors.greenAccent,
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FullForm()));
                          },
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 15,
                    ),

                     ResuableTextField(
                         controllerValue: serviceTypeController,
                         hintText: "Service Type"),

                    SizedBox(
                      height: 15,
                    ),
                    ResuableTextField(
                        controllerValue: serviceTypeController,
                        hintText: "Patient Prefix"),

                    SizedBox(
                      height: 15,
                    ),
                    ResuableTextField(
                        controllerValue: serviceTypeController,
                        hintText: "Patient Status"),

                    SizedBox(
                      height: 15,
                    ),
                    ResuableTextField(
                        controllerValue: serviceTypeController,
                        hintText: "Full Name"),
                    SizedBox(
                      height: 15,
                    ),
                    ResuableTextField(
                        controllerValue: serviceTypeController,
                        hintText: "Patient Gender"),

                    SizedBox(
                      height: 15,
                    ),
                    ResuableTextField(
                        controllerValue: serviceTypeController,
                        hintText: "Blood Type"),
                    SizedBox(
                      height: 15,
                    ),
                    ResuableTextField(
                        controllerValue: serviceTypeController,
                        hintText: "Phone Number"),
                    SizedBox(
                      height: 15,
                    ),
                    ResuableTextField(
                        controllerValue: serviceTypeController,
                        hintText: "Zpi Code"),

                    SizedBox(
                      height: 15,
                    ),
                    ResuableTextField(
                        controllerValue: serviceTypeController,
                        hintText: "Date Of Birth"),

                    SizedBox(
                      height: 30,
                    ),



                    SizedBox(height: 20,),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                      width: 150,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: ColorStyles.primaryColor,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage('assets/icons/scan.png')
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text("Take Image", style: TextStyle(fontSize: 16, color: Colors.white),)
                                        ],
                                      )
                                  )
                                ],
                              ),

                              Column(
                                children: [
                                  Container(
                                      width: 150,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: ColorStyles.primaryColor,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage('assets/icons/file.png')
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text("Upload", style: TextStyle(fontSize: 16,color: Colors.white),)
                                        ],
                                      )
                                  )
                                ],
                              ),
                            ],
                          ),

                          SizedBox(height: 20,),
                          CircularProfileImageWidget(),
                          SizedBox(height: 20,),
                          RoundedButton(
                              title: "Register",
                              color: ColorStyles.primaryColor,
                              onTap:(){

                              })
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}