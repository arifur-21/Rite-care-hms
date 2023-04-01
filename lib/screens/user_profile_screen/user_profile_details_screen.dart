
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ritecare_hms/utils/screen_main_padding.dart';

import '../../utils/color_styles.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/popup_button_widget.dart';
import 'components/profile_image_container_widget.dart';
import 'components/profile_use_data_view_widget.dart';
import '../../widgets/reuseable_header_container_widget.dart';

class UserProfileDetailsScreen extends StatefulWidget {
  static const routeName = "/profile";

  @override
  _UserProfileDetailsScreenState createState() => _UserProfileDetailsScreenState();
}

class _UserProfileDetailsScreenState extends State<UserProfileDetailsScreen> {
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
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenMainPadding.screenPadding),
          child: Column(
           children: [
             SizedBox(height: 10,),
             ReuseableHeaderContainerWidget(
               titleText: '',
               leadingText: 'User Details',
               tralingIcon: "assets/icons/cancel.png",
               onTap: (){
                 Get.back();
               },

             ),


             SizedBox(height: 10,),


             ProfileImageContainerWidget(imageUrl: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"),
             SizedBox(height: 20,),
             Column(
               children: [
                 ProfileUserDataViewWidget(title: "User Name",information: "Abdur Rahman"),
                 ProfileUserDataViewWidget(title: "First Name",information: "Abdur"),
                 ProfileUserDataViewWidget(title: "Last Name",information: "Rahaman"),
                 ProfileUserDataViewWidget(title: "Phone Number",information: "0184738-5555"),
                 ProfileUserDataViewWidget(title: "E-Mail",information: "abdur_rahman@gamil.com"),
                 ProfileUserDataViewWidget(title: "Gender",information: "Male"),
                 ProfileUserDataViewWidget(title: "Street",information: "Dhaka, Rampura"),
                 ProfileUserDataViewWidget(title: "City",information: "Dhaka"),
                 ProfileUserDataViewWidget(title: "Country",information: "Bangladesh"),
                 ProfileUserDataViewWidget(title: "Assign Role",information: "345"),
                 SizedBox(height: 20,)
               ],
             )

           ],
          ),
        ),
      )
    );
  }


}