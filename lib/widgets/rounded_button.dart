
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_layout.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;


  RoundedButton({required this.title, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return  InkWell(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: Center(
            child: Text(title,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white))),
      ),
    );
  }
}
