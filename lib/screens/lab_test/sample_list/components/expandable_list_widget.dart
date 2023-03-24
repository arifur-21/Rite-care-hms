
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'expandable_item_sub_list.dart';

class ExpandableListeWidget extends StatefulWidget {



  @override
  State<ExpandableListeWidget> createState() => _ExpandableListeWidgetState();
}

class _ExpandableListeWidgetState extends State<ExpandableListeWidget> {
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

                    ExpandableItemSubList(
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
