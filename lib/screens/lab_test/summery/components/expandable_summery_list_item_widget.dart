
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ritecare_hms/model/lab_test_model/summery_model.dart';
import 'package:ritecare_hms/model/lab_test_model/summery_sub_item_model/lab_report_result_model/lab_report_result_model.dart';
import 'package:ritecare_hms/screens/lab_test/summery/components/lab12_screen.dart';
import 'package:ritecare_hms/utils/color_styles.dart';
import 'package:ritecare_hms/widgets/reusable_icon_containter.dart';

import '../../../../data/response/status.dart';
import '../../../../view_model/save_edit_lab_report_result_view_model/lab_report_result_view_model.dart';
import '../../../../view_model/summery_view_model/summery_view_model.dart';
import '../../../report_screen/report_screen.dart';
import 'package:http/http.dart' as http;

import '../lab_report_result_print_screem.dart';

class ExpandableSummeryListItem extends StatefulWidget {

  final String? name;
  final VoidCallback? onPressed;
  final dynamic? statusId;
  final String? status;
  bool btnVisibility = false;
  List<PatientServices>? summeryList;
  dynamic index;
  dynamic userTenentId;
  dynamic userSPermissionId;





  ExpandableSummeryListItem({ this.name, this.onPressed, this.statusId, this.status, this.summeryList, this.index, this.userTenentId, this.userSPermissionId});

  @override
  State<ExpandableSummeryListItem> createState() => _ExpandableSummeryListItemState();
}

class _ExpandableSummeryListItemState extends State<ExpandableSummeryListItem> {

  final summeryVm = SummeryViewModel();
  final tableRowDesignVm = Get.put(LabReportResultViewModel());
  String? status;
  dynamic statusId;

  dynamic itemId;
  dynamic serviceId;
  dynamic pS_TenentId; //pS-> patient service
  dynamic lU_TenentId; //lU-> logged in user
  dynamic uS_providerSingPId; // User.ServiceProviderSignPermission.Id
  dynamic pS_signApprovedBy; //patientservice.SignApprovedBy
  dynamic pS_labStatusId; //patientservice.LabStatusId
  dynamic labStatusCompleted; //LabStatusCompleted
  dynamic labStatusPrinted; //LabStatusPrinted



  @override
  void initState() {
    summeryVm.getLoggedInUserData();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    print("user tenent id123 ${widget.userTenentId}");
    print("user permission ${widget.userSPermissionId}");
   // print("data${  tableRowDesignVm.tableRowDesignListItem.value.design![0].unit?.name}");
    return  Column(
      children: [
        Container(
          height: 150,
          child:  ListView.builder(
              itemCount: widget.summeryList?.length,
              itemBuilder: (context, index){


                statusId = widget.summeryList![index].labStatusId;
                itemId = widget.summeryList![index].itemId;
                serviceId = widget.summeryList![index].patient?.serviceId;
                pS_TenentId = widget.summeryList![index].patient?.tenantId;
                pS_labStatusId = serviceId = widget.summeryList![index]?.labStatusId;
                pS_signApprovedBy = serviceId = widget.summeryList![index]?.signApprovedBy;


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
                }else if(statusId == 5){
                  status = "Printed";
                }

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
                              Expanded(
                                flex: 1,
                                  child: Text("${widget.summeryList![index].item?.name}", style: Styles.poppinsFontBlack12_500)),
                              SizedBox(width: 10,),
                              Expanded(
                                  flex: 1,
                                  child: Text("${widget.summeryList![index].doctorName}",style: Styles.poppinsFontBlack12_300)),
                              SizedBox(width: 10,),
                              Expanded(
                                flex: 1,
                                  child: Text("${widget.summeryList![index].item?.itemCategory?.name}",style: Styles.poppinsFontBlack12_300))

                            ],),
                          SizedBox(height: 20,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Container(
                                  height: 24,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: (widget.statusId == 1)? Colors.red : (widget.statusId == 2)? Colors.green : (widget.statusId == 3)? Colors.orange : (widget.statusId == 4)? Colors.blue : Colors.indigo,
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
                                  child: Center(child: Text("$status", style: Styles.poppinsFont12_600))

                              ),




                              ((pS_TenentId == widget.userTenentId) && (widget.userSPermissionId >0) && (pS_signApprovedBy == 0) && (pS_labStatusId == 2 || pS_labStatusId == 5)) ?
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: (){
                                         _showDialog(
                                          status1: status,
                                          statusId1: statusId
                                        );

                                      setState(() {
                                        if(statusId == 2){
                                          statusId = 5;
                                          status = "Printed";
                                        }else{
                                          status = "not found";
                                        }
                                      });


                                    },
                                    child: Visibility(
                                      visible: (widget.statusId == 3) ? widget.btnVisibility = false : (widget.statusId == 2) ? widget.btnVisibility = true : (widget.statusId == 5) ? widget.btnVisibility = false : widget.btnVisibility = false,
                                      child: Text("Mark as Printed"),
                                    ),
                                  ),

                                  SizedBox(width: 10,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ReportScreen(
                                        itemId: itemId,
                                        serviceId: serviceId,
                                      )));
                                    },
                                    child: Visibility(
                                      visible: (widget.statusId == 1) ? widget.btnVisibility = false : (widget.statusId == 4) ? widget.btnVisibility = true : (widget.statusId == 2) ? widget.btnVisibility = true : widget.btnVisibility = false,
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
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Lab12Screen()));
                                    },
                                    child: Visibility(
                                      visible: (widget.statusId == 1) ? widget.btnVisibility = false : (widget.statusId == 2) ? widget.btnVisibility = true : (widget.statusId == 4) ? widget.btnVisibility = true :  widget.btnVisibility = false,
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

                                      _showDialog();
                                    },
                                    child: Visibility(
                                      visible:(widget.statusId == 1) ? widget.btnVisibility = false : (widget.statusId == 2) ? widget.btnVisibility = true : (widget.statusId == 5) ? widget.btnVisibility = true : widget.btnVisibility = false,
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage('assets/icons/correct.png')
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
                                      visible: (widget.statusId == 3) ? widget.btnVisibility = true : (widget.statusId == 2) ? widget.btnVisibility = false : (widget.statusId == 5) ? widget.btnVisibility = true : widget.btnVisibility = false,
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
                                  SizedBox(width: 12,),

                                  InkWell(
                                    onTap: (){
                                      _showDialog();
                                    },
                                    child: Visibility(
                                      visible: (widget.statusId == 3) ? widget.btnVisibility = false : (widget.statusId == 2) ? widget.btnVisibility = false : (widget.statusId == 5) ? widget.btnVisibility = true : widget.btnVisibility = false,
                                      child: Text("Mark as Delivered"),
                                    ),
                                  ),


                                ],
                              ) :
                              Row(children: [
                                  InkWell(
                                    onTap: (){
                                        _showDialog(
                                          status1: status,
                                          statusId1: statusId
                                        );

                                      setState(() {
                                        if(statusId == 2){
                                          statusId = 5;
                                          status = "Printed";
                                        }else{
                                          status = "not found";
                                        }
                                      });


                                    },
                                    child: Visibility(
                                      visible: (widget.statusId == 3) ? widget.btnVisibility = false : (widget.statusId == 2) ? widget.btnVisibility = true : (widget.statusId == 5) ? widget.btnVisibility = false : widget.btnVisibility = false,
                                      child: Text("Mark as Printed"),
                                    ),
                                  ),

                                  SizedBox(width: 10,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ReportScreen(
                                        itemId: itemId,
                                        serviceId: serviceId,
                                      )));
                                    },
                                    child: Visibility(
                                      visible: (widget.statusId == 1) ? widget.btnVisibility = false : (widget.statusId == 4) ? widget.btnVisibility = true : (widget.statusId == 2) ? widget.btnVisibility = true : widget.btnVisibility = false,
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
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Lab12Screen()));
                                    },
                                    child: Visibility(
                                      visible: (widget.statusId == 1) ? widget.btnVisibility = false : (widget.statusId == 2) ? widget.btnVisibility = true : (widget.statusId == 4) ? widget.btnVisibility = true :  widget.btnVisibility = false,
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
                                     Get.to(LabReportResultPrintScreen(
                                       desing: tableRowDesignVm.tableRowDesignListItem.value.design,
                                     ));
                                      /* _printAlertDialog(
                                        design: tableRowDesignVm.tableRowDesignListItem.value.design
                                      );*/
                                    },
                                    child: Visibility(
                                      visible: (widget.statusId == 3) ? widget.btnVisibility = true : (widget.statusId == 2) ? widget.btnVisibility = false : (widget.statusId == 5) ? widget.btnVisibility = true : widget.btnVisibility = false,
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
                                  SizedBox(width: 12,),

                                  InkWell(
                                    onTap: (){
                                      _showDialog();
                                    },
                                    child: Visibility(
                                      visible: (widget.statusId == 3) ? widget.btnVisibility = false : (widget.statusId == 2) ? widget.btnVisibility = false : (widget.statusId == 5) ? widget.btnVisibility = true : widget.btnVisibility = false,
                                      child: Text("Mark as Delivered"),
                                    ),
                                  ),


                                ],),



                           /*   Expanded(
                                child: Obx((){
                                  switch(tableRowDesignVm.rxRequestStatus.value){
                                    case Status.LOADING:
                                      return Center(child:  CircularProgressIndicator(),);

                                    case Status.ERROR:
                                      print("error ${tableRowDesignVm.error.value.toString()}");
                                      return Text(tableRowDesignVm.error.value.toString());

                                    case Status.SUCCESS:
                                      if(tableRowDesignVm.tableRowDesignListItem.value.design?.length == null || tableRowDesignVm.tableRowDesignListItem.value.design?.length == 0){
                                        return Text("item not found");
                                      }else{
                                        //  print(("length ${tableRowDesignVm.tableRowDesignListItem.value.design?.length} "));
                                        return  ListView.builder(
                                            itemCount: tableRowDesignVm.tableRowDesignListItem.value.design!.length,
                                            itemBuilder: (context, index){
                                              Text("${tableRowDesignVm.tableRowDesignListItem.value.design![index]?.name}");
                                              return  SizedBox();
                                            });
                                      }

                                  }
                                }),
                              ),*/


                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }, ),
        ),
],
    );
  }

  _showDialog  ({ dynamic? name, dynamic? status1, dynamic? statusId1,int? indexNum, dynamic noteId}) async {
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
                    Text("Do you want to change status"),
                    SizedBox(height: 10,),
                    Text(" ${status}", style: TextStyle(color: Colors.red,fontSize: 20, fontWeight: FontWeight.w800),),
                  ],),
              ),

              actions: [
                InkWell (
                    onTap: (){
                      setState(() {
                        if(status1 == 'Completed'){
                          statusId = 5;
                          status = 'Printed';
                          print("status ${status}");
                        }

                        else {
                          Text("item not found");
                        }
                     //  summeryVm.updatePatientServiceMarkAsPrintStatus(statusId, status);
                        //otListVM.operationScheduleStatus(statusId,status, noteId);
                        //   otListVM.getSchedule();
                      });
                    //  Navigator.pop(context);


                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Confrom', style: TextStyle(fontSize: 20),),
                    )),

              ],
            ),
          );
        });
  }


  _printAlertDialog  ({ List<Design>? design}) async {
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

              content:
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index){

                      return Text("data ${design![0].name}");
                    }),
              ),
                //Text("data ${design![0].name}"),

              actions: [
                InkWell (
                    onTap: (){
                     
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Confrom', style: TextStyle(fontSize: 20),),
                    )),

              ],
            ),
          );
        });
  }
}
