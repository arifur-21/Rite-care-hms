import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ritecare_hms/utils/color_styles.dart';

import '../lab_test_list_details.dart';


class LabList1CardList extends StatelessWidget {

  String? title;
  String? code;
  String? category;
  double? price;


  LabList1CardList({required this.title,required this.code,required this.category,required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      child: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.all(6),

            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Text(title.toString(),style: Styles.poppinsFontBlack12_400)),
                            Expanded(
                                flex: 1,
                                child: Text(code.toString(), style: Styles.poppinsFontBlack12_400)),
                            Text(category.toString(),style: Styles.poppinsFontBlack12_400)
                    ],))

                  ],
                ),

                SizedBox(height: 16,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Price",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.green)),
                        SizedBox(width: 10,),
                        Text(price.toString(),style: Styles.poppinsFontBlack12_400),
                      ],
                    ),
                    InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LabTestListDetailsScreen() ));
                        },
                        child: Icon(Icons.note_outlined,size: 25,color: Styles.primaryColor,))
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );

  }
}
