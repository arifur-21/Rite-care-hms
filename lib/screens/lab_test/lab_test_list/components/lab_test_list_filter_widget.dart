
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ritecare_hms/utils/color_styles.dart';

class LabTestListFilterWidget extends StatefulWidget {
  const LabTestListFilterWidget({Key? key}) : super(key: key);

  @override
  State<LabTestListFilterWidget> createState() => _LabTestListFilterWidgetState();
}

class _LabTestListFilterWidgetState extends State<LabTestListFilterWidget> {

  List<String> _selectedItems = [];


  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> items = [
      'ALL',
      'Biochemistry',
      'Blood Transfusion',
      'Cancer Marker',
      'Clinical Pathology',
      'Cyto Pathology',
      'Cytology',
      'Genetic And Transplant Lab',
      'Hematology',
      'Histopathology',
      'Hormone',
      'Immunology',
      'Microbiology',
      'Molecular Biology',
      'n/a',
      'Others',
      'Radiology',
      'Serology',
      'Service Dept',
      'Virology'
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
        print(_selectedItems);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Column(
                      children: [

                      ],);
                  },
                  child:InkWell(
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
    TextEditingController labTestNameController = TextEditingController();

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
                        children: widget.items
                            .map((item) => CheckboxListTile(
                          value: _selectedItems.contains(item),
                          title: Text(item),
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (isChecked) => _itemChange(item, isChecked!),
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
          height: 40,
          child: TextFormField(
            controller: labTestNameController,
            keyboardType: TextInputType.text ,
            decoration: InputDecoration(
              label: Text("lab test name"),
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
              child: Center(child: Text("Go", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red),)),
            ),
          ),
        ),

      ],
    );
  }
}
