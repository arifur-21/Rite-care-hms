
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  dynamic totalAmount;
  dynamic dob;

  @override
  void initState() {
   patinetListVM.getPatientList();
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
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [

              SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Get.width * 0.4,
              height: 80,
              child: Card(
                color: Colors.greenAccent,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, size: 40,),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Total Patient :"),
                          SizedBox(height: 6,),
                          Text("${patinetListVM.patientList.value.total}"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            PatientListFilterWidget(),

          ],
        ),
            SizedBox(height: 20,),

        Expanded(
          child: Obx ((){
            switch(patinetListVM.rxRequestStatus.value){
              case Status.LOADING:
                return Center(child:  CircularProgressIndicator(),);

              case Status.ERROR:
                print("error ${patinetListVM.error.value.toString()}");
                return Text(patinetListVM.error.value.toString());

              case Status.SUCCESS:

                return ListView.builder (
                  shrinkWrap: true,
                  itemCount: patinetListVM.patientList.value.items!.length ,
                    itemBuilder: (context, index){

                    dob = patinetListVM.patientList.value.items![index].dOB.toString();
                    return
                      Column(
                        children: [
                          PatientCartListViewWidgets(
                              patientId: patinetListVM.patientList.value.items![index].id.toString(),
                              PatientName: patinetListVM.patientList.value.items![index].firstName.toString(),
                              DateOfBirth: '/Date(1680773234000)/',
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context)=>PatientInfoScreen(
                                      name: patinetListVM.patientList.value.items![index].firstName,
                                      serviceId: patinetListVM.patientList.value?.items![index].id,
                                      officalNoId: patinetListVM.patientList.value?.items![index].phoneNumber,
                                      patientId: patinetListVM.patientList.value?.items![index].id,
                                      cellNOId: patinetListVM.patientList.value?.items![index].phoneNumber,
                                      gender: patinetListVM.patientList.value?.items![index].gender?.name ??"",
                                      dateOfBirth:patinetListVM.patientList.value?.items![index].dOB,
                                      mobile: patinetListVM.patientList.value?.items![index].phoneNumber,
                                      bloodGroup: patinetListVM.patientList.value?.items![index].bloodGroup,
                                      emergencyContact: patinetListVM.patientList.value?.items![index].emergencyNumber,
                                      emergencyRelation: patinetListVM.patientList.value?.items![index].emergencyContactRelation,
                                      email: patinetListVM.patientList.value?.items![index].email,
                                      address: patinetListVM.patientList.value?.items![index].country,
                                      relationship: patinetListVM.patientList.value?.items![index].relationship?.name,
                                      serviceType: patinetListVM.patientList.value?.items![index].serviceId,//01770249707
                                      rank: patinetListVM.patientList.value?.items![index].rankName,
                                      branch: patinetListVM.patientList.value?.items![index].trade,
                                      unit: patinetListVM.patientList.value?.items![index].unitName,
                                      nationalId: patinetListVM.patientList.value?.items![index].nationalId,
                                      patientStatus: patinetListVM.patientList.value?.items![index].patientStatus,
                                      prationPrefix: patinetListVM.patientList.value?.items![index].patientPrefix?.name,
                                    )));
                              })
                        ],
                      );
                });



            }
          }),
        )




          ],
        ),
      ),

    );
  }
}
