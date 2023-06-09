
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/lab_test/summery/components/lab12_screen.dart';
import '../screens/user_profile_screen/user_profile_details_screen.dart';
import '../utils/color_styles.dart';

class PopUpButtonWidget extends StatelessWidget {
  const PopUpButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: Icon(Icons.more_vert_outlined, size: 35,),
        itemBuilder: (context) =>
        [
          PopupMenuItem(

              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> UserProfileDetailsScreen()));
                      },
                      child: Row(
                        children: [
                          Container(
                              width: 25,
                              height: 25,
                              color: ColorStyles.primaryColor,
                              child: Icon(Icons.person, color: Colors.white,size: 25,)
                          ),
                          SizedBox(width: 10,),
                          Text("Profile",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: ColorStyles.primaryColor))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Container(
                            width: 25,
                            height: 25,
                            color: ColorStyles.primaryColor,
                            child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Lab12Screen()));
                                },
                                child: Icon(Icons.login_outlined, color: Colors.white,size: 20,))),
                        SizedBox(width: 10,),
                        Text("Logout", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: ColorStyles.primaryColor),)
                      ],
                    ),
                  ],
                ),
              )),

        ]);
  }
}
