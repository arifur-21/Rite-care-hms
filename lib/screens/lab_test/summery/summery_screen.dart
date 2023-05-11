
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ritecare_hms/utils/color_styles.dart';
import 'package:ritecare_hms/widgets/resuable_header.dart';import '../../../data/app_exceptions.dart';
import '../../../data/response/status.dart';
import '../../../model/lab_test_model/lab_test_list_model.dart';
import '../../../model/lab_test_model/simple_list_models.dart';
import '../../../model/patinet_list_model/patient_list_model.dart';
import '../../../view_model/summery_view_model/summery_view_model.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/drawer_widget.dart';

import '../../../widgets/filter_button.dart';
import '../../../widgets/popup_button_widget.dart';
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
                                        Text("${summeryVM.summeryListItem.value.items?[index].invoiceDate}",
                                            style: Styles.poppinsFontBlack12),
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

                           /* Container(
                              height: 150,
                              child:  ListView.builder(
                                itemCount: summeryVM.summeryListItem.value.items?[index].patientServices?.length ,
                                itemBuilder: (context, index){

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        border: Border.all(width: 2, color: Styles.primaryColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('title', style: Styles.poppinsFontBlack12_500),
                                                Text('category',style: Styles.poppinsFontBlack12_300),
                                                Text('dr.name',style: Styles.poppinsFontBlack12_300)
                                              ],),
                                            SizedBox(height: 20,),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Container(
                                                    height: 24,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      color: (statusId == 1)? Colors.red : (statusId == 2)? Colors.green : (statusId == 3)? Colors.orange : (statusId == 4)? Colors.blue : Colors.yellow,
                                                      border: Border(),
                                                      borderRadius: BorderRadius.circular(50),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.withOpacity(0.5),
                                                          spreadRadius: 3,
                                                          blurRadius: 7,
                                                          offset: Offset(0, 3), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Center(child: Text("${status}", style: Styles.poppinsFont12_600))

                                                ),
                                                Row(

                                                  children: [

                                                    InkWell(
                                                      onTap: (){

                                                      },
                                                      child: Visibility(
                                                       // visible: (widget.statusId == 1) ? widget.btnVisibility = false :  widget.btnVisibility = false,
                                                        child: Container(
                                                          height: 25,
                                                          width: 25,
                                                          decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                fit: BoxFit.cover,
                                                                image: AssetImage('assets/icons/edit.png')
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 12,),

                                                    InkWell(
                                                      onTap: (){
                                                        Navigator.pop(context);
                                                       // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Lab12Screen()));
                                                      },
                                                      child: Visibility(
                                                     //   visible: (widget.statusId == 1) ? widget.btnVisibility = false :  widget.btnVisibility = false,
                                                        child: Container(
                                                          height: 25,
                                                          width: 25,
                                                          decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                fit: BoxFit.cover,
                                                                image: AssetImage('assets/icons/file.png')
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    SizedBox(width: 12,),
                                                    InkWell(
                                                      onTap: (){

                                                      },
                                                      child: Visibility(
                                                       // visible:(widget.statusId == 1) ? widget.btnVisibility = false :  widget.btnVisibility = false,
                                                        child: Container(
                                                          height: 25,
                                                          width: 25,
                                                          decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                fit: BoxFit.cover,
                                                                image: AssetImage('assets/icons/check.png')
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    SizedBox(width: 12,),
                                                    InkWell(
                                                      onTap: (){

                                                      },
                                                      child: Visibility(
                                                      //  visible: (widget.statusId == 3) ? widget.btnVisibility = true : (widget.statusId == 4) ? widget.btnVisibility = true : (widget.statusId == 2) ? widget.btnVisibility = true : widget.btnVisibility = false,
                                                        child: Container(
                                                          height: 25,
                                                          width: 25,
                                                          decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                fit: BoxFit.cover,
                                                                image: AssetImage('assets/icons/printer.png')
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                  ],
                                                )

                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }, ),
                            )*/


                                  ExpandableSummeryListItem(
                                    title: "CBC",
                                    category: "Hematoloty",
                                    name: summeryVM.summeryListItem.value.items?[index].patient?.firstName,
                                    statusId: statusId,
                                    status:  status,
                                    itemLength: summeryVM.summeryListItem.value.items?[index].patientServices?.length,
                                    summeryList: summeryVM.summeryListItem.value.items?[index].patientServices,
                                  )



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


}


