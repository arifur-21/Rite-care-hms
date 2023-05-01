
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ritecare_hms/widgets/filter_button.dart';
import 'package:ritecare_hms/screens/lab_test/lab_test_list/components/lab_list1_card_list.dart';

import '../../../data/response/status.dart';
import '../../../model/lab_test_model/lab_test_list_model.dart';
import '../../../utils/color_styles.dart';
import '../../../view_model/summery_view_model/summery_view_model.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/drawer_widget.dart';
import '../../../widgets/popup_button_widget.dart';
import '../../../widgets/resuable_header.dart';
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
  void initState() {
  labTestListVM.getLabTestListData();
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
          SizedBox(height: 20,),
          LabTestListFilterWidget(),
          SizedBox(height: 20,),

          ResuableHeader(leadingText: 'Test Name', titleText: 'Code', tralingText: 'Category',),

      Expanded(
        child: Obx((){
          switch(labTestListVM.rxRequestStatus.value){
            case Status.LOADING:
              return Center(child:  CircularProgressIndicator(),);

            case Status.ERROR:
              print("error ${labTestListVM.error.value.toString()}");
              return Text(labTestListVM.error.value.toString());

            case Status.SUCCESS:
              return ListView.builder(
                itemCount: labTestListVM.labtestListData.value.items?.length,
                  itemBuilder: (context, index){
                return   Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: LabList1CardList(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                            LabTestListDetailsScreen(
                              code: labTestListVM.labtestListData.value.items![index].code,
                              testName: labTestListVM.labtestListData.value.items![index].name,
                              category: labTestListVM.labtestListData.value.items![index].itemCategory!.name,
                              reportSerialNO: labTestListVM.labtestListData.value.items![index].labItemSerialNo,
                              labReportGroup: labTestListVM.labtestListData.value.items![index].labReportGroup,
                              chargePrice: labTestListVM.labtestListData.value.items![index].salePrice,
                              refferCommission: labTestListVM.labtestListData.value.items![index].itemCategory!.referralCommission,
                            ) ));
                      },
                      title: "${labTestListVM.labtestListData.value.items?[index].name}",
                      code: labTestListVM.labtestListData.value.items?[index].code,
                      category:labTestListVM.labtestListData.value.items?[index].itemCategory!.name,
                      price:labTestListVM.labtestListData.value.items?[index].salePrice),
                );
              });
          }
        }),
      )

        ],
      ),
    );
  }
}
