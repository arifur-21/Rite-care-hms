
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ritecare_hms/screens/patient/patient_info/patien_info_screen.dart';
import 'package:ritecare_hms/screens/search_screen/conponents/search_list_widget.dart';
import 'package:ritecare_hms/shere_preference/login_preference.dart';
import 'package:ritecare_hms/view_model/serch_view_mode/SearchViewModel.dart';
import 'package:shimmer/shimmer.dart';

import '../../model/search_model/SearchModel.dart';
import 'package:http/http.dart' as http;

import '../../utils/color_styles.dart';
import '../../widgets/rounded_button.dart';
import '../patient_registration/short_form_register.dart';

class SearchPatientOfficialNumber extends StatefulWidget {
  const SearchPatientOfficialNumber({super.key});



  @override
  State<SearchPatientOfficialNumber> createState() => _SearchPatientOfficialNumberState();
}

class _SearchPatientOfficialNumberState extends State<SearchPatientOfficialNumber> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this)..repeat();

  final searchVM = Get.put(SearchViewModel());
  bool isLoading = true;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [

            Expanded(
              child: FutureBuilder(
                future: searchVM.getPatientByOfficialNumber(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Expanded(
                              flex: 1,
                              child: SpinKitFadingCircle(
                                duration: Duration(seconds: 6),
                                color: Colors.black,
                                size: 50,
                                controller: _controller,
                              )),

                      Column(
                        children: [
                          Text("Don't have any registration.", style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20, color: Colors.red),),
                          SizedBox(height: 10,),
                          Text("Please register.", style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20, color: Colors.red),),

                          SizedBox(height: 50,),

                          RoundedButton(
                            width: Get.width * 0.5,
                            title: 'Registration',
                            color: Styles.primaryColor,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrShortForm() ));
                            },
                          )


                        ],
                      )

                        ],
                      ),
                    );


                  }
                  else {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index){
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  PatientInfoScreen(
                                      name: snapshot.data![index]['FirstName'],
                                      serviceId: snapshot.data![index]['ServiceId'],
                                      cellNOId: snapshot.data![index]['PhoneNumber'],
                                      officalNoId: snapshot.data![index]['ServiceId'],
                                      patientId: snapshot.data![index]['Id'],
                                      gender: snapshot.data![index]['Gender']['Name'],
                                      email: snapshot.data![index]?['Email'],
                                      dateOfBirth: snapshot.data![index]['CreatedDate'],
                                      bloodGroup: snapshot.data![index]['BloodGroup'],
                                      mobile: snapshot.data![index]['PhoneNumber'],
                                      emergencyContact: snapshot.data![index]?['EmergencyNumber'],
                                      emergencyRelation: snapshot.data![index]?['EmergencyContactRelation'],
                                     // address: snapshot.data![index]?['ServiceId'],

                                     )));
                            },

                            child: SearchlistWidget(
                              id: index+1,
                              name: '${snapshot.data![index]['FirstName']}',
                              relation: '${snapshot.data![index]['Relationship']?['Name']}',

                            ),
                          );
                        });
                  }

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
