

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:ritecare_hms/local_db/search_user_model.dart';
import 'package:ritecare_hms/screens/home_screen.dart';
import 'package:ritecare_hms/screens/patient_registration/register_update_screen.dart';
import 'package:ritecare_hms/utils/screen_main_padding.dart';

import '../../../function/function_class.dart';
import '../../../local_db/boxes/boxes.dart';
import '../../../shere_preference/login_preference.dart';
import '../../../utils/color_styles.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/patinet_info_card_widget.dart';
import '../../demo_screen.dart';
import '../../patient_registration/full_form_register_screen.dart';
import '../../patient_registration/short_form_register.dart';
import '../../search_screen/search_patient_Screen.dart';
import 'components/card_widget.dart';
import '../../../widgets/drawer_widget.dart';
import '../../../widgets/popup_button_widget.dart';
import '../../user_profile_screen/components/profile_image_container_widget.dart';
import '../../user_profile_screen/components/profile_use_data_view_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';



class PatientInfoScreen extends StatefulWidget {
  static const routeName = "/profile";

  dynamic isInfoVisible;

  PatientInfoScreen({ this.isInfoVisible});

  @override
  _PatientInfoScreenState createState() => _PatientInfoScreenState();
}

class _PatientInfoScreenState extends State<PatientInfoScreen> {


  dynamic? dateTime;
  dynamic dob;
  dynamic data;
  bool isVislible = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(
            child:DrawerWidget(),
          ),
          appBar: AppBar(
            backgroundColor: Styles.primaryColor,
            actions: [
              AppBarWidget(),
            ],
          ),

          body:  ValueListenableBuilder<Box<SearchUserModel>>(
              valueListenable: Boxes.getData().listenable(),
              builder: (context,box, _){
                 data = box.values.toList().cast<SearchUserModel>();
                return ListView.builder(
                  itemCount: box.length,
                    itemBuilder: (context, index){
                    index = index;
                    dob = data[index].dob;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [


                        Visibility(
                          visible: (widget.isInfoVisible == 1) ? false : true ,
                          child: PatientInfoCardWidget(
                            patientId: data[index].id,
                            patientCellNO: data[index].cellNo,
                            patientName: data[index].name,
                            patientOfficalNo: data[index].officalNo,
                            onTap: (){
                              deleteHive(data[index]);
                            },
                            editOnTap: (){
                              setState(() {
                                Get.to((
                                    RegistrationUpdateScreen(
                                      officalNo: data[index].officalNo.toString(),
                                      serviceType: data[index].serviceType.toString(),
                                      patientRelation: data[index].relationship.toString(),
                                      patientPrefix: data[index].officalNo.toString(),
                                      patientStatus: data[index].patienStatus.toString(),
                                      rank: data[index].rank.toString(),
                                      unit: data[index].unit.toString(),
                                      firstName: data[index].name.toString(),
                                      gender: data[index].gender.toString(),
                                      bloodGroup: data[index].bloodGroup.toString(),
                                      phone: data[index].mobile.toString(),
                                      email: data[index].email.toString(),
                                      dob: data[index].dob.toString(),
                                    )));
                              });

                            },
                          ),
                        ),

                        SizedBox(height: 20,),

                        ProfileUserDataViewWidget(title: "ID",information: "${data[index].id.toString()}"),
                        ProfileUserDataViewWidget(title: "User Name",information: "${data[index].name.toString()}"),
                        ProfileUserDataViewWidget(title: "Gender",information: "${data[index].gender.toString()}"),
                        ProfileUserDataViewWidget(title: "Blood Group",information: "${data[index].bloodGroup}"),
                        ProfileUserDataViewWidget(title: "Address",information: "${data[index].address}"),
                        ProfileUserDataViewWidget(title: "Mobile",information: "${data[index].mobile}"),
                        ProfileUserDataViewWidget(title: "Email",information: "${data[index].email}"),
                        ProfileUserDataViewWidget(title: "Date of Birth",information: "${(dob == null) ? " " : DateFormat('dd-MM-yyyy').format(FunctionClass.dateOfTiemConterter(dob))}"),
                        ProfileUserDataViewWidget(title: "Emergency Contact",information: "${data[index].emergencyContact}"),
                        ProfileUserDataViewWidget(title: "Emergency Relation",information: "${data[index].emergencyRelation}"),
                        ProfileUserDataViewWidget(title: "Relaionship",information: "${data[index].relationship}"),
                        ProfileUserDataViewWidget(title: "Service Type",information: "${data[index].serviceType}"),
                        ProfileUserDataViewWidget(title: "Rank",information: "${data[index].rank}"),
                        ProfileUserDataViewWidget(title: "Branch/Trade",information: "${data[index].branch}"),
                        ProfileUserDataViewWidget(title: "Unit",information: "${data[index].unit}"),
                        ProfileUserDataViewWidget(title: "Patient Status",information: "${data[index].patienStatus}"),
                        ProfileUserDataViewWidget(title: "Patient Prefix",information: "${data[index].patientPrefix}"),


                      ],
                    ),
                  );
                });
              }),

        floatingActionButton: FloatingActionButton(
        backgroundColor:  Styles.primaryColor,
        child: Icon(Icons.edit,),
        onPressed: () {
          setState(() {
            Get.to((RegistrShortForm(

            )));
          });
        },
      ),
      ),

    );
  }

  void deleteHive(SearchUserModel searchUserModel)async{
    await searchUserModel.delete();
  }

}