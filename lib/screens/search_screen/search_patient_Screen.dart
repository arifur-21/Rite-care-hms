import 'dart:convert';
import 'dart:math';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ritecare_hms/screens/home_screen.dart';
import 'package:ritecare_hms/screens/patient/patient_info/patien_info_screen.dart';
import 'package:ritecare_hms/screens/search_screen/patient_list_id_screen.dart';
import 'package:ritecare_hms/screens/search_screen/search_patient_by_name.dart';
import 'package:ritecare_hms/screens/search_screen/search_patient_by_offical_num.dart';
import 'package:ritecare_hms/utils/screen_main_padding.dart';
import 'package:ritecare_hms/utils/utils.dart';
import 'package:ritecare_hms/widgets/reuseable_text_filed.dart';
import 'package:ritecare_hms/widgets/rounded_button.dart';

import '../../data/app_exceptions.dart';
import '../../data/response/status.dart';
import '../../model/search_model/SearchModel.dart';
import 'search_patient_by_cell_no.dart';
import '../../shere_preference/login_preference.dart';
import '../../utils/color_styles.dart';
import '../../view_model/serch_view_mode/SearchViewModel.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/popup_button_widget.dart';
import '../../widgets/resuable_header.dart';
import '../../widgets/reuseable_header_container_widget.dart';
import 'package:http/http.dart' as http;

import 'conponents/search_list_widget.dart';

class PatientSearch extends StatefulWidget {
  const PatientSearch({super.key});

  @override
  State<PatientSearch> createState() => _PatientSearchState();
}

class _PatientSearchState extends State<PatientSearch> {
  TextEditingController patientOfficialNumController = TextEditingController();
  TextEditingController patientCellNOController = TextEditingController();
  TextEditingController patientByNameController = TextEditingController();

 bool isCheck = false;

  final searchVM = Get.put(SearchViewModel());
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  LoginPreference loginPreference = LoginPreference();
  var token;


  List<SearchModel> searchData =[];


  @override
  void dispose() {
   searchVM.patientOfficialNumberController.close();
   searchVM.patientNameController.close();
   searchVM.patientCellNoController.close();
   searchVM.patienidController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawer: Drawer(
          child:DrawerWidget(),
        ),
        appBar: AppBar(
          backgroundColor: Styles.primaryColor,
          actions:  [
            AppBarWidget(),
          ],
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(ScreenMainPadding.screenPadding),
          child: Column(
            children: [



              SizedBox(height: 10,),
              Card (
                  color: Styles.primaryColor,
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
                                  Get.back();
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
              SizedBox(height: 30,),

              Form(
                  key: _formKey2,
                  child: Column(
                    children: [

                      ResuableTextField(
                          onTap: (){
                            if(_formKey.currentState!.validate()){
                              searchVM.searchPatient();
                            }
                            searchVM.patientCellNoController.value.clear();
                            searchVM.patientNameController.value.clear();
                            searchVM.patientOfficialNumberController.value.clear();
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> PatientListIdScreen()));
                          },
                          errorMsg: "Please Enter Patient Id",
                          controllerValue: searchVM.patienidController.value,
                          icon: Icons.search_outlined,
                          hintText: "Patient Id"),
                    ],)),

              SizedBox(
                height: 15,
              ),

              Form(
                key: _formKey,
                  child: Column(
                    children: [

                      ResuableTextField(
                          onTap: (){

                            if(_formKey.currentState!.validate()){
                              searchVM.searchPatientCellNum();
                            }
                            searchVM.patienidController.value.clear();
                            searchVM.patientNameController.value.clear();
                            searchVM.patientOfficialNumberController.value.clear();
                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchPatientCellNO()));
                          },
                          errorMsg: "Please Enter Patient Cell No",
                          controllerValue:  searchVM.patientCellNoController.value,
                          icon: Icons.search_outlined,
                          hintText: "Patient Cell No"),
              ],)),

              SizedBox(
                height: 15,
              ),

              Form(
                  key: _formKey1,
                  child: Column(
                    children: [

                      ResuableTextField(
                          onTap: (){
                            if(_formKey1.currentState!.validate()){
                              searchVM.searchPatientByName();
                            }
                            searchVM.patienidController.value.clear();
                            searchVM.patientOfficialNumberController.value.clear();
                             searchVM.patientCellNoController.value.clear();
                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchPatientByName()));
                          },
                          errorMsg: "Please Enter Patient Name",
                          controllerValue: searchVM.patientNameController.value,
                          icon: Icons.search_outlined,
                          hintText: "Patient Name"),
                    ],)),

              SizedBox(
                height: 15,
              ),

              Form(
                  key: _formKey3,
                  child: Column(
                    children: [
                      ResuableTextField(
                          onTap: (){
                            if(_formKey3.currentState!.validate()){
                              searchVM.searchPatientOfficalNo();
                            }
                             searchVM.patientNameController.value.clear();
                            searchVM.patienidController.value.clear();
                            searchVM.patientCellNoController.value.clear();
                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchPatientOfficialNumber()));

                          },
                          errorMsg: "Please Enter your Official Number",
                          controllerValue: searchVM.patientOfficialNumberController.value,
                          icon: Icons.search_outlined,
                          hintText: "Patient Official Number"),

                    ],)),

              SizedBox(
                height: 30,
              ),


              Obx((){
                switch(searchVM.rxRequestStatus.value){
                  case Status.LOADING:
                    if(searchVM.patientListItem.value.isNotEmpty && searchVM.error.value.isNotEmpty){
                      return Center(child: CircularProgressIndicator());
                    }else{
                      return SizedBox();
                    }


                  case Status.ERROR:
                  print("error ${searchVM.error.value.toString()}");
                    return Text(searchVM.error.value.toString());

                  case Status.SUCCESS:
                    
                      if(searchVM.patientListItem.value.isEmpty){
                        print("data not found");
                        return Center(
                          child: Column(
                            children: [
                              Text("data not found Please Registration", style: TextStyle(fontSize: 16, color: Colors.red),),
                              SizedBox(height: 10,),
                              RoundedButton(
                                width: Get.width * 0.4,
                                  title: "Registration",
                                  color: Styles.primaryColor,
                                  onTap: (){

                              }),
                            ],
                          ),
                        );
                      }
                      else{
                        return Column(
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: searchVM.patientListItem.value.length,
                                itemBuilder: (context, index){
                                  print("item ${searchVM.patientListItem[index].id.toString()}");
                                  return InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context)=> PatientInfoScreen(
                                            name:searchVM.patientListItem[index].firstName,
                                            serviceId: searchVM.patientListItem[index].serviceId,
                                            cellNOId: searchVM.patientListItem[index].phoneNumber,
                                            officalNoId: searchVM.patientListItem[index].serviceId,
                                            patientId: searchVM.patientListItem[index].id,
                                            gender: searchVM.patientListItem[index].gender,
                                            email: searchVM.patientListItem[index].email,
                                            dateOfBirth: searchVM.patientListItem[index].dOB,
                                            bloodGroup: searchVM.patientListItem[index].bloodGroup,
                                            mobile: searchVM.patientListItem[index].phoneNumber,
                                            emergencyContact: searchVM.patientListItem[index].emergencyNumber,
                                            emergencyRelation: searchVM.patientListItem[index].emergencyContactRelation,
                                            // address: snapshot.data![index]?['ServiceId'],
                                          )));
                                    },
                                    child: SearchlistWidget(
                                      id: index+1,
                                      name: ' ${searchVM.patientListItem[index]?.firstName.toString()}',
                                      relation: ' ${searchVM.patientListItem[index].relationship?.name}',
                                    ),
                                  );
                                }),
                          ],
                        );
                      }




                    }
              }),


            ],
          ),
        ),


      ),
    );
  }



}


/* Column(
          children: [
            Expanded(

              child: FutureBuilder(
                  future: searchVM.searchPatientCellNum(),
                  builder: (context, snapShot){
                    if(!snapShot.hasData){
                      return Text("Loading");
                    }else{

                      return ListView.builder(
                         itemCount: snapShot.data!.length,
                          itemBuilder: (context, index){

                            print("data is ${searchVM.patientListItem[index].firstName.toString()}");
                            return Text(' ${searchVM.patientListItem[index].firstName.toString()}');
                          });
                    }
                  }),
            )
          ],
        )*/




