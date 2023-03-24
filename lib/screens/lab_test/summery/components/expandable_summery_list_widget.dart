
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ritecare_hms/screens/lab_test/summery/components/expandable_summery_list_item_widget.dart';
import 'package:ritecare_hms/utils/color_styles.dart';




class ExpandableSummeryListeWidget extends StatefulWidget {



  @override
  State<ExpandableSummeryListeWidget> createState() => _ExpandableSummeryListeWidgetState();
}

class _ExpandableSummeryListeWidgetState extends State<ExpandableSummeryListeWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index){
              return Card(
                elevation: 5,
                child: ExpansionTile(
                  trailing:Container(
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border(),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(child: Text("Collection", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),))

                  ),
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("12-34-0202",style: TextStyle(fontSize: 16),),
                          Text("1000330",style: TextStyle(fontSize: 16)),
                        ],
                      )
                    ],
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Text("PATIENT :",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: ColorStyles.textGreen),),
                          SizedBox(width: 10,),
                          Text("Abdur Rahim ",style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                    ExpandableSummeryListItem(
                      title: "CBC",
                      category: "Hematoloty",
                      name: "Abdul Ali",
                    ),


                  ],
                ),
              );
            }));
  }
}
