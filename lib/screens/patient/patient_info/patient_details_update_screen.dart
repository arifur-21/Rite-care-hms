import 'package:flutter/material.dart';
import 'package:ritecare_hms/screens/home_screen.dart';
import 'package:ritecare_hms/screens/patient/patient_info/patient_details_screen.dart';
import 'package:ritecare_hms/screens/user_profile_screen/components/profile_image_container_widget.dart';
import 'package:ritecare_hms/widgets/reuseable_text_filed.dart';
import 'package:ritecare_hms/widgets/rounded_button.dart';

import '../../../utils/color_styles.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/drawer_widget.dart';
import '../../../widgets/popup_button_widget.dart';


class PatientDetailsUpdateScreen extends StatefulWidget {
  const PatientDetailsUpdateScreen({super.key});

  @override
  State<PatientDetailsUpdateScreen> createState() => _PatientDetailsUpdateScreenState();
}

class _PatientDetailsUpdateScreenState extends State<PatientDetailsUpdateScreen> {
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
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [

                    Container(
                      height: 60,
                      color: ColorStyles.primaryColor,
                      child: ListTile(
                        title:Text("Patient Update",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)),
                        trailing: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PatientProfileDetailsScreen()));
                            },
                            child: Icon(Icons.cancel_presentation,size: 30, color: Colors.white,)),
                      ),
                    ),
                    SizedBox(height: 20,),

                    ProfileImageContainerWidget(imageUrl: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"),
                    SizedBox(height: 20,),
                    ResuableTextField(
                        controllerValue: serviceTypeController,
                        hintText: "Service Type"),

                    SizedBox(
                      height: 15,
                    ),
                    ResuableTextField(
                        controllerValue: serviceTypeController,
                        hintText: "Patient Prefix"),

                    SizedBox(height: 15,),
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

                    SizedBox(height: 15,),
                    ResuableTextField(
                        controllerValue: serviceTypeController,
                        hintText: "National ID"),

                    SizedBox(height: 15,),
                    ResuableTextField(
                        controllerValue: serviceTypeController,
                        hintText: "Emergency Contact Number"),
                    SizedBox(height: 15,),
                    ResuableTextField(
                        controllerValue: serviceTypeController,
                        hintText: "Emergency Contact Number"),
                    SizedBox(height: 15,),
                    ResuableTextField(
                        controllerValue: serviceTypeController,
                        hintText: "Emergency Contact Number"),

                    SizedBox(height: 15,),
                    ResuableTextField(
                        controllerValue: serviceTypeController,
                        hintText: "E-mail"),
                    SizedBox(height: 15,),

                    ResuableTextField(
                        controllerValue: serviceTypeController,
                        hintText: "Street/Address"),
                    SizedBox(height: 15,),

                    ResuableTextField(
                        controllerValue: serviceTypeController,
                        hintText: "Date Of Birth"),
                    SizedBox(height: 15,),


                    SizedBox(height: 20,),

                    RoundedButton(
                        title: "Update", color: ColorStyles.primaryColor,
                        onTap: (){

                    })


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sizeBox(){
    return SizedBox(height: 15);
  }
}