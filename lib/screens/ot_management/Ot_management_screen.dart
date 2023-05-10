
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:ritecare_hms/model/ot_management_model/ot_list_model.dart';
import 'package:ritecare_hms/screens/ot_management/ot_management_details_screen.dart';
import 'package:ritecare_hms/widgets/resuable_header.dart';

import '../../data/response/status.dart';
import '../../utils/color_styles.dart';
import '../../view_model/ot_management_view_model/ot_list_view_model.dart';
import '../../view_model/user_profile_view_model/user_profile_view_model.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/drawer_widget.dart';

class OtManagementScreen extends StatefulWidget {
  const OtManagementScreen({Key? key}) : super(key: key);

  @override
  State<OtManagementScreen> createState() => _OtManagementScreenState();
}

class _OtManagementScreenState extends State<OtManagementScreen> {

  final otListVM = Get.put(OtListViewModel());
  final userProfileVM = Get.put(UserProfileViewModel());

  dynamic startBtn = 'Start';
  dynamic endBtn = 'End';
  Color? btnColor = Colors.orange;
  bool btnVisibility = true;
  dynamic statusId;
  dynamic status;


  @override
  void initState() {
   // otListVM.getSchedule();
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
          ]
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),

          otListHeaderWidget(),

          calanderDateWidget(),


          ResuableHeader(leadingText: "Surgery", titleText: "Patient", tralingText: "Status"),

          FutureBuilder(
            future: otListVM.getSchedule(),
              builder: (context, snapstho){
              return  Obx((){
                switch(otListVM.rxRequestStatus.value){
                  case Status.LOADING:
                    return Center(child:  CircularProgressIndicator(),);

                  case Status.ERROR:
                    print("error ${otListVM.error.value.toString()}");
                    return Center(child: Text(otListVM.error.value.toString()));

                  case Status.SUCCESS:
                    if(otListVM.otScheduleList.value.items?.length == 0 ){
                      print("ot length ${otListVM.otScheduleList.value.items?.length}");
                      return Center(child: Text("Item not found, Please select date"));
                    }else{
                      return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount:  otListVM.otScheduleList.value.items?.length,
                            itemBuilder: (context, index){
                              return  otListWidget(
                                  title: otListVM.otScheduleList.value.items?[index]?.item?.name,
                                  name: otListVM.otScheduleList.value.items?[index]?.patient?.firstName,
                                  status: otListVM.otScheduleList.value.items?[index]?.surgeryStatus?.name,
                                  surgeryType:otListVM.otScheduleList.value.items?[index]?.surgeryType?.name,
                                  indexNum : index,
                                  noteId: otListVM.otScheduleList.value.items?[index]?.id
                              );
                            }),
                      );
                    }

                }
              });

          })


        ],
      ),
    );
  }

  Widget otListWidget({dynamic? title, dynamic? name, dynamic? status, dynamic? surgeryType,int? indexNum, dynamic noteId}){

    return status == 'Pending' ? SizedBox()  :  Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            height: 125,
            width: double.infinity,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: (status == 'In Progress') ? Colors.red : (status == 'Completed') ? Colors.green : Colors.orange,),
                borderRadius: BorderRadius.circular(6)

            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [

                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text("${title}")),
                      SizedBox(width: 10,),
                      Expanded(child: Text("${name},")),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                            height: 25,
                            width: 100,
                            decoration: BoxDecoration(
                              color:  (status == 'In Progress') ? Colors.red : (status == 'Completed') ? Colors.green : (status == 'Pending') ? Colors.indigo : Colors.orange,
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
                                    style: Styles.poppinsFont12_600))),

                      )
                    ],
                  ),
                  SizedBox(
                    height:  10,
                  ),
                  Divider(height: 1, color: Colors.grey,),
                  SizedBox(
                    height:  10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${surgeryType}"),

                      InkWell(
                        onTap: (){
                          _showDialog(status: status, title: title, name: name, surgeryType: surgeryType, indexNum: indexNum, noteId: noteId);
                        },
                        child: Visibility(
                          visible: (status == 'Completed')? btnVisibility = false : btnVisibility = true,
                          child: Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                color: (status == 'In Progress') ? Colors.red : (status == 'Completed') ? Colors.green : Colors.orange,
                                border: Border(),
                                borderRadius: BorderRadius.circular(6),
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
                                  child: Text("${(status == 'Initiated')? startBtn : (status == 'In Progress') ? endBtn : (status == 'Completed') ? btnVisibility : startBtn }",  style: TextStyle(color:Colors.white)))),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OtManagementDetailsScreen(
                            noteId: noteId,
                          )));
                        },
                          child: Icon(Icons.file_copy_outlined, size: 30,))
                    ],
                  )
                ],
              ),
            )
        ),
      );
  }

Widget calanderDateWidget(){
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 60,
              width: Get.width * 0.45,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Styles.primaryColor),
                  borderRadius: BorderRadius.circular(12)

              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" ${otListVM.startDate.toString()}", style: TextStyle(fontSize: 16, color: Styles.primaryColor),),
                    SizedBox(height: 6,),
                    InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              //get today's date
                              firstDate: DateTime(2000),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                            String formattedDate = DateFormat('yyyy-MM-dd').format(
                                pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                            print(formattedDate); //formatted date output using intl package =>  2022-07-04
                            //You can format date as per your need

                            setState(() {
                              otListVM.startDate = formattedDate;
                              otListVM.getSchedule();
                              //set foratted date to TextField value.
                              print("${otListVM.startDate}");
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },

                        child: Icon(Icons.calendar_month_outlined, size: 40,)),
                  ],
                ),
              )
          ),

          Container(
              height: 60,
              width: Get.width * 0.45,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Styles.primaryColor),
                  borderRadius: BorderRadius.circular(12)

              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" ${otListVM.endDate.toString()}", style: TextStyle(fontSize: 16, color: Styles.primaryColor),),
                    SizedBox(height: 6,),
                    InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              //get today's date
                              firstDate: DateTime(2000),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                            String formattedDate = DateFormat('yyyy-MM-dd').format(
                                pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                            print(
                                formattedDate); //formatted date output using intl package =>  2022-07-04
                            //You can format date as per your need

                            setState(() {
                              otListVM.endDate =
                                  formattedDate; //set foratted date to TextField value.
                              print("${otListVM.endDate}");
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },

                        child: Icon(Icons.calendar_month_outlined, size: 40,)),
                  ],
                ),
              )
          ),

        ],
      ),
    );
}

Widget otListHeaderWidget(){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 60,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("OT LIST", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),

          ],
        ),
      ),
    );
}

  _showDialog({dynamic? title, dynamic? name, dynamic? status, dynamic? surgeryType,int? indexNum, dynamic noteId}) async {
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
                InkWell(
                  onTap: (){

                      if(status == 'Initiated'){
                        print("onclick11");
                        statusId = 103;
                        status = 'In Progress';
                        print("init${statusId}");
                        dynamic aItem = otListVM.otScheduleList.value.items?[indexNum!];
                        aItem?.surgeryStatus?.name = "In Progress";
                        print("items1 ${aItem}");
                      }
                      else if(status == 'In Progress'){
                        statusId = 104;
                        status = 'Completed';
                        print("progressId ${statusId}");
                        dynamic aItem = otListVM.otScheduleList.value.items?[indexNum!];
                        aItem?.surgeryStatus?.name = "Completed";
                        if(btnVisibility == true){
                          btnVisibility = false;
                        }else{
                          btnVisibility = true;
                        }
                      }
                      else if(status == 'Completed'){
                        dynamic id = otListVM.otScheduleList.value.items?[indexNum!].surgeryStatus?.id;
                        print("com${id}");
                      }

                      setState(() {
                        otListVM.operationScheduleStatus(statusId,status, noteId);
                        otListVM.getSchedule();
                          });
                      Navigator.pop(context);


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
