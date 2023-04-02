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

import 'conponents/search_list_widget.dart';

class PatientSearch extends StatefulWidget {
  const PatientSearch({super.key});

  @override
  State<PatientSearch> createState() => _PatientSearchState();
}

class _PatientSearchState extends State<PatientSearch> {
  TextEditingController patientController = TextEditingController();
  TextEditingController patientCellNO = TextEditingController();


  final searchVM = Get.put(SearchViewModel());


  LoginPreference loginPreference = LoginPreference();
  var token;


  List<SearchModel> searchData =[];

  Future<List<SearchModel>> getPatientsAll()async {
    print("patient Id ${patientCellNO.value.text}");
    loginPreference.getToken().then((value){
      token = value.accessToken!;
    });

    final response = await http.get(Uri.parse("https://mobileapp.rite-hms.com/Patient/GetPatientByPhone?phoneNumber=${patientCellNO.value.text}"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'cache-control': 'no-cache'
        }
    );
    var data  = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        print(i['FirstName']);
        searchData.add(SearchModel.fromJson(i));
      }
      return searchData;
    }else{
      return searchData;
    }
  }


  @override
  void initState() {
  searchVM.searchPatient();
 searchVM.patientCellId;
 // getPatientsAll();
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
                    searchVM.patientCellId();
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
                    if(searchVM.patientList.value == null){
                      return Container(child: Text("Data not found"),);
                    }
                    else{
                      return Container(
                        child: Column(
                          children: [
                            SearchlistWidget(
                              id: ' ${searchVM.patientList.value.id!}',
                              name: ' ${searchVM.patientList.value.firstName}',
                              relation: ' ${searchVM.patientList.value.relationship!.name!}',

                            ),



                          ],
                        )
                      );
                    }



                }

              }),

          Column(
            children: [
              FutureBuilder(
                future:  searchVM.patientCellId(),
                builder: (context, AsyncSnapshot<List<SearchModel>> snapShot){

                  if(!snapShot.hasData){
                    return Text("Data not found");
                  }else{
                    return ListView.builder(
                      shrinkWrap: true,
                        itemCount: snapShot.data!.length,
                        itemBuilder: (context, index){
                          return SearchlistWidget(
                            id: ' ${snapShot.data![index].firstName}',
                            name: ' ${"fdf"}',
                            relation: 'rwwr',

                          );
                        });
                  }

                },
              )
            ],
          )

            ],
          ),
        ),


      ),
    );
  }
}

