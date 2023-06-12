import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ritecare_hms/utils/color_styles.dart';
import 'package:ritecare_hms/view_model/lab_test_view_model/lab_test_list_view_model.dart';

import '../../../../data/response/status.dart';
import '../../../../model/lab_test_model/summery_sub_item_model/lab_test_name_sugg_model.dart';
import '../../../../view_model/summery_view_model/summery_view_model.dart';
import '../../../../widgets/end_date_calendar_widget.dart';
import '../../../../widgets/start_date_calendar_widget.dart';
import '../../../../widgets/resueable_filter_text_filed_widget.dart';

class LabTestListFilterWidget extends StatefulWidget {
  String textField1HintText;
  final VoidCallback  onClick;


  LabTestListFilterWidget({required this.textField1HintText, required this.onClick});

  @override
  State<LabTestListFilterWidget> createState() => _LabTestListFilterWidgetState();
}

class _LabTestListFilterWidgetState extends State<LabTestListFilterWidget> {

  final labTestListVM = Get.put(LabTestListViewModel());
  final summeryVm = Get.put(SummeryViewModel());

  // this variable holds the selected items
  final List<String> _selectedItems = [];
  bool isCheckeds = false;
  dynamic? itemId;
  bool isClick = true;

  dynamic labTestSuggName;
  dynamic labTestSuggNameId;


  @override
  void initState() {
    labTestListVM.getLabTestListStatusData();
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

              ],
            ),

            ///filter container
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    _showDialog();
                  },
                  child: Container(
                      height: 42,
                      width: Get.width * 0.4,
                      padding: const EdgeInsets.all(12.0),
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
                                  image: AssetImage('assets/icons/filter.png')
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Text("Filter", style: Styles.poppinsFont14_600),
                        ],
                      )
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
                      leading: Text("Category", style: Styles.poppinsFontBlack12_400),
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
                                      height: 200,
                                      child:  FutureBuilder(
                                          future: labTestListVM.getLabTestListStatusData(),
                                          builder: (context, snapshot){
                                            return Obx((){
                                              switch(labTestListVM.rxRequestStatus.value){
                                                case Status.LOADING:
                                                  return Center(child:  CircularProgressIndicator(),);

                                                case Status.ERROR:
                                                  print("error ${labTestListVM.error.value.toString()}");
                                                  return Text(labTestListVM.error.value.toString());

                                                case Status.SUCCESS:
                                                  if(labTestListVM.labTestListFilterStatus.value.length == 0){
                                                    print("data not found");
                                                    return Text("data not found");
                                                  }
                                                  else{
                                                    return  ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: labTestListVM.labTestListFilterStatus.value.length,
                                                        itemBuilder: (context, index) {
                                                          print("summery data length ${labTestListVM.labTestListFilterStatus.value.length}");
                                                          return ListTile(
                                                            title: Padding(
                                                              padding: const EdgeInsets
                                                                  .all(8.0),
                                                              child: InkWell(
                                                                  onTap: () {
                                                                  setState((){

                                                                    isClick = !isClick;

                                                                    print("lab test status id $itemId");
                                                                  });
                                                                  itemId = labTestListVM.labTestListFilterStatus[index].id!;

                                                                  },
                                                                  child: Text("${labTestListVM.labTestListFilterStatus[index].name}", style: TextStyle(color: itemId == labTestListVM.labTestListFilterStatus[index].id! ? Colors.red : Colors.black ))),
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

                            fieldViewBuilder: (BuildContext context,  textEditingController,
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
                          onTap: (){

                            labTestListVM.categoryId.value = itemId;
                            labTestListVM.items.value = [];
                            labTestListVM.pageNumber.value = 1;
                            print("lab test status id $itemId");
                            labTestListVM.getLabTestListData(labStatus: itemId, page: 1);
                            labTestListVM.setRxRequestStatus(Status.LOADING);
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





