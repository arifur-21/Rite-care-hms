
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/color_styles.dart';

class ResueableTextEditableWidget extends StatelessWidget {

  final String lableText;
  final TextEditingController controllerText;
  final IconData prefixIcon;
  final TextInputType keybordType;
  final bool obscureText = false;


  ResueableTextEditableWidget({ required this.lableText, required this.controllerText,
     required this.prefixIcon, required this.keybordType});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:    TextField(
        controller: controllerText,
        keyboardType: keybordType,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon, color: ColorStyles.primaryColor,),
          fillColor: Colors.grey.shade100,
          filled: true,
          label: Text(lableText),
          labelStyle: TextStyle(color: ColorStyles.primaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: ColorStyles.primaryColor),
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: ColorStyles.primaryColor),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
