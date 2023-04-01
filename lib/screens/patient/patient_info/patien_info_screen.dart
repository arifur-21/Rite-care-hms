

import 'package:flutter/material.dart';
import 'package:ritecare_hms/screens/home_screen.dart';
import 'package:ritecare_hms/screens/patient/patient_info/patient_details_update_screen.dart';
import 'package:ritecare_hms/utils/screen_main_padding.dart';

import '../../../utils/color_styles.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../search_screen/search_patient_Screen.dart';
import 'components/card_widget.dart';
import '../../../widgets/drawer_widget.dart';
import '../../../widgets/popup_button_widget.dart';
import '../../user_profile_screen/components/profile_image_container_widget.dart';
import '../../user_profile_screen/components/profile_use_data_view_widget.dart';



class PatientInfoScreen extends StatefulWidget {
  static const routeName = "/profile";

  @override
  _PatientInfoScreenState createState() => _PatientInfoScreenState();
}

class _PatientInfoScreenState extends State<PatientInfoScreen> {
  List<String> data =[
    'one',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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

          body:   SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(ScreenMainPadding.screenPadding),
              child: Column(
                children: [

                  Container(
                    height: 150,
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("ID", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                Text(":",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Name",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                Text(":",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                              ],
                                            )




                                    ],)),

                                    Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("************", style: TextStyle(fontSize: 16),),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Abdul Kuddus ",style: TextStyle(fontSize: 16)),
                                              ],
                                            )

                                          ],)),
                                    Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("CELL NO", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                Text(":",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Offical NO",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                Text(":",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                              ],
                                            )

                                          ],)),
                                    Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("************", style: TextStyle(fontSize: 16),),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("************",style: TextStyle(fontSize: 16)),
                                              ],
                                            )

                                          ],)),

                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.edit),
                                    SizedBox(width: 10,),
                                    InkWell(
                                        onTap: (){
                                          setState(() {
                                            data.removeAt(index);
                                          });
                                        },
                                        child: Icon(Icons.cancel_presentation))
                                  ],)

                              ],
                            ),
                          );
                        }),
                  ),

                  Container(
                    child: Column(
                      children: [


                        SizedBox(height: 20,),

                        ProfileImageContainerWidget(imageUrl: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"),
                        SizedBox(height: 20,),
                        Column(
                          children: [
                            ProfileUserDataViewWidget(title: "ID",information: "Abdur Rahman"),
                            ProfileUserDataViewWidget(title: "User Name",information: "Abdur Rahman"),
                            ProfileUserDataViewWidget(title: "Gender",information: "Male"),
                            ProfileUserDataViewWidget(title: "Date of Birth",information: "10/10/2023"),
                            ProfileUserDataViewWidget(title: "Age",information: "45"),
                            ProfileUserDataViewWidget(title: "Blood Group",information: "A Positive"),
                            ProfileUserDataViewWidget(title: "Mobile",information: "018593-5585"),
                            ProfileUserDataViewWidget(title: "Emergency Contact",information: "0593-5585"),
                            ProfileUserDataViewWidget(title: "Emergency Name",information: "Rahaman"),
                            ProfileUserDataViewWidget(title: "Emergency Relation",information: "Rahaman"),
                            ProfileUserDataViewWidget(title: "Email",information: "rahman@gmail.com"),
                            ProfileUserDataViewWidget(title: "Address",information: "Dhaka"),
                            ProfileUserDataViewWidget(title: "Zip",information: "100"),

                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                      onTap:(){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PatientDetailsUpdateScreen())) ;
                                      },
                                      child: Icon(Icons.edit))
                                ],
                              ),
                            ),
                            SizedBox(height: 20,)
                          ],
                        )

                      ],
                    )
                  ),

                ],
              ),
            ),
          ),

      ),
    );
  }


}