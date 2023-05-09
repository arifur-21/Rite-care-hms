
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ritecare_hms/screens/lab_test/summery/components/lab12_screen.dart';
import 'package:ritecare_hms/utils/color_styles.dart';
import 'package:ritecare_hms/widgets/reusable_icon_containter.dart';

class ExpandableSummeryListItem extends StatefulWidget {

  final String? title;
  final String? category;
  final String? name;
  final VoidCallback? onPressed;
  final dynamic? statusId;
  final String? status;
  bool btnVisibility = false;
  final String? itemName;



  ExpandableSummeryListItem({this.title, this.category, this.name, this.onPressed, this.statusId, this.status, this.itemName});

  @override
  State<ExpandableSummeryListItem> createState() => _ExpandableSummeryListItemState();
}

class _ExpandableSummeryListItemState extends State<ExpandableSummeryListItem> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 220,
      child:  ListView.separated(
          itemCount: 2,
          itemBuilder: (context, index){

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(width: 2, color: Styles.primaryColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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

                          Container(
                              height: 24,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: (widget.statusId == 1)? Colors.red : (widget.statusId == 2)? Colors.green : (widget.statusId == 3)? Colors.orange : (widget.statusId == 4)? Colors.blue : Colors.yellow,
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
                              child: Center(child: Text("${widget.status}", style: Styles.poppinsFont12_600))

                          ),
                          Row(

                            children: [

                              InkWell(
                                onTap: (){

                                },
                                child: Visibility(
                                  visible: (widget.statusId == 1) ? widget.btnVisibility = false :  widget.btnVisibility = false,
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/icons/edit.png')
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12,),

                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Lab12Screen()));
                                },
                                child: Visibility(
                                  visible: (widget.statusId == 1) ? widget.btnVisibility = false :  widget.btnVisibility = false,
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/icons/file.png')
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 12,),
                              InkWell(
                                onTap: (){

                                },
                                child: Visibility(
                                  visible:(widget.statusId == 1) ? widget.btnVisibility = false :  widget.btnVisibility = false,
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/icons/check.png')
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 12,),
                              InkWell(
                                onTap: (){

                                },
                                child: Visibility(
                                  visible: (widget.statusId == 3) ? widget.btnVisibility = true : (widget.statusId == 4) ? widget.btnVisibility = true : (widget.statusId == 2) ? widget.btnVisibility = true : widget.btnVisibility = false,
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/icons/printer.png')
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          )

                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }, separatorBuilder: (BuildContext context, int index) {
            return Container();
      },),
    );
  }
}
