
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/utils/color_styles.dart';

import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/drawer_widget.dart';
import '../../../widgets/popup_button_widget.dart';
import 'components/patient_card_list_view_widget.dart';


class PatientListScreen extends StatefulWidget {
  const PatientListScreen({Key? key}) : super(key: key);

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child:DrawerWidget(),
      ),

      appBar: AppBar(
          backgroundColor: Styles.primaryColor,
          actions: [
          AppBarWidget(),
        ]
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(

            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 70,
                      width: Get.width * 0.5 ,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.shade100,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.person, size: 30,),

                          SizedBox(width: 10,),

                          Column(
                            children: [
                              Text("Total Payment :",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Styles.textGreen), ),
                              SizedBox(height: 8,),
                              Text("45888",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Styles.textGreen),),
                            ],
                          )
                        ],
                      )
                  ),

                  Container(
                      height: 70,
                      width: Get.width * 0.4 ,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(

                              image: DecorationImage(
                                  image: AssetImage('assets/icons/filter.png')
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Text("Filter",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(width: 10,),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(

                              image: DecorationImage(
                                  image: AssetImage('assets/icons/cancel.png')
                              ),
                            ),
                          ),

                        ],
                      )
                  ),


                ],
              ),

              SizedBox(height: 20,),
              PatientCartListViewWidgets(
                patientId: '3849948',
                PatientName: 'Md Abdur Rahim',
                DateOfBirth: '13/03/2948',),

              PatientCartListViewWidgets(
                patientId: '3849948',
                PatientName: 'Md Abdur Rahim',
                DateOfBirth: '13/03/2948',),

              PatientCartListViewWidgets(
                patientId: '3849948',
                PatientName: 'Md Abdur Rahim',
                DateOfBirth: '13/03/2948',),

              PatientCartListViewWidgets(
                patientId: '3849948',
                PatientName: 'Md Abdur Rahim',
                DateOfBirth: '13/03/2948',),

              PatientCartListViewWidgets(
                patientId: '3849948',
                PatientName: 'Md Abdur Rahim',
                DateOfBirth: '13/03/2948',),

              PatientCartListViewWidgets(
                patientId: '3849948',
                PatientName: 'Md Abdur Rahim',
                DateOfBirth: '13/03/2948',),
            ],
          ),
        ),
      ),

    );
  }
}
