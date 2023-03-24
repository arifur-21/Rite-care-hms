

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ritecare_hms/utils/color_styles.dart';

import '../../../widgets/app_bar_widget.dart';
import 'components/expandable_list_widget.dart';
import '../../../widgets/drawer_widget.dart';
import '../../../widgets/filter_button.dart';
import '../../../widgets/popup_button_widget.dart';
import '../summery/components/lab12_screen.dart';


class SimpleTestScreen extends StatefulWidget {
  const SimpleTestScreen({Key? key}) : super(key: key);

  @override
  State<SimpleTestScreen> createState() => _SimpleTestScreenState();
}

class _SimpleTestScreenState extends State<SimpleTestScreen> {


  var dropDownItemValue;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: Drawer(

        child:DrawerWidget(),
      ),

      appBar: AppBar(
        backgroundColor: ColorStyles.primaryColor,
        actions: [
          AppBarWidget(),

          PopUpButtonWidget()
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [


                  SizedBox(height: 10,),

                  FilterContainerBtn(),

                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: ColorStyles.primaryColor
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("DATE", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                          Text("INV.NO", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                          Text("STATUS", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                        ],
                      ),
                    ),

                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),

            ExpandableListeWidget()

          ],
        ),
      ),
    );
  }

}


