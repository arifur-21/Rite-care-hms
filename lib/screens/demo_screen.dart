import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ritecare_hms/utils/color_styles.dart';

class DropdownMenuExample extends StatefulWidget {
  @override
  _DropdownMenuExampleState createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  dynamic? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Menu Example'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Styles.primaryColor)
          ),
          height: 50,
          child: DropdownButton<String>(
            underline: Container(),
            icon: Icon(Icons.arrow_drop_down_outlined),

            value: selectedValue,
            hint: Text('Select an option'),
            onChanged: (dynamic newValue) {
              setState(() {
                selectedValue = newValue;
                print("sdf$selectedValue");
              });
            },
            items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                    width: Get.width * 0.9,
                    child: Text(value)),
              );
            }).toList(),

          ),
        ),
      ),
    );
  }
}

