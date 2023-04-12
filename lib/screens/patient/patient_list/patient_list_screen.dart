
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
import 'components/patient_list_filter_widget.dart';


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

            Container(
              height: 80,
              child: Expanded(
                child: FutureBuilder<PatientListModel>(
                    future: patinetListVM.getPatientsList(),
                    builder: (context, snapShot){
                      if(!snapShot.hasData){
                        return Text("Loading,,,");
                      }else{
                        return PatientListFilterWidget(totalPayment: snapShot.data!.total.toString(),);
                      }
                    }),
              ),
            ),


            Expanded(
              child: FutureBuilder<PatientListModel>(
                  future: patinetListVM.getPatientsList(),
                  builder: (context, snapShot){

                    if(!snapShot.hasData){
                      return Text("data not found");
                    }else{
                      return ListView.builder(
                          itemCount: snapShot.data!.items!.length,
                          itemBuilder: (context, index){
                            return  PatientCartListViewWidgets(
                              patientId: ' ${snapShot.data?.items![index].id}',
                              PatientName: ' ${snapShot.data?.items![index].firstName}',
                              DateOfBirth: ' ${snapShot.data?.items![index].dOB}',
                            onTap: (){

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context)=> PatientInfoScreen(
                                      name: snapShot.data?.items![index].firstName,
                                      serviceId: snapShot.data?.items![index].id,
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
                                      address: snapShot.data?.items![index].country,
                                      relationship: snapShot.data?.items![index].relationship?.name,
                                      serviceType: snapShot.data?.items![index].serviceId,//01770249707
                                      rank: snapShot.data?.items![index].rankName,
                                      branch: snapShot.data?.items![index].trade,
                                      unit: snapShot.data?.items![index].unitName,
                                      nationalId: snapShot.data?.items![index].nationalId,
                                      patientStatus: snapShot.data?.items![index].patientStatus,
                                      prationPrefix: snapShot.data?.items![index].patientPrefix?.name,
                                  )));

                            },);
                          });
                    }
                  }),
            ),



          ],
        ),
      ),

    );
  }
}
