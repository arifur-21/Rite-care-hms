
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ritecare_hms/screens/patient_registration/short_form_register.dart';
import 'package:ritecare_hms/screens/search_screen/search_patient_Screen.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PatientSearch()));
              },
              child: Column(
                children: [
                  SizedBox(height: 3,),
                  Icon(Icons.search_outlined,),
                  Text("Search", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, ))

                ],
              ),
            ),

            SizedBox(width: 10,),

            InkWell(
              onTap: (){
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ShortForm()));
              },
              child: Column(
                children: [
                  SizedBox(height: 8,),
                  Icon(Icons.app_registration, size: 18,),
                  Text("Register", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
