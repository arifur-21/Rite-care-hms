
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/color_styles.dart';

class SearchlistWidget extends StatelessWidget {

  final String id;
  final String name;
  final String relation;
//  final VoidCallback onTap;
  //final bool isSelect = false;


  SearchlistWidget({ required this.id,required this.name,required this.relation});





  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        InkWell(
          onTap: (){

          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.green,width: 2)
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(

                    children: [
                      Text(" $id", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12,color: Styles.drawerListColor),),
                      SizedBox(width: 30,),
                      Column(
                        children: [
                          Text("Name   - $name",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12,color: Styles.drawerListColor)),
                          SizedBox(height: 10,),
                          Text("Relation   -  $relation",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12,color: Styles.drawerListColor)),
                        ],
                      ),
                     /* Column(
                        children: [
                          Text(name, style:TextStyle(fontWeight: FontWeight.w400, fontSize: 12) ,),
                          SizedBox(height: 10,),
                          Text(relation, style:TextStyle(fontWeight: FontWeight.w400, fontSize: 12) ),
                        ],
                      )*/
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
