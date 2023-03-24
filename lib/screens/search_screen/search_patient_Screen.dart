import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:ritecare_hms/screens/home_screen.dart';
import 'package:ritecare_hms/widgets/reuseable_text_filed.dart';
import 'package:ritecare_hms/widgets/rounded_button.dart';

import '../../utils/color_styles.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/popup_button_widget.dart';
import '../../widgets/resuable_header.dart';
import '../../widgets/reuseable_header_container_widget.dart';
class PatientSearch extends StatefulWidget {
  const PatientSearch({super.key});

  @override
  State<PatientSearch> createState() => _PatientSearchState();
}

class _PatientSearchState extends State<PatientSearch> {
  TextEditingController patientController = TextEditingController();

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
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Card (
                    color: ColorStyles.primaryColor,
                    elevation: 8,
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Patient Selection", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),

                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen()));
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/icons/cancel.png')
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )




                      ],
                    )
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ResuableTextField(
                      controllerValue: patientController,
                      icon: Icons.search_outlined,
                      hintText: "Patient Id"),
                  SizedBox(
                    height: 15,
                  ),
                  ResuableTextField(
                      controllerValue: patientController,
                      icon: Icons.search_outlined,
                      hintText: "Patient Cell No"),

                  SizedBox(
                    height: 15,
                  ),
                  ResuableTextField(
                      controllerValue: patientController,
                      icon: Icons.search_outlined,
                      hintText: "Patient Name"),
                  SizedBox(
                    height: 15,
                  ),
                  ResuableTextField(
                      controllerValue: patientController,
                      icon: Icons.search_outlined,
                      hintText: "Patient Official Number"),
                  SizedBox(
                    height: 20,
                  ),

                  RoundedButton(
                    title: 'Conform',
                    color: ColorStyles.primaryColor,
                    onTap: (){

                    },

                  )




                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}