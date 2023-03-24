
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/color_styles.dart';
import '../../patient_info/patient_details_screen.dart';



class PatientCartListViewWidgets extends StatelessWidget {

  final String patientId;
  final String PatientName;
  final String DateOfBirth;


  PatientCartListViewWidgets({required this.patientId, required this.PatientName, required this.DateOfBirth});

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 6,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(patientId, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: ColorStyles.textGreen),),
                    SizedBox(height: 10,),
                    Text(PatientName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: ColorStyles.textGreen),),
                    SizedBox(height: 10,),
                    Text(DateOfBirth, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: ColorStyles.textGreen),),

                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("93839-393", style: TextStyle( fontSize: 16, color: ColorStyles.textGreen),),
                  SizedBox(height: 10,),
                  Text("Md Abdur Rahim", style: TextStyle( fontSize: 16, color: ColorStyles.textGreen),),
                  SizedBox(height: 10,),
                  Text("13/45/2030", style: TextStyle(fontSize: 16, color: ColorStyles.textGreen),),
                ],)),
          Expanded(
              flex: 1,
              child: Center(
                child: Column(

                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PatientProfileDetailsScreen()));
                      },
                        child: Icon(Icons.add_a_photo, size: 40,))
                  ],
                ),
              )),

        ],
      ),
    );
  }
}
