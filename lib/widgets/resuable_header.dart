
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color_styles.dart';

class ResuableHeader extends StatelessWidget {

  final String date;
  final String invNo;
  final String status;


  ResuableHeader({required this.date, required this.invNo,required this.status});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(4),
      child: Card(
        elevation: 8,
        child: Container(
          padding: EdgeInsets.all(10),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Styles.primaryColor
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(date.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
              Text(invNo.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
              Text(status.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
            ],
          ),
        ),
      ),

    );
  }
}
