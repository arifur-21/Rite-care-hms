import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/utils/color_styles.dart';
import 'package:shimmer/shimmer.dart';
import '../../../model/lab_test_model/summery_model.dart';
import '../../../model/patinet_list_model/patient_list_model.dart';
import '../../../resources/app_url/app_url.dart';
import '../../../shere_preference/login_preference.dart';
import '../../../view_model/summery_view_model/summery_view_model.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/drawer_widget.dart';

import '../../../widgets/filter_button.dart';
import '../../../widgets/popup_button_widget.dart';
import 'components/expandable_summery_list_item_widget.dart';
import 'package:http/http.dart' as http;

class PatientSummeryScreen extends StatefulWidget {
  const PatientSummeryScreen({Key? key}) : super(key: key);

  @override
  State<PatientSummeryScreen> createState() => _PatientSummeryScreenState();
}

class _PatientSummeryScreenState extends State<PatientSummeryScreen> {
  final summeryVM = Get.put(SummeryViewModel());
  LoginPreference loginPreference = LoginPreference();
  var token;

  Future<SummeryModel> getPatientsList()async {
    var data;

    loginPreference.getToken().then((value){
      token = value.accessToken!;
    });

    final response = await http.get(Uri.parse('https://mobileapp.rite-hms.com/Item/GetPatientInvoicebyMedicalType?id=0&statusid=0&medicalTypeID=62&DateStart=2023-04-06&DateEnd=2023-04-06&pageNumber=1&pageSize=25&invoiceId=undefined&sampleId=null&itemId=undefined'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'cache-control': 'no-cache'
        }
    );
    data  = jsonDecode(response.body) ;
    if(response.statusCode == 200){
      print("data ${data.toString()}");
      return SummeryModel.fromJson(data);
    }else{
      return SummeryModel.fromJson(data);
    }
  }




  @override
  void initState() {
    getPatientsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        actions: [
          AppBarWidget(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [

            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  FilterContainerBtn(),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Styles.primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("DATE", style: Styles.poppinsFont12_500),
                          Text("INV.NO", style: Styles.poppinsFont12_500),
                          Text("STATUS", style: Styles.poppinsFont12_500),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(6),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 2, color: Styles.primaryColor),
                          ),
                          child: ExpansionTile(
                            trailing: Container(
                                height: 25,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  border: Border(),
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Center(
                                    child: Text("Collection",
                                        style: Styles.poppinsFont12_600))),
                            title: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("12-34-0202",
                                        style: Styles.poppinsFontBlack12),
                                    Text("1000330",
                                        style: Styles.poppinsFontBlack12),
                                  ],
                                )
                              ],
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    Text(
                                      "PATIENT :",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Styles.textGreen),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Abdur Rahim ",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              ExpandableSummeryListItem(
                                title: "CBC",
                                category: "Hematoloty",
                                name: "Abdul Ali",
                              ),
                            ],
                          ),
                        ),
                      );
                    })),


            Expanded(
                child: FutureBuilder(
                  future: getPatientsList(),
              builder: (context, snapShot){

                if(!snapShot.hasData){
                  return Text("data not found");
                }else{
                  return Text("data found");
                }
              },
            ))


          ],
        ),
      ),
    );
  }
}
