
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_styles.dart';

class ResueableTextFieldPasswordWidget extends StatelessWidget {

  final TextEditingController controllerText;


  ResueableTextFieldPasswordWidget({  required this.controllerText});

  @override
  Widget build(BuildContext context) {
    final bool obscureText = true;

    return Container(
      child:  TextFormField(
        controller: controllerText,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        validator: (value){
          if(value!.isEmpty || value == null){
            return "Please enter your password";
          }
          else if(value.length <= 6)
          {
            return "Password must be of 6 characters";
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline, color: ColorStyles.primaryColor,),
          fillColor: Colors.grey.shade100,
          filled: true,
          label: Text('pass_hint'.tr),
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
