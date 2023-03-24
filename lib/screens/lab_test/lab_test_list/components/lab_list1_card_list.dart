import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../lab_test_list_details.dart';


class LabList1CardList extends StatelessWidget {

  String? title;
  int? code;
  String? category;
  int? price;


  LabList1CardList({required this.title,required this.code,required this.category,required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(

          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title.toString(),style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),),
                    Text(code.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)),
                    Text(category.toString(),style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black))
                  ],
                ),

                SizedBox(height: 16,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Price",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                        SizedBox(width: 10,),
                        Text(price.toString(),style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)),
                      ],
                    ),
                    InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LabTestListDetailsScreen() ));
                        },
                        child: Icon(Icons.note_outlined))
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
