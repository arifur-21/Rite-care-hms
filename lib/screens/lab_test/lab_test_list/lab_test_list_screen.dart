
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ritecare_hms/widgets/filter_button.dart';
import 'package:ritecare_hms/screens/lab_test/lab_test_list/components/lab_list1_card_list.dart';

import '../../../model/lab_test_model/lab_test_list_model.dart';
import '../../../utils/color_styles.dart';
import '../../../view_model/summery_view_model/summery_view_model.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/drawer_widget.dart';
import '../../../widgets/popup_button_widget.dart';
import '../sample_list/components/sample_filter_widget.dart';
import 'components/lab_test_list_filter_widget.dart';
import 'lab_test_list_details.dart';

class LatTestListScreen extends StatefulWidget {
  const LatTestListScreen({Key? key}) : super(key: key);

  @override
  State<LatTestListScreen> createState() => _LatTestListScreenState();
}

class _LatTestListScreenState extends State<LatTestListScreen> {

  final labTestListVM = Get.put(SummeryViewModel());

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
          SizedBox(height: 20,),
          LabTestListFilterWidget(),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: double.infinity,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Styles.primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("TEST NAME", style: Styles.poppinsFont12_500,),
                        Text("Code",style: Styles.poppinsFont12_500,),
                        Text('CATEGORY',style: Styles.poppinsFont12_500,)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),



              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<LabTestListModel>(
                future: labTestListVM.getLabTestList(),
                builder: (context, snapShot){
                  if(!snapShot.hasData){
                    return Text("data not found11 ");
                  }else{
                    return ListView.builder(
                        itemCount: snapShot.data!.items!.length,
                        itemBuilder: (context, index){
                          return   Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: LabList1CardList(
                              onTap: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                                   LabTestListDetailsScreen(
                                     code: snapShot.data!.items![index].code,
                                     testName: snapShot.data!.items![index].name,
                                     category: snapShot.data!.items![index].itemCategory!.name,
                                     reportSerialNO: snapShot.data!.items![index].labItemSerialNo,
                                     labReportGroup: snapShot.data!.items![index].labReportGroup,
                                     chargePrice: snapShot.data!.items![index].salePrice,
                                     refferCommission: snapShot.data!.items![index].itemCategory!.referralCommission,
                                   ) ));
                                 },
                                title: "${snapShot.data!.items![index].name}",
                                code: snapShot.data!.items![index].code,
                                category:  snapShot.data!.items![index].itemCategory!.name,
                                price: snapShot.data!.items![index].salePrice),
                          );

                        });
                  }
                }),
          ),

        ],
      ),
    );
  }
}
