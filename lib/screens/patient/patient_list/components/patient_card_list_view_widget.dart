
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/color_styles.dart';
import '../../patient_info/patien_info_screen.dart';
import 'package:intl/intl.dart';



class PatientCartListViewWidgets extends StatefulWidget {

  final dynamic patientId;
  final String PatientName;
  final dynamic? DateOfBirth;
  final VoidCallback onTap;



  PatientCartListViewWidgets({required this.patientId, required this.PatientName, required this.DateOfBirth, required this.onTap});

  @override
  State<PatientCartListViewWidgets> createState() => _PatientCartListViewWidgetsState();
}

class _PatientCartListViewWidgetsState extends State<PatientCartListViewWidgets> {

  late DateTime tiem;
  @override
  void initState() {
    tiem = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 4,
      child: Row(
        children: [

          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Patient Id", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Styles.textGreen),),
                    SizedBox(height: 10,),
                    Text("Patient Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Styles.textGreen),),
                    SizedBox(height: 10,),

                    Text("Date of Birth", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Styles.textGreen),),

                  ],
                ),
              )),

          Expanded(
              flex: 3,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.patientId, style: TextStyle( fontSize: 16, color: Styles.textGreen),),
                  SizedBox(height: 10,),

                  Text(widget.PatientName, style: TextStyle( fontSize: 16, color: Styles.textGreen),),
                  SizedBox(height: 10,),

                  Text(widget.DateOfBirth, style: TextStyle(fontSize: 16, color: Styles.textGreen),),
                ],)),
          Expanded(
              flex: 1,
              child: Center(
                child: Column(

                  children: [
                    InkWell(
                      onTap: widget.onTap,
                        child: Icon(Icons.file_copy_outlined, size: 30,))
                  ],
                ),
              )),

        ],
      ),
    );
  }
}
