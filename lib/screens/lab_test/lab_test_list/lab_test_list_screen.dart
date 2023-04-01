
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ritecare_hms/widgets/filter_button.dart';
import 'package:ritecare_hms/screens/lab_test/lab_test_list/components/lab_list1_card_list.dart';

import '../../../utils/color_styles.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/drawer_widget.dart';
import '../../../widgets/popup_button_widget.dart';

class LatTestListScreen extends StatefulWidget {
  const LatTestListScreen({Key? key}) : super(key: key);

  @override
  State<LatTestListScreen> createState() => _LatTestListScreenState();
}

class _LatTestListScreenState extends State<LatTestListScreen> {
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
          FilterContainerBtn(),
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
                        Text("REPORT SERIAL NO",style: Styles.poppinsFont12_500,),
                        Text('CATEGORY',style: Styles.poppinsFont12_500,)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),

             LabList1CardList(title: "Urine Electrolytes", code: 134433333, category: "Biochemistry", price: 350),
             LabList1CardList(title: "Urine Electrolytes", code: 134, category: "Biochemistry", price: 350),



              ],
            ),
          )
        ],
      ),
    );
  }
}
