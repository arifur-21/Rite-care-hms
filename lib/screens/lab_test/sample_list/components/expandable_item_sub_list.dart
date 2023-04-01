
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
                      Text(widget.title.toString(), style: Styles.poppinsFontBlack12_500),
                      Text(widget.category.toString(),style: Styles.poppinsFontBlack12_300),
                      Text(widget.name.toString(),style: Styles.poppinsFontBlack12_300)
                    ],),
                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text("3588005-33", style: Styles.poppinsFontBlack12_600),

                      Container(
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Styles.primaryColor,
                            border: Border(),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                              child: Text("Complete", style: Styles.poppinsFont12_600))

                      ),
                      Row(

                        children: [

                          InkWell(
                            onTap: (){

                            },
                            child: Container(
                              height: 25,
                              width: 25,
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
                              height: 25,
                              width: 25,
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
