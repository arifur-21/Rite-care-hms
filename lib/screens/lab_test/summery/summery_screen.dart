
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:ritecare_hms/screens/patient/patient_info/patien_info_screen.dart';
import 'package:ritecare_hms/utils/color_styles.dart';
import 'package:ritecare_hms/widgets/resuable_header.dart';
import 'package:ritecare_hms/widgets/rounded_button.dart';import '../../../data/app_exceptions.dart';
import '../../../data/response/status.dart';
import '../../../function/function_class.dart';
import '../../../model/lab_test_model/lab_test_list_model.dart';
import '../../../model/lab_test_model/simple_list_models.dart';
import '../../../model/patinet_list_model/patient_list_model.dart';
import '../../../view_model/summery_view_model/summery_view_model.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/drawer_widget.dart';

import '../../../widgets/filter_button.dart';
import '../../../widgets/patinet_info_card_widget.dart';
import '../../../widgets/popup_button_widget.dart';
import '../../qr_code_screen/qr_code_screen.dart';
import '../sample_list/components/sample_filter_widget.dart';
import '../summery/components/expandable_summery_list_item_widget.dart';

import 'package:http/http.dart' as http;

import 'components/summery_list_filter_widget.dart';


class PatientSummeryScreen extends StatefulWidget {
  const PatientSummeryScreen({Key? key}) : super(key: key);

  @override
  State<PatientSummeryScreen> createState() => _PatientSummeryScreenState();
}

class _PatientSummeryScreenState extends State<PatientSummeryScreen> {

  var colors = Styles.primaryColor;

  final summeryVM = Get.put(SummeryViewModel());
  dynamic statusId;
  String? status ='';
  bool btnVisibility = false;
  dynamic? dateTime;
  dynamic dobs;


  @override
  void initState() {
    summeryVM.getSummeryListData();
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
        ],
      ),


      body: Column(
        children: [
          Container(
            child: Column(
              children: [

                SizedBox(height: 10,),


                SummeryListFilterWidget(
                  textField1HintText: 'Labtest Name',
                  textField2HintText: 'Inv.No',
                  onClick: (){
                   // summeryVM.getSummeryListData();
                    Navigator.pop(context);
                  }, qrOnClick: () {
                    //_showDialog();
                  Get.to(QrCodeScreen());
                },

                ),

                SizedBox(height: 10,),

                ResuableHeader(leadingText: 'Date', titleText: 'Inv.No', tralingText: 'Status',),
              ],
            ),
          ),
          SizedBox(height: 10,),

          Expanded(
            child: Obx((){
              switch(summeryVM.rxRequestStatus.value){
                case Status.LOADING:
                  return Center(child:  CircularProgressIndicator(),);

                case Status.ERROR:
                  print("error ${summeryVM.error.value.toString()}");
                  return Text(summeryVM.error.value.toString());

                case Status.SUCCESS:
                  if(summeryVM.summeryListItem.value.items?.length == 0 || summeryVM.summeryListItem.value.items?.length == null){
                    return Text("Item not found, please select date");
                  }else{
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: summeryVM.summeryListItem.value.items?.length,
                        itemBuilder: (context, index){
                          statusId = summeryVM.summeryListItem.value.items?[index].labStatusId;
                          dobs = summeryVM.summeryListItem.value.items?[index]?.invoiceDate;

                          if(statusId == 1){
                            status = "Pending";
                          }
                          else if(statusId == 2){
                            status = "Completed";
                          }
                          else if(statusId == 3){
                            status = "Delivered";
                          }
                          else if(statusId == 4){
                            status = "Collected";
                          }else{
                            status = "Printed";
                          }

                          return  Padding(
                            padding: const EdgeInsets.all(6),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 2, color:  (statusId == 1)? Colors.red : (statusId == 2)? Colors.green : (statusId == 3)? Colors.orange : (statusId == 4)? Colors.blue : Colors.indigo),
                              ),
                              child: ExpansionTile(
                                trailing: Container(
                                    height: 25,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: (statusId == 1)? Colors.red : (statusId == 2)? Colors.green : (statusId == 3)? Colors.orange : (statusId == 4)? Colors.blue : Colors.indigo,
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
                                        child: Text("${status}",
                                            style: Styles.poppinsFont12_600)
                                    )),
                                title: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [

                                        Text(DateFormat('dd-MM-yyyy HH:mm ').format(FunctionClass.dateOfTiemConterter(dobs)), style: Styles.poppinsFontBlack12),
                                        Text("${summeryVM.summeryListItem.value.items?[index].invoiceNo}",
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
                                          "${summeryVM.summeryListItem.value.items?[index].patient?.firstName}",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),


                                  ExpandableSummeryListItem(
                                    name: summeryVM.summeryListItem.value.items?[index].patient?.firstName,
                                    statusId: statusId,
                                    status:  status,
                                    summeryList: summeryVM.summeryListItem.value.items?[index].patientServices,
                                    index: index,
                                  ),


                                ],
                              ),
                            ),
                          );

                        });
                  }

              }
            }),
          )
        ],
      ),
    );
  }

  _showDialog  () async {
    await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(

            builder: (context, setState) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.cancel_presentation, size: 30, color: Colors.red,)),
                ],
              ),

              content: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedButton(
                      width: Get.width * 0.5,
                        title: "Qr code Scanner",
                        color: Styles.primaryColor,
                        onTap: (){

                    }),
                    SizedBox(height: 10,),
                    RoundedButton(
                        width: Get.width * 0.5,
                        title: "Qr code Generator",
                        color: Styles.primaryColor,
                        onTap: (){

                        })

                  ],),
              ),

              actions: [


              ],
            ),
          );
        });
  }


}


