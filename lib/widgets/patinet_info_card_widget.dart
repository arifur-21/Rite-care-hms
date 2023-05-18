import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientInfoCardWidget extends StatefulWidget {

  final dynamic? patientId;
  final dynamic? patientName;
  final dynamic? patientOfficalNo;
  final dynamic? patientCellNO;


  PatientInfoCardWidget({this.patientId, this.patientName, this.patientOfficalNo,
      this.patientCellNO});

  @override
  State<PatientInfoCardWidget> createState() => _PatientInfoCardWidgetState();
}

class _PatientInfoCardWidgetState extends State<PatientInfoCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("ID", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                              SizedBox(width: 8,),
                              Text(":",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Name",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(width: 10,),
                              Text(":",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            ],
                          )



                        ],)),

                  Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${widget.patientId}', style: TextStyle(fontSize: 16),),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Text("${widget.patientName}",style: TextStyle(fontSize: 16))),
                            ],
                          )

                        ],)),
                  Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("CELL NO", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                              SizedBox(width: 8,),
                              Text(":",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Offical NO",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(width: 8,),
                              Text(":",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            ],
                          )

                        ],)),
                  Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Text("${widget.patientCellNO}", style: TextStyle(fontSize: 16),)),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Text("${widget.patientOfficalNo}",style: TextStyle(fontSize: 16))),
                            ],
                          )

                        ],)),

                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.edit),
                  SizedBox(width: 10,),
                  InkWell(
                      onTap: (){
                        setState(() {
                         // data.removeAt(index);
                        });
                      },
                      child: Icon(Icons.cancel_presentation))
                ],)

            ],
          ),
        ),
      ),
    );
  }
}
