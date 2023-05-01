
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
import '../summery/components/expandable_summery_list_item_widget.dart';
import 'components/expandable_item_sub_list.dart';
import 'components/sample_filter_widget.dart';
import 'package:http/http.dart' as http;


class SampleList extends StatefulWidget {
  const SampleList({Key? key}) : super(key: key);

  @override
  State<SampleList> createState() => _SampleListState();
}

class _SampleListState extends State<SampleList> {

  var colors = Styles.primaryColor;

  final simpleVM = Get.put(SummeryViewModel());


  Object dataList = [];

  @override
  void initState() {
   simpleVM.getSampleListData();
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

                SampleListFilterWidget(),

                SizedBox(height: 10,),

                ResuableHeader(leadingText: 'Date', titleText: 'Inv.No', tralingText: 'Status',),
              ],
            ),
          ),
          SizedBox(height: 10,),

          Expanded(
            child: FutureBuilder(
                future: simpleVM.getSampleListData(),
                builder: (context, snapshot){
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: simpleVM.sampleListItem.value.items?.length,
                      itemBuilder: (context, index){
                        print("sample length ${simpleVM.sampleListItem.value.items?.length}");
                        return  Padding(
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
                                      Text("${simpleVM.sampleListItem.value.items?[index].invoiceDate}",
                                          style: Styles.poppinsFontBlack12),
                                      Text("${simpleVM.sampleListItem.value.items?[index].invoiceNo}",
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
                                        "${simpleVM.sampleListItem.value.items![index].patient?.firstName}",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                ExpandableItemSubList(
                                  title: "CBC",
                                  category: "Hematoloty",
                                  name: simpleVM.sampleListItem.value.items![index].patient?.firstName,
                                  sampleList: [simpleVM.sampleListItem.value.items!] ,
                                ),
                              ],
                            ),
                          ),
                        );


       /*
                          Obx((){
                          switch(simpleVM.rxRequestStatus.value){
                            case Status.LOADING:
                              return Center(child:  CircularProgressIndicator(),);

                            case Status.ERROR:
                              print("error ${simpleVM.error.value.toString()}");
                              return Text(simpleVM.error.value.toString());

                            case Status.SUCCESS:
                              return


                          }
                        });*/
                      });


                }),
          )
        ],
      ),
    );
  }

}


