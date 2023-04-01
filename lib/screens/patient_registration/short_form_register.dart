import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/screens/home_screen.dart';
import 'package:ritecare_hms/widgets/reuseable_text_filed.dart';
import 'package:ritecare_hms/widgets/rounded_button.dart';

import '../../utils/color_styles.dart';
import '../../utils/screen_main_padding.dart';
import '../../view_model/patient_register_view_model/patient_register_view_model.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/circular_profile_image_widget.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/popup_button_widget.dart';
import '../user_profile_screen/components/profile_image_container_widget.dart';
import '../../widgets/reuseable_header_container_widget.dart';
import 'full_form_register_screen.dart';

class RegistrShortForm extends StatefulWidget {
  const RegistrShortForm({super.key});

  @override
  State<RegistrShortForm> createState() => _RegistrShortFormState();
}

class _RegistrShortFormState extends State<RegistrShortForm> {

  final registerVM = Get.put(PatientRegisterViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawer: Drawer(

          child:DrawerWidget(),
        ),

        appBar: AppBar(
          backgroundColor: Styles.primaryColor,
          actions: [
            AppBarWidget(),
          ],
        ),

        body: Stack(
          children: [
            SingleChildScrollView(

              child: Padding(
                padding: EdgeInsets.all(ScreenMainPadding.screenPadding),
                child: Column(
                  children: [
                    SizedBox(height: 10,),

                    ReuseableHeaderContainerWidget(
                      titleText: '',
                      leadingText: 'Patient Registration',
                      tralingIcon: "assets/icons/cancel.png",
                      onTap: (){
                        Get.back();
                      },

                    ),

                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RoundedButton(
                          width: Get.width * 0.4,
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
                      height: 20,
                    ),

                     ResuableTextField(
                         controllerValue: registerVM.serviceTypeController.value,
                         hintText: "Service Type"),

                    SizedBox(
                      height: 15,
                    ),
                    ResuableTextField(
                        controllerValue: registerVM.patientPrefixController.value,
                        hintText: "Patient Prefix"),

                    SizedBox(
                      height: 15,
                    ),
                    ResuableTextField(
                        controllerValue: registerVM.patientStatusController.value,
                        hintText: "Patient Status"),

                    SizedBox(
                      height: 15,
                    ),
                    ResuableTextField(
                        controllerValue: registerVM.fullNameController.value,
                        hintText: "Full Name"),
                    SizedBox(
                      height: 15,
                    ),
                    ResuableTextField(
                        controllerValue: registerVM.genderController.value,
                        hintText: "Patient Gender"),

                    SizedBox(
                      height: 15,
                    ),
                    ResuableTextField(
                        controllerValue: registerVM.bloodTypeController.value,
                        hintText: "Blood Type"),
                    SizedBox(
                      height: 15,
                    ),
                    ResuableTextField(
                        controllerValue: registerVM.phoneNumberController.value,
                        hintText: "Phone Number"),
                    SizedBox(
                      height: 15,
                    ),
                    ResuableTextField(
                        controllerValue: registerVM.zipCodeController.value,
                        hintText: "Zip Code"),

                    SizedBox(
                      height: 15,
                    ),
                    ResuableTextField(
                        controllerValue: registerVM.dateOfBirthController.value,
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
                                      width: Get.width*0.4,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Styles.primaryColor,
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
                                      width: Get.width*0.4,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Styles.primaryColor,
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

                          SizedBox(height: 40,),
                          CircularProfileImageWidget(),
                          SizedBox(height: 40,),
                          RoundedButton(
                            width: Get.width * 0.9,
                              title: "Register",
                              color: Styles.primaryColor,
                              onTap:(){
                              registerVM.registerPatient();
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