
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../screens/lab_test/lab_test_list/lab_test_list_screen.dart';
import '../screens/lab_test/sample_list/simple_test_screen.dart';
import '../screens/patient/patient_info/patient_details_screen.dart';
import '../screens/lab_test/summery/summery_screen.dart';
import '../screens/patient/patient_list/patient_list_screen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool isColorChange = false;
  bool islabTestToggle = false;
  bool isAppointmentToggle = false;


  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              height: 150,
              color: Color(0xff63b077),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/icons/rite.png')
                      ),
                    ),
                  ),
                ],
              ),

            ),

            ExpansionTile(
              title: Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(

                      image: DecorationImage(
                          image: AssetImage('assets/icons/patient1.png')
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text("Patient", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: isColorChange ? Colors.red: Colors.green,),)
                ],
              ),
              trailing: Icon(
                isColorChange
                ?Icons.remove_outlined : Icons.add, size: 30,
                color: isColorChange ? Colors.red: Colors.green,
                ),
              onExpansionChanged: (bool expanded){
                setState(() {
                  isColorChange = expanded;
                });
              },
              children: [
                SizedBox(height: 10,),
                _drawerSublistWidget(
                    subTitle: "Patient Info",
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PatientProfileDetailsScreen()));
                    },
                    image: 'assets/icons/file.png'),

                _drawerSublistWidget(
                    subTitle: "Patient List",
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PatientListScreen()));
                    },
                    image: 'assets/icons/test_list.png'),

              ],

            ),
            ExpansionTile(

              title: Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(

                      image: DecorationImage(
                          image: AssetImage('assets/icons/lab_test.png')
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text("Lab Test", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: islabTestToggle ? Colors.red: Colors.green,),)
                ],
              ),
              trailing: Icon(
                islabTestToggle
                    ? Icons.remove_outlined : Icons.add, size: 30,
                color: islabTestToggle ? Colors.red: Colors.green,
              ),
              onExpansionChanged: (bool expanded){
                setState(() {
                  islabTestToggle = expanded;
                });
              },
              children: [
                SizedBox(height: 10,),

                Divider(height: 2,color: Colors.grey,),
                SizedBox(height: 5,),

                _drawerSublistWidget(
                    subTitle: "Summary",
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PatientSummeryScreen()));
                    },
                    image: 'assets/icons/summery.png'),
                SizedBox(height: 5,),
                Divider(height: 2,color: Colors.grey,),
                SizedBox(height: 5,),

                _drawerSublistWidget(
                    subTitle: "Sample List",
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SimpleTestScreen()));
                    },
                    image: 'assets/icons/simple.png'),
                SizedBox(height: 5,),
                Divider(height: 2,color: Colors.grey,),
                SizedBox(height: 5,),

                _drawerSublistWidget(
                    subTitle: "Lab Test List",
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LatTestListScreen()));
                    },
                    image: 'assets/icons/lab_test.png'),
                SizedBox(height: 5,),
                Divider(height: 2,color: Colors.grey,),
                SizedBox(height: 5,),

                _drawerSublistWidget(
                    subTitle: "Nurse Station",
                    onTap: (){},
                    image: 'assets/icons/nurse.png'),


              ],

            ),
            ExpansionTile(

              title: Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(

                      image: DecorationImage(
                          image: AssetImage('assets/icons/appointment.png')
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text("Appointment", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: isAppointmentToggle ? Colors.red: Colors.green,),)
                ],
              ),
              trailing: Icon(
                isAppointmentToggle
            ? Icons.remove_outlined : Icons.add, size: 30,
                color: isAppointmentToggle ? Colors.red: Colors.green,
            ),
      onExpansionChanged: (bool expand){
        setState(() {
          isAppointmentToggle = expand;
        });
      },
              children: [
                SizedBox(height: 10,),

                _drawerSublistWidget(
                    subTitle: "Summary",
                    onTap: (){},
                    image: 'assets/icons/lab_test.png'),
                Divider(height: 2,color: Colors.grey,),
              ],

            ),


          ],
        )
    );
  }



  Widget _drawerSublistWidget({
    required String subTitle,
    required VoidCallback onTap,
    required String image
  }){
    return Padding(
      padding: const EdgeInsets.only(left: 40, bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              height:25,
              width: 25,
              decoration: BoxDecoration(

                image: DecorationImage(
                    image: AssetImage(image)
                ),
              ),
            )
            ,
            SizedBox(width: 15,),
            Text(subTitle,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff01BE84),))

          ],),
      ),
    );
  }

}
