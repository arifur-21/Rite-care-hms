

import 'package:flutter/material.dart';
import 'package:ritecare_hms/screens/home_screen.dart';
import 'package:ritecare_hms/screens/patient/patient_info/patient_details_update_screen.dart';
import 'package:ritecare_hms/screens/patient_registration/register_update_screen.dart';
import 'package:ritecare_hms/utils/screen_main_padding.dart';

import '../../../utils/color_styles.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../patient_registration/full_form_register_screen.dart';
import '../../search_screen/search_patient_Screen.dart';
import 'components/card_widget.dart';
import '../../../widgets/drawer_widget.dart';
import '../../../widgets/popup_button_widget.dart';
import '../../user_profile_screen/components/profile_image_container_widget.dart';
import '../../user_profile_screen/components/profile_use_data_view_widget.dart';



class PatientInfoScreen extends StatefulWidget {
  static const routeName = "/profile";

  final dynamic? name ;
  final dynamic? serviceId ;
  final dynamic? officalNoId;
  final dynamic? patientId;
  final dynamic? cellNOId ;
  final dynamic? gender ;
  final dynamic? dateOfBirth ;
  final dynamic? rank ;
  final dynamic? mobile ;
  final dynamic? bloodGroup ;
  final dynamic? emergencyContact ;
  final dynamic? unit ;
  final dynamic? emergencyRelation ;
  final dynamic? email ;
  final dynamic? address ;
  final dynamic? branch ;
  final dynamic? relationship ;
  final dynamic? serviceType ;
  final dynamic? prationPrefix ;
  final dynamic? patientStatus ;
  final dynamic? nationalId ;
  List<dynamic>? patientList;
  final dynamic? index;



  PatientInfoScreen({
     this.nationalId,
      this.name,
      this.serviceId,
      this.officalNoId,
      this.patientId,
      this.cellNOId,
      this.gender,
      this.dateOfBirth,
      this.rank,
      this.mobile,
      this.bloodGroup,
      this.emergencyContact,
      this.unit,
      this.emergencyRelation,
      this.email,
      this.address,
      this.branch,
      this.relationship,
      this.serviceType,
      this.prationPrefix,
      this.patientStatus,
      this.patientList,
      this.index});

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
                                                Text('${widget?.patientId}', style: TextStyle(fontSize: 16),),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("${widget?.name}",style: TextStyle(fontSize: 16)),
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
                                                Text("${widget?.cellNOId}", style: TextStyle(fontSize: 16),),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("${widget?.officalNoId}",style: TextStyle(fontSize: 16)),
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

                            ProfileUserDataViewWidget(title: "ID",information: "${widget.patientId }"),
                            ProfileUserDataViewWidget(title: "User Name",information: "${widget.name}"),
                            ProfileUserDataViewWidget(title: "Gender",information: "${widget.gender}"),
                            ProfileUserDataViewWidget(title: "Blood Group",information: "${widget.bloodGroup}"),
                            ProfileUserDataViewWidget(title: "Address",information: "${widget.address}"),
                            ProfileUserDataViewWidget(title: "Mobile",information: "${widget.mobile}"),
                            ProfileUserDataViewWidget(title: "Email",information: "${widget.email}"),
                            ProfileUserDataViewWidget(title: "Date of Birth",information: "${widget.dateOfBirth}"),
                            ProfileUserDataViewWidget(title: "Emergency Contact",information: "${widget.emergencyContact}"),
                            ProfileUserDataViewWidget(title: "Emergency Relation",information: "${widget.emergencyRelation}"),
                            ProfileUserDataViewWidget(title: "Relaionship",information: "${widget.relationship}"),
                            ProfileUserDataViewWidget(title: "Service Type",information: "${widget.serviceType}"),
                            ProfileUserDataViewWidget(title: "Rank",information: "${widget.rank}"),
                            ProfileUserDataViewWidget(title: "Branch/Trade",information: "${widget.branch}"),
                            ProfileUserDataViewWidget(title: "Unit",information: "${widget.unit}"),
                            ProfileUserDataViewWidget(title: "Patient Status",information: "${widget.patientStatus}"),
                            ProfileUserDataViewWidget(title: "Patient Prefix",information: "${widget.prationPrefix}"),

                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                      onTap:(){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                                            RegisterUpdateScreen(
                                              name: widget.name,
                                              gender: widget.gender,
                                            ))) ;
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