
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ritecare_hms/utils/color_styles.dart';

import '../../data/response/status.dart';
import '../../view_model/serch_view_mode/SearchViewModel.dart';
import '../patient/patient_info/patien_info_screen.dart';
import 'conponents/search_list_widget.dart';

class PatientListIdScreen extends StatefulWidget {
  const PatientListIdScreen({Key? key}) : super(key: key);

  @override
  State<PatientListIdScreen> createState() => _PatientListIdScreenState();
}

class _PatientListIdScreenState extends State<PatientListIdScreen> {

  final searchVM = Get.put(SearchViewModel());

  @override
  void initState() {
    searchVM.searchPatient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
      ),
      body: Column(
        children: [

          SizedBox(height: 30,),
          Obx((){
            switch(searchVM.rxRequestStatus.value){
              case Status.LOADING:
                return Center(child:  CircularProgressIndicator(),);

              case Status.ERROR:
                print("error ${searchVM.error.value.toString()}");
                return Text(searchVM.error.value.toString());

              case Status.SUCCESS:
              return  InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      PatientInfoScreen(
                        name: searchVM.patientList.value.firstName,
                        serviceId: searchVM.patientList.value.serviceId,
                        cellNOId: searchVM.patientList.value.phoneNumber,
                        officalNoId: searchVM.patientList.value.serviceId,
                        patientId: searchVM.patientList.value.id,
                        gender: searchVM.patientList.value.gender,
                        email: searchVM.patientList.value.email,
                        dateOfBirth: searchVM.patientList.value.dOB,
                        bloodGroup: searchVM.patientList.value.bloodGroup,
                        mobile: searchVM.patientList.value.phoneNumber,
                        emergencyContact: searchVM.patientList.value.emergencyNumber,
                        emergencyRelation: searchVM.patientList.value.emergencyContactRelation,
                        // address: snapshot.data![index]?['ServiceId'],

                      )));
                },
                child: SearchlistWidget(
                    id: '1',
                    name: ' ${searchVM.patientList.value.firstName}',
                    relation: ' ${searchVM.patientList.value.rankName}',
                  ),
              );



                if(searchVM.patientListItem == null){
                  print("data not found");
                  return Text("data not found");
                }
                else{
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchVM.patientListItem.value.length,
                      itemBuilder: (context, index){
                        //  searchVM.patientListItem.clear();
                        print("item ${searchVM.patientListItem[index].id.toString()}");
                        return SearchlistWidget(
                          id: ' ${searchVM.patientListItem[index]?.id.toString()}',
                          name: ' ${searchVM.patientListItem[index]?.firstName.toString()}',
                          relation: ' ${searchVM.patientListItem[index].relationship?.name}',
                        );
                      });
                }




            }
          }),
        ],
      ) ,
    );
  }
}
