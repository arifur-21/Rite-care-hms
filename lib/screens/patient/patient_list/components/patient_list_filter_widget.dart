import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ritecare_hms/model/register/PatientRegisterModel.dart';
import 'package:ritecare_hms/utils/color_styles.dart';

import '../../../../data/response/status.dart';
import '../../../../view_model/patient_register_view_model/patient_register_view_model.dart';
import '../../../../view_model/summery_view_model/summery_view_model.dart';
import '../../../../widgets/end_date_calendar_widget.dart';
import '../../../../widgets/start_date_calendar_widget.dart';
import '../../../../widgets/resueable_filter_text_filed_widget.dart';

class PatientListFilterWidget extends StatefulWidget {
  const PatientListFilterWidget({Key? key}) : super(key: key);

  @override
  State<PatientListFilterWidget> createState() => _PatientListFilterWidgetState();
}

class _PatientListFilterWidgetState extends State<PatientListFilterWidget> {

  final summeryVm = Get.put(SummeryViewModel());
  final registerVm = Get.put(PatientRegisterViewModel());


  // this variable holds the selected items
  final List<String> _selectedItems = [];
  bool isCheckeds = false;
  @override
  void initState() {
    registerVm.bloodGroup();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [


            ///filter container
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    _showDialog();
                  },
                  child: Container(
                      height: 60,
                      width: Get.width * 0.4,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 26,
                            width: 26,
                            decoration: BoxDecoration(

                              image: DecorationImage(
                                  image: AssetImage('assets/images/filter.png')
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Text("Filter", style: Styles.poppinsFont14_600),
                          SizedBox(width: 20,),
                          Image.asset('assets/images/delete.png', height: 50,),

                        ],
                      )
                  ),
                ),

              ],
            ),
          ],),
      ),
    );
  }

  _showDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            /// you need to use `StatefulBuilder`'s setState to update dialog ui
            // therefor I am passing this setState to `_showDatePicker`
            builder: (context, setState) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: _cancel,
                      child: Icon(
                        Icons.cancel_presentation, size: 30, color: Colors.red,)),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ExpansionTile(
                      leading: Text("Status", style: Styles.poppinsFontBlack12_400),
                      title: Text(""),
                      children: [
                        SizedBox(height: 10,),
                        Divider(height: 2, color: Colors.grey,),
                        SizedBox(height: 5,),
                        Column(
                          children: [
                            ListBody(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 150,
                                      child:
                                      FutureBuilder(
                                          future: registerVm.bloodGroup(),
                                          builder: (context, snapshot){
                                            if(snapshot.hasError){
                                              return Text("error dat");
                                            }else{
                                              return ListView.builder(
                                                  itemBuilder: (context, index){
                                                Text("${snapshot.data[index].d}");
                                              });
                                                Text("data");
                                            }
                                            return  Expanded(
                                              child: Obx((){
                                                switch(registerVm.rxRequestStatus.value){
                                                  case Status.LOADING:
                                                    return Center(child:  CircularProgressIndicator(),);

                                                  case Status.ERROR:
                                                    print("error ${registerVm.error.value.toString()}");
                                                    return Text(registerVm.error.value.toString());

                                                  case Status.SUCCESS:
                                                    if(registerVm.bloodGroupList.value.length == 0){
                                                      print("data not found");
                                                      return Text("data not found");
                                                    }
                                                    else{
                                                      return Text('data'); ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount: registerVm.bloodGroupList.value.length,
                                                          itemBuilder: (context, index) {
                                                            print("blood length ${registerVm.bloodGroupList.value.length}");
                                                            return ListTile(
                                                              title: Padding(
                                                                padding: const EdgeInsets
                                                                    .all(8.0),
                                                                child: InkWell(
                                                                    onTap: () {
                                                                      // summeryVm.statusId = summeryVm.sampleListFilterStatus[index].id;
                                                                      print("lab test status = ${registerVm.bloodGroupList[index].id}");
                                                                      //  itemId = registerVm.bloodGroupList[index].id!;
                                                                    },
                                                                    child: Text("${registerVm.bloodGroupList[index].name}")),
                                                              ),
                                                            );
                                                          });
                                                    }
                                                }
                                              }),
                                            );
                                          })

                                    ),
                                  ],
                                )
                              ],
                            ),

                          ],
                        ),
                      ],

                    ),

                  ],
                ),
              ),
              actions: [

                StartDateCalendarWidget(),

                SizedBox(height: 10,),
                EndDateCalendarWidget(),
                SizedBox(height: 10,),

                Column(
                  children: [
            ///        ResueableFilterTextFieldWidget(controllerValue: summeryVm.sampleIdController.value,hintText: "type Unit Name",),

                  ],
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context, _selectedItems);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.red, width: 2)

                      ),
                      child: InkWell(
                          onTap: () {


                          },
                          child: Center(
                              child: Text(
                                "Go", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.red),))),
                    ),
                  ),
                ),

              ],
            ),
          );
        });
  }


  void _cancel() {
    Navigator.pop(context);
  }


}





