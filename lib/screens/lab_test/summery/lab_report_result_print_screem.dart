import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ritecare_hms/widgets/resuable_header.dart';

import '../../../model/lab_test_model/summery_sub_item_model/lab_report_result_model/lab_report_result_model.dart';

class LabReportResultPrintScreen extends StatefulWidget {

  List<Design>? desing;


  LabReportResultPrintScreen({required this.desing});



  @override
  State<LabReportResultPrintScreen> createState() => _LabReportResultPrintScreenState();
}

class _LabReportResultPrintScreenState extends State<LabReportResultPrintScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [

            ResuableHeader(leadingText: "Test", titleText: "Result", tralingText: "Reference Value"),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text("Report", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, letterSpacing: 8, ),),
                  SizedBox(height: 10,),
                  Divider(height: 2,color: Colors.grey,),
                  SizedBox(height: 20,),


                  ListView.separated(
                    shrinkWrap: true,
                      itemCount: widget.desing!.length,
                      itemBuilder: (context, index){

                        return  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: Text("${widget.desing![index].name}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),)),
                              SizedBox(width: 10,),
                              Expanded(
                                  flex:1,
                                  child:
                                  Row(
                                    children: [
                                      Text("${widget.desing![index].result}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),),
                                      SizedBox(width: 5,),
                                      Text("${widget.desing![index].unit?.name}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),),
                                    ],
                                  )),
                              SizedBox(width: 10,),
                              Expanded(
                                  flex:1,
                                  child: Text("${widget.desing![index].referanceValue}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),)),

                            ],
                          ),
                        );

                  }, separatorBuilder: (context, index){
                    return Divider(height: 2, color: Colors.grey,);
                  }, )
                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}
