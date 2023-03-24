
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResuableTextField extends StatelessWidget {
  final TextEditingController controllerValue;
  final IconData? icon;
  final String hintText;


  ResuableTextField({required this.controllerValue,  this.icon, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerValue,
      decoration: InputDecoration(
          suffixIcon: Icon(icon),
          fillColor: Colors.grey.shade100,
          filled: true,
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
    );
  }
}
