
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/widgets/resuable_header.dart';
import 'package:ritecare_hms/widgets/reuseable_text_filed.dart';

import '../../data/response/status.dart';
import '../../model/lab_test_model/simple_list_models.dart';
import '../../model/lab_test_model/summery_sub_item_model/lab_report_result_model/lab_report_result_model.dart';
import '../../utils/color_styles.dart';
import '../../view_model/save_edit_lab_report_result_view_model/lab_report_result_view_model.dart';
import '../../view_model/summery_view_model/summery_view_model.dart';
import '../lab_test/sample_list/components/expandable_item_sub_list.dart';

class UpdateReportScreen extends StatefulWidget {

  dynamic serviceId;
  dynamic itemId;
  List<PatientServices>? summeryList;


  UpdateReportScreen({this.serviceId, this.itemId, this.summeryList});

  @override
  State<UpdateReportScreen> createState() => _UpdateReportScreenState();
}

class _UpdateReportScreenState extends State<UpdateReportScreen> {


  final tableRowDesignVm = Get.put(LabReportResultViewModel());
  late List<TextEditingController> listController;
  final addCommentConterller = TextEditingController();
  final addNoteController = TextEditingController();


  bool isToggle = false;

  @override
  void initState() {

   // addCommentConterller.text = tableRowDesignVm.tableRowDesignListItem.value.design![0]?.comment;
   // addNoteController.text = tableRowDesignVm.tableRowDesignListItem.value.design![0]?.opinionText;
    tableRowDesignVm.getLabReportResultData(serviceId: widget?.serviceId, itemId: widget?.itemId);
  // listController = List.generate(tableRowDesignVm.tableRowDesignListItem.value.design!.length, (index) => TextEditingController(text: tableRowDesignVm.tableRowDesignListItem.value.design![index].result));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print(" report item id ${widget?.itemId}");
    print(" report service id11111111 ${widget?.serviceId}");
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ResuableHeader(leadingText: 'Test Name', titleText: 'Result', tralingText: 'Unit',),
            SizedBox(height: 10,),

            ////////////// get lab report data -> -> ///////////
            Container(
              height: Get.height * 0.65,
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

                      return  ListView.builder(
                        shrinkWrap: true,
                          itemCount:tableRowDesignVm.tableRowDesignListItem.value.design?.length,
                          itemBuilder: (context, index){

                            return  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2,
                                      color: Colors.grey),
                                ),
                                child: ExpansionTile(
                                  title: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              flex: 3,
                                              child: Text("${tableRowDesignVm.tableRowDesignListItem.value.design![index]?.name}")),

                                          SizedBox(width: 5,),

                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              height: 50,
                                              width: Get.width * 0.35,

                                              child: TextFormField(
                                                onChanged: (value){
                                                  print("value $value");
                                                },
                                                controller: listController?[index],

                                                decoration: InputDecoration(
                                                  fillColor: Colors.grey.shade100,
                                                  label: Text("Result"),
                                                  labelStyle: TextStyle(color: Styles.primaryColor,fontFamily: 'IstokWeb', fontWeight: FontWeight.w400, fontSize: 16),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(width: 2, color: Styles.primaryColor),
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(width: 2, color: Styles.primaryColor),
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5,),
                                          Expanded(
                                              flex: 1,
                                              child: Text("${tableRowDesignVm.tableRowDesignListItem.value.design![index].unit?.name}")),
                                        ],
                                      )
                                    ],
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Reference Range :",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Styles.textGreen),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("${tableRowDesignVm.tableRowDesignListItem.value.design![index]?.referanceValue}"),
                                                SizedBox(width: 10,),
                                                //  Text("Female : 15-19"),
                                              ],),
                                          )
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            );
                          });
                    }

                }
              }),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:(){
                          setState(() {
                            isToggle = !isToggle;
                          });
                                    },
                          child: Icon(Icons.add)),

                      InkWell(
                          onTap: (){

                            for(TextEditingController controlller in listController){

                              tableRowDesignVm.saveEditLabReportResult(
                                  result:  controlller.text
                              );
                              print("controll data ${controlller.text}");
                            }

                          },
                          child: Icon(Icons.save,size: 30,)),

                    ],
                  ),
                ],
              ),
            ),


        Visibility(
          visible: isToggle,
          child: Column(
            children: [
              _reportAddNoteTextField(controllerValue: addNoteController, hintText: 'add Note'),

              _reportAddNoteTextField(controllerValue: addCommentConterller, hintText: 'Comment',maxLine: 2),
            ],
          ),
        ),

            SizedBox(height: 20,)
          ],
        ),
      ),


    );
  }


  Widget _reportAddNoteTextField({TextEditingController? controllerValue, VoidCallback? onTap, String? hintText, dynamic maxLine}){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: controllerValue,
        maxLines: maxLine,
        onChanged: (value){

        },
        validator: (value){
          if(value!.isEmpty || value == null){
            return "Add note";
          }
        },
        decoration: InputDecoration(

          fillColor: Colors.grey.shade100,
          filled: true,
          label: Text(hintText!),

          labelStyle: TextStyle(color: Styles.primaryColor,fontFamily: 'IstokWeb', fontWeight: FontWeight.w400, fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Styles.primaryColor),
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Styles.primaryColor),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }

}