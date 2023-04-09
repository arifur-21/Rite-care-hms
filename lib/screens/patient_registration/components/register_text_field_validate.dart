
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_styles.dart';
import '../../../utils/utils.dart';

class RegisterValidateTextField extends StatelessWidget {


  final TextEditingController textController;
  final String hintText;
  final String errorText;


  RegisterValidateTextField({ required this.textController, required this.hintText, this.errorText = ''});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  TextFormField(
        controller: textController,
        keyboardType: TextInputType.emailAddress ,

        validator: (value){
          if(value!.isEmpty || value == null){
            return "${errorText}";
          }

          return null;
        },

        decoration: InputDecoration(

          label: Text(hintText),
          labelStyle: TextStyle(color: Styles.primaryColor,fontFamily: 'IstokWeb', fontWeight: FontWeight.w700, fontSize: 17),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Styles.drawerListColor),
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Styles.drawerListColor),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
