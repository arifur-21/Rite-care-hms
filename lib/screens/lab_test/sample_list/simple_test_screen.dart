
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ritecare_hms/utils/color_styles.dart';import '../../../data/app_exceptions.dart';
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
   simpleVM.getSampleTestApiData();
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
                        ]
                    ),
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
          SizedBox(height: 10,),



             FutureBuilder<SampleTest>(
                 future: simpleVM.getSampleTestApiData(),
                 builder: (context, snapShot){
              //     print("simpled ${snapShot.data?.items![0].}");

                   if(!snapShot.hasData){
                     return Text("data not found ${snapShot.data}");
                   }else{

                     return Expanded(
                         child: ListView.builder(
                             itemCount: snapShot.data!.items!.length,
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
                                             Text("${snapShot.data!.items![index].invoiceDate}",
                                                 style: Styles.poppinsFontBlack12),
                                             Text("${snapShot.data!.items![index].invoiceNo}",
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
                                               "${snapShot.data!.items![index].patient?.firstName}",
                                               style: TextStyle(fontSize: 12),
                                             ),
                                           ],
                                         ),
                                       ),
                                       ExpandableItemSubList(
                                         title: "CBC",
                                         category: "Hematoloty",
                                         name: snapShot.data!.items![index].patient?.firstName,
                                         sampleList: [snapShot.data!.items!] ,
                                       ),
                                     ],
                                   ),
                                 ),
                               );
                             }));
                   }
                 }),


       /*   Expanded(
            child: FutureBuilder(
                future: simpleVM.getSampleTestStatus(),
                builder: (context, snapShot){
                  if(!snapShot.hasData){
                    return Text("Loading....");
                  }else{
                    return ListView.builder(
                        itemCount: simpleVM.statusList.length,
                        itemBuilder: (context, index){
                          return Text(" ${snapShot.data![index].name}");
                        });
                  }
                }),
          ),*/
        ],
      ),
    );
  }

}


