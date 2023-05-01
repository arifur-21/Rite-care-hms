
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
  dynamic startDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  dynamic endDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  dynamic startBtn = 'Start';
  Color? btnColor = Colors.orange;
  bool btnVisibility = true;
  dynamic demoText = 'start';

  @override
  void initState() {
    otListVM.getSchedule();
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

          Obx((){
            switch(otListVM.rxRequestStatus.value){
              case Status.LOADING:
                return Center(child:  CircularProgressIndicator(),);

              case Status.ERROR:
                print("error ${otListVM.error.value.toString()}");
                return Center(child: Text(otListVM.error.value.toString()));

              case Status.SUCCESS:

                print("ot length ${otListVM.otScheduleList.value.items?.length}");
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: otListVM.otScheduleList.value.items?.length,
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
          }),

        ],
      ),
    );
  }

  Widget otListWidget({dynamic? title, dynamic? name, dynamic? status, dynamic? surgeryType,int? indexNum, dynamic noteId}){
    return Padding(
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
                              color:  (status == 'In Progress') ? Colors.red : (status == 'Completed') ? Colors.green : Colors.orange,
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
                          setState(() {
                            print(indexNum);
                            if(status == 'Initiated'){
                              var id = 101;
                              print("progress${id}");
                              dynamic aItem = otListVM.otScheduleList.value.items?[indexNum!];
                              aItem?.surgeryStatus?.name = "In Progress";
                            }
                          if(status == 'In Progress'){
                            var id = 102;
                            print("progress${id}");
                            startBtn = 'End';
                          //  btnColor = Colors.teal;
                           btnVisibility  = !btnVisibility;
                            dynamic aItem = otListVM.otScheduleList.value.items?[indexNum!];
                            aItem?.surgeryStatus?.name = "Completed";
                          } if(status == 'Completed'){
                              var id = 103;
                              print("progress${id}");
                               btnVisibility  = !btnVisibility;
                          }
                          });

                          startBtn = 'End';
                          btnColor = Colors.blue;
                          ///print( aItem?.item?.name);

                         // otListVM.otScheduleList.value.items?[indexNum!]= aItem;


                        },
                        child: Visibility(
                          visible: btnVisibility,
                          child: Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                color: btnColor,
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
                              child: Center(child:
                              Text("${startBtn }",  style: Styles.poppinsFont12_600))),
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

}
