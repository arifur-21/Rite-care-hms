
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ritecare_hms/screens/lab_test/summery/components/lab12_screen.dart';
import 'package:ritecare_hms/utils/color_styles.dart';
import 'package:ritecare_hms/widgets/reusable_icon_containter.dart';

class ExpandableItemSubList extends StatefulWidget {

  final String? title;
  final String? category;
  final String? name;
  final VoidCallback? onPressed;


  ExpandableItemSubList({this.title, this.category, this.name, this.onPressed});

  @override
  State<ExpandableItemSubList> createState() => _ExpandableItemSubListState();
}

class _ExpandableItemSubListState extends State<ExpandableItemSubList> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 200,
      child:  ListView.separated(
          itemCount: 4,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.title.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(widget.category.toString(),style: TextStyle(fontSize: 16,)),
                      Text(widget.name.toString(),style: TextStyle(fontSize: 16, ))
                    ],),
                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text("3588005-33", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

                      Container(
                          height: 30,
                          width: 140,
                          decoration: BoxDecoration(
                              color: ColorStyles.primaryColor,
                              border: Border(),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Center(child: Text("Complete", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),))

                      ),
                      Row(

                        children: [

                          InkWell(
                            onTap: (){

                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/icons/barcode.png')
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12,),

                          InkWell(
                            onTap: (){

                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/icons/message.png')
                                ),
                              ),
                            ),
                          ),






                          /*ResuableIconContainer(image: 'assets/icons/resume.png'),
                          SizedBox(width: 10,),
                          ResuableIconContainer(image: 'assets/icons/file.png'),
                          SizedBox(width: 10,),
                          ResuableIconContainer(image: 'assets/icons/check.png'),
                          SizedBox(width: 10,),
                          ResuableIconContainer(image: 'assets/icons/printer.png'),*/
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          }, separatorBuilder: (BuildContext context, int index) {
            return Divider( thickness: 2,);
      },),
    );
  }
}
