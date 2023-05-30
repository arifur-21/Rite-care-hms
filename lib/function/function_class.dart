

import 'package:flutter/cupertino.dart';

class FunctionClass{

static  dynamic? dateTime;
 static  dateOfTiemConterter(dynamic dob){

     dynamic dobs = "";
     dobs = dob;
     dynamic unixTimestamp = dobs;
     int timestampInMilliseconds = int.parse(
         unixTimestamp.replaceAll(RegExp(r'[^0-9]'), '') ??
             "00:00"); // extract the numeric value from the string
     dateTime = DateTime.fromMillisecondsSinceEpoch(timestampInMilliseconds);

     return dateTime;
   }



  }
