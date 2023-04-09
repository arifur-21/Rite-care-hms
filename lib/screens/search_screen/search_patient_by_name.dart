
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ritecare_hms/screens/search_screen/conponents/search_list_widget.dart';
import 'package:ritecare_hms/shere_preference/login_preference.dart';
import 'package:shimmer/shimmer.dart';

import 'package:http/http.dart' as http;

import '../../model/search_model/SearchModel.dart';
import '../../view_model/serch_view_mode/SearchViewModel.dart';
import '../patient/patient_info/patien_info_screen.dart';

class SearchPatientByName extends StatefulWidget {

  const SearchPatientByName({super.key});

  @override
  State<SearchPatientByName> createState() => _SearchPatientByNameState();
}

class _SearchPatientByNameState extends State<SearchPatientByName> {

  final searchVM = Get.put(SearchViewModel());
  bool patientFound  = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [

            Expanded(
              child: FutureBuilder(
                future: searchVM.getPatientByName(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                        itemCount: 11,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Container(height: 16, width: 89, color: Colors.white,),
                                  subtitle: Container(height: 16, width: 89, color: Colors.white,),

                                  leading: Container(height: 16, width: 89, color: Colors.white,),
                                )
                              ],
                            ),
                          );
                        });
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
                                    address: snapshot.data![index]?['City'],
                                    unit: snapshot.data![index]?['UnitName'],
                                    rank: snapshot.data![index]?['RankName'],
                                    prationPrefix: snapshot.data![index]?['PatientPrefix']['Name'],
                                    patientStatus: snapshot.data![index]?['PatientStatus'],
                                    nationalId: snapshot.data![index]?['NationalId'],
                                    branch: snapshot.data![index]?['TradeName'],
                                    serviceType: snapshot.data![index]?['ServiceId'],
                                    relationship: snapshot.data![index]?['Relationship']['Name'],
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
