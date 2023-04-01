import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ritecare_hms/screens/home_screen.dart';
import 'package:ritecare_hms/utils/screen_main_padding.dart';
import 'package:ritecare_hms/widgets/reuseable_text_filed.dart';
import 'package:ritecare_hms/widgets/rounded_button.dart';

import '../../data/app_exceptions.dart';
import '../../data/response/status.dart';
import '../../model/search_model/SearchModel.dart';
import '../../shere_preference/login_preference.dart';
import '../../utils/color_styles.dart';
import '../../view_model/serch_view_mode/SearchViewModel.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/popup_button_widget.dart';
import '../../widgets/resuable_header.dart';
import '../../widgets/reuseable_header_container_widget.dart';
import 'package:http/http.dart' as http;

class PatientSearch extends StatefulWidget {
  const PatientSearch({super.key});

  @override
  State<PatientSearch> createState() => _PatientSearchState();
}

class _PatientSearchState extends State<PatientSearch> {
  TextEditingController patientController = TextEditingController();


  final searchVM = Get.put(SearchViewModel());

  @override
  void initState() {
   searchVM.searchPatient();
   searchVM.searchPatienByCellNO();
    super.initState();
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
          actions: [
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

              ResuableTextField(
                onTap: (){
                  searchVM.searchPatient();
                },
                  controllerValue: searchVM.patienidController.value,
                  icon: Icons.search_outlined,
                  hintText: "Patient Id"),
              SizedBox(
                height: 15,
              ),
              ResuableTextField(
                onTap: (){
                  searchVM.searchPatienByCellNO();
                },
                  controllerValue: searchVM.patientCellNoController.value,
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
                height: 50,
              ),

              RoundedButton(
                width: Get.width * 0.5,
                title: 'Conform',
                color: Styles.primaryColor,
                onTap: (){
                },
              ),

              SizedBox(height: 20,),

              Obx((){

                switch(searchVM.rxRequestStatus.value){
                  case Status.LOADING:
                    return Center(child:  CircularProgressIndicator(),);

                  case Status.ERROR:
                   /* if(searchVM.error.value){
                      return Text(searchVM.error.toString());
                    }else{
                      return GeneralException(onPress: () { homeController.refreshApi();},

                      );
                    }*/

                    return Text(searchVM.error.value.toString());

                  case Status.SUCCESS:

                    return Container(
                      child: Card(
                        child: ListTile(
                          title: Text("Name : ${searchVM.patientList.value.firstName}"),
                          subtitle: Text("Relasionship : ${searchVM.patientList.value.relationshipId!}"),

                        ),
                      ) ,
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


/* SizedBox(height: 10,),
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
                    height: 50,
                  ),

                  RoundedButton(
                    width: Get.width * 0.5,
                    title: 'Conform',
                    color: Styles.primaryColor,
                    onTap: (){

                    },
                  ),

                  SizedBox(height: 20,),*/

/* Obx((){
                    switch(searchVM.rxRequestStatus.value){
                      case Status.LOADING:
                        return Center(child:  CircularProgressIndicator(),);

                      case Status.ERROR:
                        if(searchVM.error.value == 'No internet'){
                          return Container(child: Text("no internet"),);
                        }else{
                          return Container();


                        }

                      case Status.SUCCESS:
                        return ListView.builder(
                            itemCount: searchVM.userList.value.firstName!.length,
                            itemBuilder: (context, index){
                              return Card(
                                child: ListTile(
                                  title: Text(searchVM.userList.value!.firstName.toString()),

                                ),
                              );
                            });

                    }

                  }),
              Text("search Data ${searchVM.userList.value!.firstName.toString()}")

*/