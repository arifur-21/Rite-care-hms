
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_styles.dart';
import '../../../utils/utils.dart';

class ResueableEmailTextFieldWidget extends StatelessWidget {


  final TextEditingController emailController;
  final String hintText;


  ResueableEmailTextFieldWidget({ required this.emailController, required this.hintText});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress ,

        validator: (value){
          if(value!.isEmpty || value == null){
            return "Please Enter Email";
          }
          else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
          {
            return "Please Enter a Valid Email";
          }
          return null;
        },

        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email_outlined, color: ColorStyles.primaryColor,),
          fillColor: Colors.grey.shade100,
          filled: true,
          label: Text(hintText),
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
