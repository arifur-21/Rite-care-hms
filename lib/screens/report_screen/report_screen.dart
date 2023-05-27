
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/widgets/resuable_header.dart';
import 'package:ritecare_hms/widgets/reuseable_text_filed.dart';

import '../../data/response/status.dart';
import '../../utils/color_styles.dart';
import '../../view_model/summery_view_model/summery_view_model.dart';
import '../lab_test/sample_list/components/expandable_item_sub_list.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final textController = TextEditingController();

  final tableRowDesignVm = Get.put(SummeryViewModel());

  @override
  void initState() {
    tableRowDesignVm.getTableRowDesignItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ResuableHeader(leadingText: 'Test Name', titleText: 'Result', tralingText: 'Unit',),
          SizedBox(height: 10,),

          FutureBuilder(
            future: tableRowDesignVm.getTableRowDesignItem(),
              builder: (context, snapshot){
            return    Expanded(
              child: Obx((){
                switch(tableRowDesignVm.rxRequestStatus.value){
                  case Status.LOADING:
                    return Center(child:  CircularProgressIndicator(),);

                  case Status.ERROR:
                    print("error ${tableRowDesignVm.error.value.toString()}");
                    return Text(tableRowDesignVm.error.value.toString());

                  case Status.SUCCESS:
                    if(tableRowDesignVm.tableRowDesignListItem.value.design?.length == 0){
                      return Text("item not found");
                    }else{
                      return Text("data");
                    }

                }
              }),
            );
          }),


          Padding(
            padding: const EdgeInsets.all(12.0),
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
                        Text("Hemoglobin"),

                Container(
                  height: 60,
                  width: Get.width * 0.4,
                  child: TextFormField(
                    controller: textController,

                    onChanged: (value){

                    },

                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,

                      label: Text("hint"),
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
                        Container(child: Text("g/dl")),
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
                            Text("Male : 12-16"),
                            SizedBox(width: 10,),
                            Text("Female : 15-19"),
                          ],),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
