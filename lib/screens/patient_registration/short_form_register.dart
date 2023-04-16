import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:ritecare_hms/widgets/reuseable_text_filed.dart';
import 'package:ritecare_hms/widgets/rounded_button.dart';
import '../../model/register/gender_model.dart';
import '../../utils/color_styles.dart';
import '../../utils/screen_main_padding.dart';
import '../../view_model/patient_register_view_model/patient_register_view_model.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/reuseable_header_container_widget.dart';
import 'components/register_dropdown_list_data.dart';
import 'components/register_text_field_validate.dart';
import 'full_form_register_screen.dart';

class RegistrShortForm extends StatefulWidget {
  const RegistrShortForm({super.key});

  @override
  State<RegistrShortForm> createState() => _RegistrShortFormState();
}

class _RegistrShortFormState extends State<RegistrShortForm> {



  List<String> serviceTypeList = ['','Uniform', 'RE', 'CNE'];
  List<String> genderList = ['Male', 'Female', 'Third Gender'];
  List<String> bloodGroupList = [
    'A(+VE)',
    'A(-VE)',
    'B(+VE)',
    'B(-VE)',
    'O(+VE)',
    'O(-VE)',
    'AB(+VE)',
    'AB(-VE)',
  ];

  final registerVM = Get.put(PatientRegisterViewModel());
  final _formKey = GlobalKey<FormState>();

  File? imageFile;

  dynamic selectBloodGroup = 'Select Blood Group';
  String selectGender = 'Selected Gender';
  String selectPatientFrefix = 'Selected Patient Prefix';
  String selectPatientStatus = 'Selected Patient Status';
  String selectPatientRelation = 'Selected Patient Relation';
  String selectServiceType = 'Select Service Type';
  String dateOfBirth = '';
  bool isChecked = false;

  dynamic frefixId;
  dynamic statusId;
  dynamic relationId;


  bool isOpen = false;
  bool isGender = false;
  bool isPrefix = false;
  bool isStutus = false;
  bool isRelation = false;
  bool isServiceType = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerWidget(),
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
              ReuseableHeaderContainerWidget(
                titleText: '',
                leadingText: 'Patient Registration',
                tralingIcon: "assets/icons/cancel.png",
                onTap: () {
                  Get.back();
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RoundedButton(
                    width: Get.width * 0.4,
                    title: 'Full Form',
                    color: Colors.greenAccent,
                    onTap: () {
                      //    Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegistrFullForm()));
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Positioned(
                    child: imageFile == null
                        ? Container(
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(150),
                              border: Border.all(width: 1, color: Colors.grey),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/images/profile.png')),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150),
                                border:
                                    Border.all(width: 2, color: Colors.grey)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(150.0),
                                child: Image.file(
                                  imageFile!,
                                  height: 180,
                                  width: 180,
                                  fit: BoxFit.fill,
                                )),
                          ),
                  ),
                  Positioned(
                    top: 140,
                    right: 30,
                    child: InkWell(
                        onTap: () async {
                          Map<Permission, PermissionStatus> statuses = await [
                            Permission.storage,
                            Permission.camera,
                          ].request();
                          if (statuses[Permission.storage]!.isGranted &&
                              statuses[Permission.camera]!.isGranted) {
                            showImagePicker(context);
                          } else {
                            print('no permission provided');
                            print('no ${imageFile.toString()}');
                          }
                        },
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                color: Colors.white),
                            child: Icon(Icons.add_a_photo_rounded, size: 25))),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      RegisterValidateTextField(
                        textController: registerVM.personalController.value,
                        hintText: 'Personal/offical NO',
                        errorText: "enter your personal/offical number",
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      serviceTypeWidget(),
                      SizedBox(
                        height: 15,
                      ),
                      patientRelationWidget(),
                      SizedBox(
                        height: 15,
                      ),
                      patientPrefix(),
                      SizedBox(
                        height: 15,
                      ),
                      patientStatusWidget(),
                      SizedBox(
                        height: 15,
                      ),
                      ResuableTextField(
                          controllerValue: registerVM.rankController.value,
                          hintText: "RANK"),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            "Is Retired",
                            style: TextStyle(
                                fontSize: 16, color: Styles.drawerListColor),
                          ),
                          Checkbox(
                            checkColor: Colors.greenAccent,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                                print(isChecked);
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ResuableTextField(
                          controllerValue: registerVM.uniController.value,
                          hintText: "UNIT"),
                      SizedBox(
                        height: 15,
                      ),
                      RegisterValidateTextField(
                        textController: registerVM.firstNameController.value,
                        hintText: "First Name",
                        errorText: "enter your name",
                      ),
                      SizedBox(
                        height: 15,
                      ),
                     genderWidget(),
                      SizedBox(
                        height: 15,
                      ),
                      bloodGroupWidget(),
                      SizedBox(
                        height: 15,
                      ),
                      RegisterValidateTextField(
                        textController: registerVM.phoneNumberController.value,
                        hintText: "Phone Number",
                        errorText: "enter your phone",
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ResuableTextField(
                          controllerValue: registerVM.emailController.value,
                          hintText: "EMAIL"),
                      SizedBox(
                        height: 15,
                      ),
                      DateOfBrithWidget(),
                      SizedBox(
                        height: 30,
                      ),

                    ],
                  )),



              RoundedButton(
                  width: Get.width * 0.4,
                  title: "Register",
                  color: Styles.primaryColor,
                  onTap: () {
                    if (selectGender.isEmpty) {
                      print("gender null");
                    }

                    if (_formKey.currentState!.validate()) {
                      registerVM.registerPatient(
                          service: selectServiceType,
                          status: selectPatientStatus,
                          gender: selectGender,
                          blood: selectBloodGroup,
                          relation: selectPatientRelation,
                          prefix: selectPatientFrefix,
                          imageUrl: imageFile,
                          dateOfBrith: dateOfBirth,
                          isRetired: isChecked,
                          prefixId: frefixId,
                          relationId: relationId,
                          statusId: statusId

                      );
                    }
                  }),

             // WidgetDropDown(),
            ],
          ),
        ),
      ),
    );
  }



  Widget bloodGroupWidget() {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isOpen = !isOpen;
                  registerVM.BloodGroup();
              });
            },
            child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border:
                        Border.all(width: 2, color: Styles.drawerListColor)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectBloodGroup,
                        style: TextStyle(color: Styles.drawerListColor),
                      ),
                      Icon(
                        isOpen
                            ? Icons.keyboard_arrow_down_outlined
                            : Icons.keyboard_arrow_up,
                        color: Styles.drawerListColor,
                      ),
                    ],
                  ),
                )),
          ),
          if (isOpen)
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey)),
              child: SingleChildScrollView(
                child: ListView(
                  primary: true,
                  shrinkWrap: true,
                  children:  bloodGroupList.map((e) => Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      width: 0.7, color: Colors.grey)),
                              color: selectBloodGroup == e
                                  ? Styles.primaryColor
                                  : Colors.white,
                            ),
                            child: InkWell(
                                onTap: () {
                                  selectBloodGroup = e.toString();
                                  print(selectBloodGroup);
                                  print(e.toString());
                                  isOpen = false;
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    e.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: selectBloodGroup == e
                                            ? Colors.white
                                            : Styles.drawerListColor),
                                  ),
                                )),
                          ))
                      .toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }

 genderWidget(){
    return Container(
      child: Column(
        children: [

          InkWell(
            onTap: (){
              setState(() {
                isGender = !isGender;
                registerVM.getGender();
              });
            },
            child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(width: 2,color: Styles.drawerListColor)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(selectGender , style: TextStyle(color: Styles.drawerListColor),),
                      Icon(isGender ? Icons.keyboard_arrow_down_outlined : Icons.keyboard_arrow_up,color: Styles.drawerListColor,),
                    ],
                  ),
                )

            ),
          ),
          if(isGender)
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2,color: Colors.grey)
              ),
              child: SingleChildScrollView(
                child: ListView(
                  primary: true,
                  shrinkWrap: true,
                  children:  genderList.map((e) =>   Container(
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(width: 0.7,color: Colors.grey)),
                      color: selectGender == e ? Styles.primaryColor :Colors.white,
                    ),
                    child: InkWell(
                        onTap: (){
                          selectGender = e.toString();
                          isGender = false;
                          setState(() {
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(e.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: selectGender == e ? Colors.white : Styles.drawerListColor),),

                        )),

                  )).toList(),

                ),
              ),


            ),

        ],
      ),
    );
  }

  Widget serviceTypeWidget() {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isServiceType = !isServiceType;
                //  registerVM.getGender();
              });
            },
            child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border:
                        Border.all(width: 2, color: Styles.drawerListColor)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectServiceType,
                        style: TextStyle(color: Styles.drawerListColor),
                      ),
                      Icon(
                        isServiceType
                            ? Icons.keyboard_arrow_down_outlined
                            : Icons.keyboard_arrow_up,
                        color: Styles.drawerListColor,
                      ),
                    ],
                  ),
                )),
          ),
          if (isServiceType)
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey)),
              child: SingleChildScrollView(
                child: ListView(
                  primary: true,
                  shrinkWrap: true,
                  children: serviceTypeList
                      .map((e) => e == null
                          ? CircularProgressIndicator()
                          : Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        width: 0.7, color: Colors.grey)),
                                color: selectServiceType == e
                                    ? Styles.primaryColor
                                    : Colors.white,
                              ),
                              child: InkWell(
                                  onTap: () {
                                    selectServiceType = e.toString();
                                    print(selectServiceType);
                                    isServiceType = false;
                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(
                                      e.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: selectServiceType == e
                                              ? Colors.white
                                              : Styles.drawerListColor),
                                    ),
                                  )),
                            ))
                      .toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget patientPrefix() {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isPrefix = !isPrefix;
                registerVM.getPatientPrefix();
              });
            },
            child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border:
                        Border.all(width: 2, color: Styles.drawerListColor)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectPatientFrefix,
                        style: TextStyle(color: Styles.drawerListColor),
                      ),
                      Icon(
                        isPrefix
                            ? Icons.keyboard_arrow_down_outlined
                            : Icons.keyboard_arrow_up,
                        color: Styles.drawerListColor,
                      ),
                    ],
                  ),
                )),
          ),
          if (isPrefix)
            Container(
                height: 150,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey)),
                child: Expanded(
                  child: FutureBuilder(
                    future: registerVM.getPatientPrefix(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [CircularProgressIndicator()],
                          ),
                        );
                      } else {
                        return Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  /*onTap: () {
                                   // selectPatientFrefix = snapshot.data![index]?["Name"];
                                  },*/
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              width: 0.7, color: Colors.grey)),
                                      color: selectPatientFrefix ==
                                              snapshot.data![index]?["Name"]
                                          ? Styles.primaryColor
                                          : Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: InkWell(
                                          onTap: () {
                                            selectPatientFrefix = snapshot.data![index]?["Name"];
                                             frefixId = snapshot.data![index]?["Id"];
                                            print("id1 ${frefixId}");
                                            print("name123 ${selectPatientFrefix}");
                                            isPrefix = false;
                                            setState(() {});
                                          },
                                          child: Text(
                                              "${snapshot.data![index]?["Name"]}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: selectPatientFrefix ==
                                                          snapshot.data![index]
                                                              ?["Name"]
                                                      ? Colors.white
                                                      : Styles
                                                          .drawerListColor))),
                                    ),
                                  ),
                                );
                              }),
                        );
                      }
                    },
                  ),
                )),
        ],
      ),
    );
  }

  Widget patientStatusWidget() {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isStutus = !isStutus;
                registerVM.getPatientStatus();
              });
            },
            child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border:
                        Border.all(width: 2, color: Styles.drawerListColor)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectPatientStatus,
                        style: TextStyle(color: Styles.drawerListColor),
                      ),
                      Icon(
                        isStutus
                            ? Icons.keyboard_arrow_down_outlined
                            : Icons.keyboard_arrow_up,
                        color: Styles.drawerListColor,
                      ),
                    ],
                  ),
                )),
          ),
          if (isStutus)
            Container(
                height: 150,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey)),
                child: Expanded(
                  child: FutureBuilder(
                    future: registerVM.getPatientStatus(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [CircularProgressIndicator()],
                          ),
                        );
                      } else {
                        return Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                /*  onTap: () {
                                    selectPatientStatus =
                                        snapshot.data![index]?["Name"];
                                  },*/
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              width: 0.7, color: Colors.grey)),
                                      color: selectPatientStatus ==
                                              snapshot.data![index]?["Name"]
                                          ? Styles.primaryColor
                                          : Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: InkWell(
                                          onTap: () {
                                            selectPatientStatus = snapshot.data![index]?["Name"];
                                            statusId = snapshot.data![index]?["Id"];
                                            print("status ${snapshot.data![index]?["Name"]}");
                                            print("Id ${snapshot.data![index]?["Id"]}");
                                            isStutus = false;
                                            setState(() {});
                                          },
                                          child: Text(
                                              "${snapshot.data![index]?["Name"]}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: selectPatientStatus ==
                                                          snapshot.data![index]
                                                              ?["Name"]
                                                      ? Colors.white
                                                      : Styles
                                                          .drawerListColor))),
                                    ),
                                  ),
                                );
                              }),
                        );
                      }
                    },
                  ),
                )),
        ],
      ),
    );
  }

  Widget patientRelationWidget() {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isRelation = !isRelation;
                registerVM.getPatientRelation();
              });
            },
            child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border:
                        Border.all(width: 2, color: Styles.drawerListColor)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectPatientRelation,
                        style: TextStyle(color: Styles.drawerListColor),
                      ),
                      Icon(
                        isRelation
                            ? Icons.keyboard_arrow_down_outlined
                            : Icons.keyboard_arrow_up,
                        color: Styles.drawerListColor,
                      ),
                    ],
                  ),
                )),
          ),
          if (isRelation)
            Container(
                height: 150,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey)),
                child: Expanded(
                  child: FutureBuilder(
                    future: registerVM.getPatientRelation(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [CircularProgressIndicator()],
                          ),
                        );
                      } else {
                        return Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  /*onTap: () {
                                    selectPatientRelation =
                                        snapshot.data![index]?["Name"];
                                  },*/
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              width: 0.7, color: Colors.grey)),
                                      color: selectPatientRelation ==
                                              snapshot.data![index]?["Name"]
                                          ? Styles.primaryColor
                                          : Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: InkWell(
                                          onTap: () {
                                            selectPatientRelation = snapshot.data![index]?["Name"];
                                            relationId = snapshot.data![index]?["Id"];
                                            print("status ${snapshot.data![index]?["Name"]}");
                                            print("Id ${snapshot.data![index]?["Id"]}");
                                            isRelation = false;
                                            setState(() {});
                                          },
                                          child: Text(
                                              "${snapshot.data![index]?["Name"]}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: selectPatientRelation ==
                                                          snapshot.data![index]
                                                              ?["Name"]
                                                      ? Colors.white
                                                      : Styles
                                                          .drawerListColor))),
                                    ),
                                  ),
                                );
                              }),
                        );
                      }
                    },
                  ),
                )),
        ],
      ),
    );
  }

  Widget DateOfBrithWidget() {
    return Container(
      padding: EdgeInsets.all(6),
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 2, color: Styles.drawerListColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Select Date :   ${dateOfBirth.toString()}',
              style: TextStyle(fontSize: 16, color: Styles.drawerListColor)),
          InkWell(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    //get today's date
                    firstDate: DateTime(2000),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(
                      pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                  String formattedDate = DateFormat('yyyy-MM-dd').format(
                      pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                  print(
                      formattedDate); //formatted date output using intl package =>  2022-07-04
                  //You can format date as per your need

                  setState(() {
                    dateOfBirth =
                        formattedDate; //set foratted date to TextField value.
                    print("${dateOfBirth}");
                  });
                } else {
                  print("Date is not selected");
                }
              },
              child: Icon(
                Icons.calendar_month_outlined,
                size: 30,
              )),
        ],
      ),
    );
  }

  final picker = ImagePicker();

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            color: Styles.primaryColor,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.2,
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.image,
                            size: 60.0,
                            color: Colors.white,
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            "Gallery",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.pop(context);
                      },
                    )),
                    Expanded(
                        child: InkWell(
                      child: SizedBox(
                        child: Column(
                          children: const [
                            Icon(
                              Icons.camera_alt,
                              size: 60.0,
                              color: Colors.white,
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              "Camera",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.pop(context);
                      },
                    ))
                  ],
                )),
          );
        });
  }

  _imgFromGallery() async {
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _imgFromCamera() async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Styles.primaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile = File(croppedFile.path);
        print("object ${imageFile}");
      });
      // reload();
    }
  }
}
