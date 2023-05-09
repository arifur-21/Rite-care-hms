import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ritecare_hms/screens/lab_test/summery/summery_screen.dart';

import '../../../../utils/color_styles.dart';
import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/drawer_widget.dart';
import '../../../../widgets/rounded_button.dart';

class Lab12Screen extends StatefulWidget {
  const Lab12Screen({Key? key}) : super(key: key);

  @override
  State<Lab12Screen> createState() => _Lab12ScreenState();
}

class _Lab12ScreenState extends State<Lab12Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

        child:DrawerWidget(),
      ),

      appBar: AppBar(

        backgroundColor: Styles.primaryColor,
        actions: [
          AppBarWidget(),
          _popUpMenu()

          ///popup menu item


        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(2)
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("IMAGING DETAIL",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                    InkWell(
                        onTap: (){
                       //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PatientSummeryScreen()));
                        },
                        child: Icon(Icons.cancel_presentation, size: 40,color: Colors.white,)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Column(
              children: [
                Text("Upload New Image",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.grey) ),
                SizedBox(height: 10,),
                Text("Max File size is 10MB", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey),)
              ],
            ),
            SizedBox(height: 20,),

            Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green, width: 2)
                  ),
                  child: Icon(Icons.person, size: 150,color: Colors.green,),
                )
              ],
            ),
            SizedBox(height: 10,),
            Text("Take a Image",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.grey)),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedButton(title: "SELECT FILE", onTap: (){},color: Colors.green,),
                RoundedButton(title: "UPLOAD", onTap: (){},color: Colors.green,),
              ],
            )

          ],
        ),
      ),
    );
  }


  Widget _popUpMenu(){
    return   PopupMenuButton(
        icon: Icon(Icons.more_vert_outlined, size: 35,),
        itemBuilder: (context) =>
        [
          PopupMenuItem(

              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 25,
                            height: 25,
                            color: Styles.primaryColor,
                            child: InkWell(
                                onTap: (){
                                //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LabList16Widget()));
                                },
                                child: Icon(Icons.person, color: Colors.white,size: 25,))
                        ),
                        SizedBox(width: 10,),
                        Text("Profile",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Styles.primaryColor))
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Container(
                            width: 25,
                            height: 25,
                            color: Styles.primaryColor,
                            child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Lab12Screen()));
                                },
                                child: Icon(Icons.login_outlined, color: Colors.white,size: 20,))),
                        SizedBox(width: 10,),
                        Text("Logout", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Styles.primaryColor),)
                      ],
                    ),
                  ],
                ),
              )),

        ]);
  }
}
