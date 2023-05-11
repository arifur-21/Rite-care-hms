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
  dynamic statusId;
  String? status ='';

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

                SampleListFilterWidget(
                  textField1HintText: 'Sample Id',
                  textField2HintText: 'Inv.NO',
                  onClick: () {
                    simpleVM.getSampleListData();
                    Navigator.pop(context);
                  },
                ),

                SizedBox(height: 10,),

                ResuableHeader(leadingText: 'Date', titleText: 'Inv.No', tralingText: 'Status',),
              ],
            ),
          ),
          SizedBox(height: 10,),

          

        ],
      ),
    );
  }


}
