import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ritecare_hms/model/lab_test_model/summery_sub_item_model/lab_test_name_sugg_model.dart';
import 'package:ritecare_hms/utils/color_styles.dart';

import '../../../../data/response/status.dart';
import '../../../../view_model/summery_view_model/summery_view_model.dart';
import '../../../../widgets/end_date_calendar_widget.dart';
import '../../../../widgets/start_date_calendar_widget.dart';
import '../../../../widgets/resueable_filter_text_filed_widget.dart';
import 'package:http/http.dart' as http;

class SummeryListFilterWidget extends StatefulWidget {
  String textField1HintText;
  String textField2HintText;
  final VoidCallback  onClick;
  final VoidCallback  qrOnClick;


  SummeryListFilterWidget({required this.textField1HintText, required this.textField2HintText, required this.onClick, required this.qrOnClick});

  @override
  State<SummeryListFilterWidget> createState() => _SummeryListFilterWidgetState();
}

class _SummeryListFilterWidgetState extends State<SummeryListFilterWidget> {

  final summeryVm = Get.put(SummeryViewModel());


  // this variable holds the selected items
  final List<String> _selectedItems = [];
  bool isCheckeds = false;
  dynamic statusId = 0;
  bool isClick = true;
  bool isCancel = false;

  dynamic labTestSuggName;
  dynamic labTestSuggNameId;


  @override
  void initState() {
    summeryVm.getSampleListFilterStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //bar code ui
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 42,
                  width: 100,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          bottomLeft: Radius.circular(6))
                  ),
                  child: Text(
                    "INV NO",
                    style: Styles.poppinsFont14_600,
                  ),
                ),

                InkWell(
                  onTap: widget.qrOnClick ,
                  child: Container(
                      height: 42,
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(6),
                              bottomRight: Radius.circular(6))
                      ),
                      child: Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(

                          image: DecorationImage(
                              image: AssetImage('assets/icons/qrcode.png')
                          ),
                        ),
                      )

                  ),
                ),
              ],
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isCancel = true;
                      _showDialog();
                    });


                  },
                  child: Container(
                    height: 42,
                    width: Get.width * 0.35,
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 26,
                          width: 26,
                          decoration: BoxDecoration(

                            image: DecorationImage(
                                image: AssetImage('assets/images/filter.png')
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text("Filter", style: Styles.poppinsFont14_600),
                        SizedBox(width: 20,),
                        Visibility(
                            visible: isCancel,
                            child: InkWell(
                                onTap: (){
                                  setState(() {
                                    summeryVm.startDate =  DateFormat("yyyy-MM-dd").format(DateTime.now());
                                    summeryVm.endDate =  DateFormat("yyyy-MM-dd").format(DateTime.now());

                                    summeryVm.getSummeryListData();

                                    isCancel = false;
                                  });

                                },
                                child: Image.asset('assets/images/delete.png', height: 50,))),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          ],),
      ),
    );
  }

  _showDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            /// you need to use `StatefulBuilder`'s setState to update dialog ui
            // therefor I am passing this setState to `_showDatePicker`
            builder: (context, setState) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: _cancel,
                      child: Icon(
                        Icons.cancel_presentation, size: 30, color: Colors.red,)),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ExpansionTile(
                      leading: Text("Status", style: Styles.poppinsFontBlack12_400),
                      title: Text(""),
                      children: [
                        SizedBox(height: 10,),
                        Divider(height: 2, color: Colors.grey,),
                        SizedBox(height: 5,),
                        Column(
                          children: [
                            ListBody(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 150,
                                      child:  FutureBuilder(
                                        future: summeryVm.getSampleListFilterStatus(),
                                          builder: (context, snapshot){
                                          return Obx((){
                                            switch(summeryVm.rxRequestStatus.value){
                                              case Status.LOADING:
                                                return Center(child:  CircularProgressIndicator(),);

                                              case Status.ERROR:
                                                print("error ${summeryVm.error.value.toString()}");
                                                return Text(summeryVm.error.value.toString());

                                              case Status.SUCCESS:
                                                if(summeryVm.sampleListFilterStatus.value.length == 0){
                                                  print("data not found");
                                                  return Text("data not found");
                                                }
                                                else{
                                                  return  ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: summeryVm.sampleListFilterStatus.value.length,
                                                      itemBuilder: (context, index) {

                                                        return ListTile(
                                                          title: Padding(
                                                            padding: const EdgeInsets
                                                                .all(8.0),
                                                            child: Container(

                                                              child: InkWell(
                                                                  onTap: () {

                                                                    setState((){
                                                                      statusId = summeryVm.sampleListFilterStatus[index].id;
                                                                      isClick = !isClick;
                                                                    });
                                                                  },
                                                                  child:  Text("${summeryVm.sampleListFilterStatus[index].name}", style: TextStyle(color: statusId == summeryVm.sampleListFilterStatus[index].id ? Colors.red : Colors.black ))),
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                }
                                            }
                                          });
                                      }),


                                    ),
                                  ],
                                )
                              ],
                            ),

                          ],
                        ),
                      ],

                    ),

                  ],
                ),
              ),
              actions: [

                StartDateCalendarWidget(),
                SizedBox(height: 10,),
                EndDateCalendarWidget(),
                SizedBox(height: 10,),
                Column(
                  children: [

                    FutureBuilder(
                        future: summeryVm.getLabTestNameSuggData(),
                        builder: (contxt, data){
                          return  Autocomplete<LabTestNameSuggModel>(

                            optionsBuilder: (TextEditingValue textValue){
                              summeryVm.getLabTestNameSuggData(query: textValue.text.toLowerCase());
                              if(textValue.text.isEmpty){
                                return List.empty();
                              }
                              return  summeryVm.labTestNameSuggList.where((value) => value.name.toLowerCase()
                                  .contains(textValue.text.toLowerCase())).toList();
                            },

                            fieldViewBuilder: (BuildContext context,   textEditingController,
                                FocusNode focusNode,
                                VoidCallback onFieldSubmitted) {
                              return Container(
                                height: 40,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Lab test name",
                                    labelStyle: TextStyle(fontFamily: 'IstokWeb', ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 2, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 2, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),

                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  onSubmitted: (String value) {
                                    setState((){
                                      print("onchange $value");
                                    });

                                  },
                                ),
                              );
                            },

                            optionsViewBuilder: (BuildContext context, Function onSelect, Iterable<LabTestNameSuggModel> dataList){
                              return Material(
                                child: ListView.builder(
                                    itemCount: dataList.length,
                                    itemBuilder: (context, index){
                                      LabTestNameSuggModel data = dataList.elementAt(index);
                                      return InkWell(
                                        onTap: ()=> onSelect(data),
                                        child: ListTile(
                                          title: Text("${data.name}"),
                                        ),
                                      );

                                    }),
                              );
                            },
                            displayStringForOption: (LabTestNameSuggModel latTastName)=> '${latTastName.name}',
                            onSelected: (selectedValue){
                              print("select value ${selectedValue.name}");
                              print("select id ${selectedValue.medicalTypeId}");
                              labTestSuggNameId = selectedValue.medicalTypeId;
                              labTestSuggName = selectedValue.name;
                            },
                          );

                        }),


                    SizedBox(height: 10,),
                    ResueableFilterTextFieldWidget(controllerValue: summeryVm.invoNumController.value, hintText: widget.textField2HintText,),
                  ],
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context, _selectedItems);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.red, width: 2)

                      ),
                      child: InkWell(
                          onTap:(){

                            summeryVm.getSummeryListData(statusId: statusId);
                            Navigator.pop(context);
                          },
                          child: Center(
                              child: Text(
                                "Go", style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.red),))),
                    ),
                  ),
                ),

              ],
            ),
          );
        });
  }


  void _cancel() {
    Navigator.pop(context);
  }


}





