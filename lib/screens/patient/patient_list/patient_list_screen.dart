
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/model/patinet_list_model/patient_list_model.dart';
import 'package:ritecare_hms/utils/color_styles.dart';

import '../../../data/response/status.dart';
import '../../../view_model/patient_list_view_model/patient_list_view_model.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/drawer_widget.dart';
import '../../../widgets/popup_button_widget.dart';
import '../patient_info/patien_info_screen.dart';
import 'components/patient_card_list_view_widget.dart';


class PatientListScreen extends StatefulWidget {
  const PatientListScreen({Key? key}) : super(key: key);

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {

  final patinetListVM = Get.put(PatientListViewModel());

  @override
  void initState() {
    patinetListVM.getPatientsList();
    super.initState();
  }

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

      body: Padding(
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
                            Expanded(
                              child: FutureBuilder<PatientListModel>(
                                  future: patinetListVM.getPatientsList(),
                                  builder: (context, snapShot){

                                    if(!snapShot.hasData){
                                      return Text("Loading,,,");
                                    }else{
                                      return Column(
                                        children: [
                                          Text("Total Payment :",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Styles.textGreen), ),
                                          SizedBox(height: 8,),
                                          Text('${snapShot.data?.total}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Styles.textGreen),),
                                        ],
                                      );
                                    }
                                  }),
                            ),
                            /*Text("Total Payment :",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Styles.textGreen), ),
                            SizedBox(height: 8,),
                            Text("45888",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Styles.textGreen),),*/
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


            Expanded(
              child: FutureBuilder<PatientListModel>(
                  future: patinetListVM.getPatientsList(),
                  builder: (context, snapShot){

                    if(!snapShot.hasData){
                      return Text("Loading,,,");
                    }else{
                      return ListView.builder(
                          itemCount: snapShot.data!.items!.length,
                          itemBuilder: (context, index){
                            print("data is here ${snapShot.data?.items![index].firstName}");
                            return  PatientCartListViewWidgets(
                              patientId: ' ${snapShot.data?.items![index].id}',
                              PatientName: ' ${snapShot.data?.items![index].firstName}',
                              DateOfBirth: ' ${snapShot.data?.items![index].dOB}',
                            onTap: (){

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context)=> PatientInfoScreen(
                                      name: snapShot.data?.items![index].firstName,
                                      serviceId: snapShot.data?.items![index].serviceId,
                                      officalNoId: snapShot.data?.items![index].phoneNumber,
                                      patientId: snapShot.data?.items![index].id,
                                      cellNOId: snapShot.data?.items![index].phoneNumber,
                                      gender: snapShot.data?.items![index].gender?.name ??"",
                                      dateOfBirth: snapShot.data?.items![index].dOB,
                                      mobile: snapShot.data?.items![index].phoneNumber,
                                      bloodGroup: snapShot.data?.items![index].bloodGroup,
                                      emergencyContact: snapShot.data?.items![index].emergencyNumber,
                                      emergencyRelation: snapShot.data?.items![index].emergencyContactRelation,
                                      email: snapShot.data?.items![index].email,
                                      address: snapShot.data?.items![index].city,
                                      relationship: snapShot.data?.items![index].relationship?.name,
                                      serviceType: snapShot.data?.items![index].serviceId,
                                      rank: snapShot.data?.items![index].rankName,
                                      branch: snapShot.data?.items![index].trade,
                                      unit: snapShot.data?.items![index].unit,
                                      nationalId: snapShot.data?.items![index].nationalId,
                                      patientStatus: snapShot.data?.items![index].patientStatus,
                                      prationPrefix: snapShot.data?.items![index].patientPrefix?.name,
                                  )));

                            },);
                          });
                    }
                  }),
            ),

            SizedBox(height: 20,),

          ],
        ),
      ),

    );
  }
}
