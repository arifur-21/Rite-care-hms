
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ritecare_hms/utils/color_styles.dart';

import '../../../../view_model/summery_view_model/summery_view_model.dart';

class SampleListFilterWidget extends StatefulWidget {
  const SampleListFilterWidget({Key? key}) : super(key: key);

  @override
  State<SampleListFilterWidget> createState() => _SampleListFilterWidgetState();
}

class _SampleListFilterWidgetState extends State<SampleListFilterWidget> {

  final summeryVm = Get.put(SummeryViewModel());

  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> items = [
      'ALL',
      'PENDING',
      'COMPLETED',
      'DELIVERED',
      'COLLECTED',
      'PRINTED'
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
        print("select item ${_selectedItems}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return    Container(
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
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))
                  ),
                  child: Text(
                    "INV NO",
                    style: Styles.poppinsFont14_600,
                  ),
                ),

                Container(
                    height: 42,
                    width: 40,

                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(6), bottomRight: Radius.circular(6))
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
              ],
            ),
            ///filter container
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    _showMultiSelect();
                  },
                  child: Container(
                      height: 42,
                      width: 140,
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
                          Text("Filter",style: Styles.poppinsFont14_600),

                        ],
                      )
                  ),
                ),

              ],
            ),
          ],),
      ) ,
    );
  }
}

// Multi Select widget
// This widget is reusable

class MultiSelect extends StatefulWidget {
  final List<String> items;

  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {

  final summeryVm = Get.put(SummeryViewModel());

  // this variable holds the selected items
  final List<String> _selectedItems = [];
  bool isCheckeds = false;

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();
    TextEditingController sampleIdController = TextEditingController();
    TextEditingController invoNoController = TextEditingController();
    String startDate ='';
    String endDate = '';
    return AlertDialog(
      title:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
              onTap: _cancel,
              child: Icon(Icons.cancel_presentation, size: 30,color: Colors.red,)),
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

                Divider(height: 2,color: Colors.grey,),
                SizedBox(height: 5,),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          isCheckeds = !isCheckeds;
                        });
                      },
                      child:  ListBody(
                        children: summeryVm.statusList.map((item) => CheckboxListTile(
                          value: _selectedItems.contains(item.name),
                         // title: Text(item.name.toString()),
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (isChecked) => _itemChange(item.name.toString(), isChecked!)
                        ))
                            .toList(),
                      ),
                    ),

                  ],
                )
              ],

            ),
          ],
        ),
      ),
      actions: [
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(6)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text('Start Date ${startDate.toString()}', style: Styles.poppinsFontBlack12_400),
              InkWell(
                  onTap: () async{
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //get today's date
                        firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101)
                    );

                    if(pickedDate != null ){
                      print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                      print(formattedDate); //formatted date output using intl package =>  2022-07-04
                      //You can format date as per your need

                      setState(() {
                        startDate  = formattedDate;//set foratted date to TextField value.
                        print("${startDate}");
                      });
                    }else{
                      print("Date is not selected");
                    }
                  },
                  child: Icon(Icons.calendar_month_outlined, size: 30,)),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(6)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('End Date', style: Styles.poppinsFontBlack12_400),
              Icon(Icons.calendar_month_outlined, size: 30,),
            ],
          ),
        ),

        SizedBox(height: 10,),

         Column(
           children: [
             Container(
               height: 40,
               child: TextFormField(
                 controller: sampleIdController,
                 keyboardType: TextInputType.text ,
                 decoration: InputDecoration(
                   label: Text("Sample Id"),
                   labelStyle: TextStyle(fontFamily: 'IstokWeb', fontWeight: FontWeight.w400, fontSize: 12),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(6),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 2, color: Styles.greyColor),
                     borderRadius: BorderRadius.circular(6),
                   ),
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 2, color: Styles.greyColor),
                     borderRadius: BorderRadius.circular(6),
                   ),

                 ),
               ),
             ),
             SizedBox(height: 10,),

             Container(
               height: 40,
               child: TextFormField(
                 controller: invoNoController,
                 keyboardType: TextInputType.text ,
                 decoration: InputDecoration(
                   label: Text("Invo.No"),
                   labelStyle: TextStyle(fontFamily: 'IstokWeb', fontWeight: FontWeight.w400, fontSize: 12),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(6),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 2, color: Styles.greyColor),
                     borderRadius: BorderRadius.circular(6),
                   ),
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 2, color: Styles.greyColor),
                     borderRadius: BorderRadius.circular(6),
                   ),

                 ),
               ),
             ),
           ],
         ),

        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(right: 10, bottom:10),
          child: InkWell(
            onTap: (){
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

                  print("value ${_selectedItems}");
                  print("value11 ${summeryVm.statusList.length}");

                },
                  child: Center(
                      child: Text("Go", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red),))),
            ),
          ),
        ),

      ],
    );
  }




}
