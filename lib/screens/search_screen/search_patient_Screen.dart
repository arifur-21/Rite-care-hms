import 'dart:convert';
import 'dart:math';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ritecare_hms/screens/home_screen.dart';
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



  final searchVM = Get.put(SearchViewModel());


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

        body:



        SingleChildScrollView(
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
                                  /// Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen()));
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
              SizedBox(height: 15,),

              ////success
              ResuableTextField(
                  onTap: (){
                    searchVM.searchPatient();
                    print('api id ${searchVM.patientList.value.id}');
                    print(' controller${searchVM.patienidController.value.text}');

                    if(searchVM.patientList.value.id != searchVM.patienidController.value.text){
                      Utils.snakBar("error", "data not found112");

                    }else   {
                      Utils.snakBar("error", "data not found");


                    }
                  },
                  controllerValue: searchVM.patienidController.value,
                  icon: Icons.search_outlined,
                  hintText: "Patient Id"),
              SizedBox(
                height: 15,
              ),

              ResuableTextField(
                  onTap: (){

                    searchVM.searchPatientCellNum();
                  //  searchVM.patienidController.value.clear();
                   /// Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchPatientCellNO()));
                },

                  controllerValue:  searchVM.patientCellNoController.value,
                  icon: Icons.search_outlined,
                  hintText: "Patient Cell No"),

              SizedBox(
                height: 15,
              ),
              ResuableTextField(
                onTap: (){
                  searchVM.patientCellNoController.value.clear();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchPatientByName()));
                },
                  controllerValue: searchVM.patientNameController.value,
                  icon: Icons.search_outlined,
                  hintText: "Patient Name"),
              SizedBox(
                height: 15,
              ),
              ResuableTextField(
                onTap: (){
                  searchVM.patientNameController.value.clear();
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchPatientOfficialNumber()));

                },
                  controllerValue: searchVM.patientOfficialNumberController.value,
                  icon: Icons.search_outlined,
                  hintText: "Patient Official Number"),
              SizedBox(
                height: 50,
              ),



              Obx((){

                switch(searchVM.rxRequestStatus.value){
                  case Status.LOADING:
                    return Center();

                  case Status.ERROR:
                    if(searchVM.error.value ==null){
                      return Text(searchVM.error.toString());
                    }else{
                     return Container();
                    }

                    return Text(searchVM.error.value.toString());

                  case Status.SUCCESS:

                      return Container(
                          child: Column(
                            children: [

                              SearchlistWidget(
                                id: ' ${searchVM.patientList.value.id}',
                                name: ' ${searchVM.patientList.value.firstName}',
                                relation: ' ${searchVM.patientList.value.rankName}',
                              )
                            ],
                          )
                      );
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




