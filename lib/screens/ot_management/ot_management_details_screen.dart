import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ritecare_hms/model/ot_management_model/surgery_note_model.dart';

import '../../data/response/status.dart';
import '../../model/ot_management_model/ot_list_model.dart';
import '../../utils/color_styles.dart';
import '../../view_model/ot_management_view_model/ot_list_view_model.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/reuseable_text_filed.dart';
import '../search_screen/conponents/search_list_widget.dart';
import 'Ot_management_screen.dart';


class OtManagementDetailsScreen extends StatefulWidget {
  dynamic noteId;
  dynamic id;
  dynamic userId;



  OtManagementDetailsScreen({this.noteId, this.id, this.userId});

  @override
  State<OtManagementDetailsScreen> createState() => _OtManagementDetailsScreenState();
}

class _OtManagementDetailsScreenState extends State<OtManagementDetailsScreen> {
  List<dynamic> listController = [];
  final otListVM = Get.put(OtListViewModel());
  dynamic userId;
  dynamic id;


  @override
  void initState() {

      otListVM.getSurgerNoteData();
      otListVM.id = widget.noteId;


    super.initState();
  }

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
          ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),



            Expanded(
              child: FutureBuilder(
                future: otListVM.getSurgerNoteData(),
                  builder: (context, snapShot){
                    return  Obx((){
                      switch(otListVM.rxRequestStatus.value){
                        case Status.LOADING:
                          return Center(child:  CircularProgressIndicator(),);

                        case Status.ERROR:
                          print("error ${otListVM.error.value.toString()}");

                          return Center(child: Text(otListVM.error.value.toString(),style: TextStyle(fontSize: 20),));

                        case Status.SUCCESS:
                          if(otListVM.surgeryNoteItem.value.length == null ){
                            print("data not found123");
                            return Text("data not found");
                          }
                          else{
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: otListVM.surgeryNoteItem.value.length,
                                itemBuilder: (context, index){
                                  return Column(
                                    children: [
                                      Card(
                                        elevation: 6,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(14.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("${otListVM.surgeryNoteItem[index].note}"),
                                                  Row(
                                                    children: [
                                                      InkWell (
                                                          onTap: (){
                                                            showEditAlertDialog(context, index,otListVM.surgeryNoteItem[index].note);

                                                            //Navigator.pop(context);
                                                          },
                                                          child: Icon(Icons.edit, size: 30,)),
                                                      SizedBox(width: 10,),
                                                      InkWell(
                                                          onTap: (){
                                                            otListVM.deleteSurgeryNote(
                                                                otListVM.surgeryNoteItem[index].surgeryId,
                                                                otListVM.surgeryNoteItem[index].id,
                                                                otListVM.surgeryNoteItem[index].userId,
                                                            );

                                                           // otListVM.getSurgerNoteData();
                                                          },
                                                          child: Icon(Icons.delete, size: 30,)),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          }
                      }
                    });
                  }),
            ),



            const SizedBox(
              width: 10,
            ),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor:  Styles.primaryColor,
        child: Icon(Icons.add,),
        onPressed: () {
            setState(() {
              showAlertDialog(context);
            });
        },
      ),
    );
  }

  showAlertDialog(BuildContext context) {



    AlertDialog alert = AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Add Note"),
          InkWell(
              onTap: (){
                setState(() {
                  otListVM.getSurgerNoteData();
                });

                Navigator.pop(context);
              },
              child: Icon(Icons.cancel_presentation, size: 30, color: Colors.red,))
        ],
      ),
      content: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: Get.width * 0.8 ,
            child: ResuableTextField(
                controllerValue: otListVM.surgeryNoteController.value,
                hintText: "Test")),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
              onTap: (){
                setState(() {
                  otListVM.surgeryNotePost(widget.noteId, widget.id, widget.userId);
                  otListVM.surgeryNoteController.value.clear();
                });

               Navigator.pop(context);
              },
              child: Icon(Icons.save, size: 40, color: Styles.primaryColor,)),
        )
        // cancelButton,
        // continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showEditAlertDialog(BuildContext context, int index, dynamic note)  {

     otListVM.surgeryNoteController.value.text = note;
   AlertDialog alert = AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text("Update Note"),
          InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.cancel_presentation, size: 30, color: Colors.red,))
        ],
      ),
      content: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
            width: Get.width * 0.8 ,
            child: ResuableTextField(
                controllerValue: otListVM.surgeryNoteController.value,
                hintText: "Test")),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
              onTap: (){
                setState(() {
                  otListVM.editSurgeryNote(widget.noteId, otListVM.surgeryNoteItem[index].id);

                });

                Navigator.pop(context);

             //   print("note ${note}");
              },
              child: Icon(Icons.save, size: 40, color: Styles.primaryColor,)),
        )
        // cancelButton,
        // continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}



