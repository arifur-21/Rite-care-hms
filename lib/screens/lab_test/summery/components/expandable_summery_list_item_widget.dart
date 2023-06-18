

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../model/lab_test_model/summery_model0/item.dart';
import '../../../../model/lab_test_model/summery_model0/patient_services/patient_services.dart';
import '../../../../utils/color_styles.dart';
import '../../../../view_model/approved_view_model/approved_view_model.dart';
import '../../../../view_model/logged_in_user_view_model/logged_in_users_view_model.dart';
import '../../../../view_model/markes_delevered_view_model/markes_delevered_view_model.dart';
import '../../../../view_model/summery_view_model/marke_as_priented/marke_as_printed_view_model.dart';
import '../../../../view_model/summery_view_model/summery_details_view_model.dart';
import '../../../../view_model/summery_view_model/summery_view_model.dart';
import '../../../report_result_screen/report_screen.dart';
import '../lab_report_result_print_screem.dart';
import 'lab12_screen.dart';

class ExpandableSummeryListItem extends StatefulWidget {

  final String? name;
  final VoidCallback? onPressed;
  final dynamic? statusId;
  final String? status;
  bool btnVisibility = false;
  List<PatientServices>? summeryList;
  dynamic index;
  dynamic userTenentId;
  dynamic userSPermissionId;
  Item summeryListItem;



  ExpandableSummeryListItem({ this.name, this.onPressed, this.statusId, this.status, this.summeryList, this.index, this.userTenentId, this.userSPermissionId, required this.summeryListItem});

  @override
  State<ExpandableSummeryListItem> createState() => _ExpandableSummeryListItemState();
}

class _ExpandableSummeryListItemState extends State<ExpandableSummeryListItem> {

  final markeasDeleveredVM = MarkesDeleveredViewModel();
  final markeAsPrintedVM = MarkeAsPrintedViewModel();
  final loggedInUserVM = LoggedInUserViewModel();
  final tableRowDesignVm = Get.put(SummeryDetailsViewModel());
  final approvedVM = Get.put(ApprovedViewModel());
  String? status;
  dynamic statusId;
  dynamic itemId;
  dynamic serviceId;
  dynamic pS_TenentId; //pS-> patient service
  dynamic lU_TenentId; //lU-> logged in user
  dynamic uS_providerSingPId; // User.ServiceProviderSignPermission.Id
  dynamic pS_signApprovedBy; //patientservice.SignApprovedBy
  dynamic pS_labStatusId; //patientservice.LabStatusId
  dynamic labStatusCompleted; //LabStatusCompleted
  dynamic labStatusPrinted; //LabStatusPrinted
  bool editBtnVisibility = false;
  bool approvedVisibility = false;


  @override
  void initState() {
    loggedInUserVM.getLoggedInUserData();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    print("service id11 ${serviceId}");
    print("user tenent id123 ${widget.userTenentId}");
    print("user permission ${widget.userSPermissionId}");
    // print("data${  tableRowDesignVm.tableRowDesignListItem.value.design![0].unit?.name}");
    return  Column(
      children: [
        Container(
          height: 150,
          child:  ListView.builder(
            itemCount: widget.summeryList?.length,
            itemBuilder: (context, index){



              statusId = widget.summeryList![index].labStatusId;
              itemId = widget.summeryList![index].itemId;
              serviceId = widget.summeryList![index].id;
              pS_TenentId = widget.summeryList![index].patient?.tenantId;
              pS_labStatusId = serviceId = widget.summeryList![index]?.labStatusId;
              pS_signApprovedBy = serviceId = widget.summeryList![index]?.signApprovedBy;


              if(statusId == 1){
                status = "Pending";
              }
              else if(statusId == 2){
                status = "Completed";
              }
              else if(statusId == 3){
                status = "Delivered";
              }
              else if(statusId == 4){
                status = "Collected";
              }else if(statusId == 5){
                status = "Printed";
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(width: 2, color: Styles.primaryColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text("${widget.summeryList![index].item?.name}", style: Styles.poppinsFontBlack12_500)),
                            SizedBox(width: 10,),
                            Expanded(
                                flex: 1,
                                child: Text("${widget.summeryList![index].doctorName}",style: Styles.poppinsFontBlack12_300)),
                            SizedBox(width: 10,),
                            Expanded(
                                flex: 1,
                                child: Text("${widget.summeryList![index].item?.itemCategory?.name}",style: Styles.poppinsFontBlack12_300))

                          ],),
                        SizedBox(height: 20,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                                height: 24,
                                width: 100,
                                decoration: BoxDecoration(
                                  color:  (statusId == 1)? Colors.red : (statusId == 2)? Colors.green : (statusId == 3)? Colors.orange : (statusId == 4)? Colors.blue : Colors.indigo,
                                  border: Border(),
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Center(child: Text("$status", style: Styles.poppinsFont12_600))

                            ),




                            ((pS_TenentId == widget.userTenentId) && (widget.userSPermissionId >0) && (pS_signApprovedBy == 0) && (pS_labStatusId == 2 || pS_labStatusId == 5)) ?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: (){

                                    setState(() {
                                      _markeAsPrintedAlertDialog(summeryListItem: widget.summeryListItem, index: index);
                                    });

                                  },
                                  child: Visibility(
                                    visible: (statusId == 3) ? widget.btnVisibility = false : (statusId == 2) ? widget.btnVisibility = false : (statusId == 5) ? widget.btnVisibility = false : widget.btnVisibility = false,
                                    child: Text("Mark as Printed"),
                                  ),
                                ),

                                SizedBox(width: 10,),

                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ReportScreen(
                                                  serviceId: serviceId,
                                                  patientService:
                                                  widget.summeryList![
                                                  index],
                                                )));
                                  },
                                  child: Visibility(
                                    visible: (statusId == 1) ? widget.btnVisibility = false : (statusId == 4) ? widget.btnVisibility = true : (statusId == 2) ? widget.btnVisibility = true : widget.btnVisibility = false,
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('assets/icons/edit.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12,),

                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Lab12Screen()));
                                  },
                                  child: Visibility(
                                    visible: (statusId == 1) ? widget.btnVisibility = false : (statusId == 2) ? widget.btnVisibility = false : (statusId == 4) ? widget.btnVisibility = true :  widget.btnVisibility = false,
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('assets/icons/file.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12,),

                                InkWell(
                                  onTap: (){

                                    _approvedAlertDialog(patientServices: widget.summeryList![index]);
                                  },
                                  child: Visibility(
                                    visible:(statusId == 1) ? widget.btnVisibility = false : (statusId == 2) ? widget.btnVisibility = true : (statusId == 5) ? widget.btnVisibility = true : widget.btnVisibility = false,
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('assets/icons/correct.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                ),


                                Visibility(
                                  visible: approvedVisibility,
                                  child: InkWell(
                                    onTap: (){
                                      _approvedAlertDialog(patientServices: widget.summeryList![index]);
                                    },
                                    child: Visibility(
                                      visible:(statusId == 1) ? widget.btnVisibility = false : (statusId == 2) ? widget.btnVisibility = true : (statusId == 5) ? widget.btnVisibility = true : widget.btnVisibility = false,
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage('assets/icons/approved2.png')
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),


                                SizedBox(width: 12,),


                                InkWell(
                                  onTap: (){

                                    Get.to(LabReportResultPrintScreen(
                                      itemId: widget.summeryList![index].itemId,
                                      serviceId: widget.summeryList![index].id,
                                    ));
                                  },
                                  child: Visibility(
                                    visible: (statusId == 3) ? widget.btnVisibility = true : (statusId == 2) ? widget.btnVisibility = true : (statusId == 5) ? widget.btnVisibility = true : widget.btnVisibility = false,
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('assets/icons/printer.png')
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12,),

                                InkWell(
                                  onTap: (){
                                    _markasDeleveredAlertDialog(summeryListItem: widget.summeryListItem, index: index);
                                  },
                                  child: Visibility(
                                    visible: (statusId == 3) ? widget.btnVisibility = false : (statusId == 2) ? widget.btnVisibility = false : (statusId == 5) ? widget.btnVisibility = true : widget.btnVisibility = false,
                                    child: Text("Mark as Delivered"),
                                  ),
                                ),


                              ],
                            ) :
                                /////////////end logged in user

                                ///////////// start
                            Row(children: [
                              InkWell(
                                onTap: (){
                                  _markeAsPrintedAlertDialog(summeryListItem: widget.summeryListItem, index: index);
                                },
                                child: Visibility(
                                  visible: (statusId == 3) ? widget.btnVisibility = false : (statusId == 2) ? widget.btnVisibility = true : (statusId == 5) ? widget.btnVisibility = false : widget.btnVisibility = false,
                                  child: Text("Mark as Printed"),
                                ),
                              ),

                              SizedBox(width: 10,),
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ReportScreen(
                                                serviceId: serviceId,
                                                patientService:
                                                widget.summeryList![
                                                index],
                                              )));
                                },
                                child: Visibility(
                                  visible: (statusId == 1) ? editBtnVisibility = false : (statusId == 4) ? editBtnVisibility = true : (statusId == 2) ? editBtnVisibility = false : editBtnVisibility = false,
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/icons/edit.png')
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              InkWell(
                                onTap: (){
                                /*  Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateReportScreen(
                                    itemId: widget.summeryList![index].itemId,
                                    serviceId: widget.summeryList![index].id,
                                  )));*/
                                },
                                child: Visibility(
                                  visible: (statusId == 1) ? editBtnVisibility = false : (statusId == 4) ? editBtnVisibility = false : (statusId == 2) ? editBtnVisibility = true : editBtnVisibility = false,
                                  child: Icon(Icons.view_agenda_sharp),
                                  /* Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('assets/icons/edit.png')
                                        ),
                                      ),
                                    ),*/
                                ),
                              ),
                              SizedBox(width: 12,),

                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Lab12Screen()));
                                },
                                child: Visibility(
                                  visible: (statusId == 1) ? widget.btnVisibility = false : (statusId == 2) ? widget.btnVisibility = true : (statusId == 4) ? widget.btnVisibility = true :  widget.btnVisibility = false,
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/icons/file.png')
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 12,),


                              InkWell(
                                onTap: (){
                                  Get.to(LabReportResultPrintScreen(
                                    itemId: widget.summeryList![index].itemId,
                                    serviceId: widget.summeryList![index].id,
                                  ));
                                },
                                child: Visibility(
                                  visible: (statusId == 3) ? widget.btnVisibility = true : (statusId == 2) ? widget.btnVisibility = false : (statusId == 5) ? widget.btnVisibility = true : widget.btnVisibility = false,
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/icons/printer.png')
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12,),

                              InkWell(
                                onTap: (){
                                  _markasDeleveredAlertDialog(summeryListItem: widget.summeryListItem, index: index);

                                },
                                child: Visibility(
                                  visible: (statusId == 3) ? widget.btnVisibility = false : (statusId == 2) ? widget.btnVisibility = false : (statusId == 5) ? widget.btnVisibility = true : widget.btnVisibility = false,
                                  child: Text("Mark as Delivered"),
                                ),
                              ),


                            ],),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }, ),
        ),
      ],
    );
  }



  _approvedAlertDialog  ({ required PatientServices patientServices}) async {
    print("patient service data ${patientServices.itemId}");

    await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(

            builder: (context, setState) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.cancel_presentation, size: 30, color: Colors.red,)),
                ],
              ),

              content: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do you want to change status"),
                    SizedBox(height: 10,),
                    Text(" ${status}", style: TextStyle(color: Colors.red,fontSize: 20, fontWeight: FontWeight.w800),),
                  ],),
              ),

              actions: [
                InkWell (
                    onTap: (){
                      setState(() {

                        patientServices.serviceDate = "2023-06-15 05:03:32 PM";
                        approvedVM.postApprovedApiData(data: patientServices);


                      });
                        Navigator.pop(context);


                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Confrom', style: TextStyle(fontSize: 20),),
                    )),

              ],
            ),
          );
        });
  }

  _markasDeleveredAlertDialog  ({ required  Item summeryListItem, required int index}) async {

    await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(

            builder: (context, setState) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.cancel_presentation, size: 30, color: Colors.red,)),
                ],
              ),

              content: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do you want to change status"),
                    SizedBox(height: 10,),
                    Text(" ${status}", style: TextStyle(color: Colors.red,fontSize: 20, fontWeight: FontWeight.w800),),
                  ],),
              ),

              actions: [
                InkWell (
                    onTap: (){
                      setState(() {
                        widget.summeryListItem.invoiceDate = "2023-06-14 04:22:29 PM";
                        widget.summeryListItem.dueDate = "2023-06-14 04:22:29 PM";
                        widget.summeryListItem.patientServices![index].serviceDate = "2023-06-14 04:22:29 PM";
                        widget.summeryListItem.patientServices![index].labStatusId = 3;
                        print("widget ${widget.summeryListItem}");

                        dynamic data  = {
                          "pinvoice":  jsonDecode(jsonEncode(widget.summeryListItem))

                        };

                        markeasDeleveredVM.postMarkeAsDelevered(data: data);



                      });
                        Navigator.pop(context);


                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Confrom', style: TextStyle(fontSize: 20),),
                    )),

              ],
            ),
          );
        });
  }


  _markeAsPrintedAlertDialog  ({ required  Item summeryListItem, required int index}) async {

    await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(

            builder: (context, setState) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.cancel_presentation, size: 30, color: Colors.red,)),
                ],
              ),

              content: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do you want to change status"),
                    SizedBox(height: 10,),
                    Text(" ${status}", style: TextStyle(color: Colors.red,fontSize: 20, fontWeight: FontWeight.w800),),
                  ],),
              ),

              actions: [
                InkWell (
                    onTap: (){
                      setState(() {
                     /*   widget.summeryListItem.invoiceDate = "2023-06-14 04:22:29 PM";
                        widget.summeryListItem.dueDate = "2023-06-14 04:22:29 PM";
                        widget.summeryListItem.patientServices![index].labStatusId = 3;
                        print("widget ${widget.summeryListItem}");*/

                        widget.summeryListItem.patientServices![index].labStatusId = 5;
                        dynamic data  =  jsonDecode(jsonEncode(widget.summeryListItem));

                       /* dynamic data = [
                          {
                            "PatientID": 776083,
                            "ItemId": 301868,
                            "InvoiceID": 551383,
                            "ReceiptId": null,
                            "PatientAdmissionId": null,
                            "NurseStationId": null,
                            "ServiceListPrice": 450,
                            "ServiceActualPrice": 450,
                            "ServiceQuantity": 1,
                            "ServiceDate": "2023-06-15 05:13:12 PM",
                            "ReferralPaidDate": null,
                            "ModifiedDate": null,
                            "CheckoutTime": null,
                            "ServiceProviderId": 71199,
                            "DoctorId": 71199,
                            "DoctorName": "CMH Ghatail OPD",
                            "ReturnQantity": null,
                            "ReturnPrice": null,
                            "ReturnPaid": null,
                            "ReferrerPaidUserId": null,
                            "ReferrerPaidUser": null,
                            "Discount": 0,
                            "DiscountAfterInvoice": false,
                            "IsBothSideDiscount": true,
                            "DiscountPercentage": 0,
                            "Refund": false,
                            "RefundApprovedBy": null,
                            "RefundStatus": null,
                            "RefundApproval": false,
                            "IsReturn": false,
                            "RefundNote": null,
                            "Billed": true,
                            "ReferralFee": 0,
                            "ReferralFeePaid": false,
                            "ReferralFeeActual": 0,
                            "DeliveryDate": "0001-01-01 06:01:40 AM",
                            "DeliveryTime": null,
                            "ReportFormatName": null,
                            "LabStatusId": 2,
                            "InventoryId": null,
                            "ModifiedBy": 30515,
                            "PrescriptionItemId": null,
                            "SampleId": 10002424,
                            "Sl": "01",
                            "IsSpecialItem": false,
                            "PackageItemId": null,
                            "PackageSeviceId": null,
                            "SlideNumber": null,
                            "SignApprovedDate": null,
                            "SignApprovedBy": 30515,
                            "IsForeignMission": false,
                            "IsBarCodePrint": true,
                            "SignApprovedByUser": null,
                            "Item": {
                              "Name": "Anti HBe",
                              "GenericName": null,
                              "Code": "0716",
                              "CompanyName": null,
                              "ItemTypeId": 32,
                              "MedicalTypeId": 62,
                              "ItemSpecimentId": 128,
                              "ItemCategoryId": 70708,
                              "ItemSubCategoryId": null,
                              "ItemGroupCategoryId": null,
                              "ItemSubGroupCategoryId": null,
                              "SupplierOrVendorId": null,
                              "Strength": null,
                              "Formulation": null,
                              "IsAntibiotic": false,
                              "MedicineTypeId": null,
                              "IsSurgeryItem": false,
                              "MeasurementUnitId": null,
                              "SalePrice": 450,
                              "BuyPrice": 0,
                              "ServiceProviderId": null,
                              "ReferralAllowed": true,
                              "Description": "",
                              "DefaultReferrarFee": 0,
                              "LabReportGroupId": 10245,
                              "NurseStationId": null,
                              "NurseStation": null,
                              "TaskTypeId": 0,
                              "TaskType": null,
                              "LabCountDay": 1,
                              "IsLabReportItem": false,
                              "IsActive": true,
                              "CreatedDate": "/Date(1678358910180)/",
                              "NoEquipment": false,
                              "IsCustomTemplate": false,
                              "LabItemSerialNo": 0,
                              "NoDiscount": false,
                              "ShortCode": "HBeAb",
                              "IsSlideRequired": false,
                              "BedOccupancies": [],
                              "Inventories": [],
                              "Item_ItemGroup": [],
                              "ItemDefaults": [],
                              "ItemReorders": [],
                              "InitialSetupItems": [],
                              "ServiceProviderSurgeryPrices": [],
                              "ItemType": null,
                              "ItemSpeciment": {
                                "Name": "blood",
                                "MedicalTypeId": 62,
                                "Items": [],
                                "MedicalType": null,
                                "TenantId": 25,
                                "Tenant": null,
                                "Id": 128,
                                "Active": true,
                                "UserId": 30491,
                                "HasErrors": false,
                                "ErrorCount": 0,
                                "NoErrors": true
                              },
                              "ItemCategory": {
                                "Name": "Virology",
                                "MedicalTypeId": 62,
                                "ReferralCommission": null,
                                "IsPathology": true,
                                "SampleId": 10000000,
                                "Items": [],
                                "ItemSubCategories": [],
                                "MedicalType": null,
                                "TenantId": 25,
                                "Tenant": null,
                                "Id": 70708,
                                "Active": true,
                                "UserId": 30515,
                                "HasErrors": false,
                                "ErrorCount": 0,
                                "NoErrors": true
                              },
                              "ItemSubCategory": null,
                              "ItemGroupCategory": null,
                              "ItemSubGroupCategory": null,
                              "MedicineType": null,
                              "MeasurementUnit": null,
                              "MedicalType": null,
                              "ServiceProvider": null,
                              "LabReportGroup": {
                                "Name": "Virology-01",
                                "Items": [],
                                "BranchId": 0,
                                "Branch": null,
                                "TenantId": 25,
                                "Tenant": null,
                                "Id": 10245,
                                "Active": true,
                                "UserId": 30490,
                                "HasErrors": false,
                                "ErrorCount": 0,
                                "NoErrors": true
                              },
                              "SupplierOrVendor": null,
                              "PackageDetails": [],
                              "PatientServices": [],
                              "ReceiptPayments": [],
                              "InventoryItem": [],
                              "ItemRequisition": [],
                              "Item_SuplierOrVendors": [],
                              "ItemwiseValues": null,
                              "ExpiryDate": "N/A",
                              "Inventory": null,
                              "Quantity": 0,
                              "PrescriptionItemId": null,
                              "ParentItemId": 0,
                              "ParentCategoryId": 0,
                              "IsSpecialItem": false,
                              "GroupFormatName": "<span class='highLight'>Anti HBe</span>",
                              "BranchId": 0,
                              "Branch": null,
                              "TenantId": 25,
                              "Tenant": null,
                              "Id": 301868,
                              "Active": true,
                              "UserId": 30490,
                              "HasErrors": false,
                              "ErrorCount": 0,
                              "NoErrors": true
                            },
                            "LabStatus": null,
                            "Inventory": null,
                            "User": null,
                            "ModifiedByUser": {
                              "ContactId": 0,
                              "UserName": "admin@rite.com.bd",
                              "Password": null,
                              "RoleId": 0,
                              "IsConsolidateReport": false,
                              "IsHrmUser": false,
                              "CreatedDate": "/Date(1686477803110)/",
                              "LanguageCode": null,
                              "LoginId": 0,
                              "PatientStatusId": 0,
                              "Coa": null,
                              "HrmAccessToken": null,
                              "HrmUrl": null,
                              "TenantName": null,
                              "Contact": {
                                "FirstName": "Alamgir",
                                "LastName": "Kabir",
                                "PhoneNumber": "123",
                                "GenderId": 1,
                                "Street": null,
                                "City": null,
                                "Zip": null,
                                "Country": "BD",
                                "Email": "admin@afip.com",
                                "Fax": null,
                                "WebSite": null,
                                "Photo": null,
                                "IsCompany": null,
                                "ServiceProviders": [],
                                "ServiceProviderType": 0,
                                "Gender": {
                                  "Name": "Male",
                                  "Code": 101,
                                  "TypeName": "Male",
                                  "User": null,
                                  "BloodDonors": [],
                                  "Id": 1,
                                  "Active": true,
                                  "UserId": 2,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                "TenantId": 25,
                                "Tenant": null,
                                "Id": 102157,
                                "Active": true,
                                "UserId": 30490,
                                "HasErrors": false,
                                "ErrorCount": 0,
                                "NoErrors": true
                              },
                              "Role": null,
                              "UserTypeId": 0,
                              "IsPermittedForeignMission": false,
                              "IsOTApproval": true,
                              "Expenses": null,
                              "PatientServices": null,
                              "UserPatientStatusList": [
                                {
                                  "PatientStatusId": 1,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "PatientStatus": {
                                    "Name": "VIP",
                                    "Prefix": "V         ",
                                    "LanguageCode": null,
                                    "Id": 1,
                                    "Active": true,
                                    "UserId": null,
                                    "HasErrors": false,
                                    "ErrorCount": 0,
                                    "NoErrors": true
                                  },
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 188,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "PatientStatusId": 2,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "PatientStatus": {
                                    "Name": "VVIP",
                                    "Prefix": "VV",
                                    "LanguageCode": null,
                                    "Id": 2,
                                    "Active": true,
                                    "UserId": null,
                                    "HasErrors": false,
                                    "ErrorCount": 0,
                                    "NoErrors": true
                                  },
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 189,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "PatientStatusId": 3,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "PatientStatus": {
                                    "Name": "ForeignMission",
                                    "Prefix": "F         ",
                                    "LanguageCode": null,
                                    "Id": 3,
                                    "Active": true,
                                    "UserId": null,
                                    "HasErrors": false,
                                    "ErrorCount": 0,
                                    "NoErrors": true
                                  },
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 190,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                }
                              ],
                              "ImportTenantId": 0,
                              "ImportBranchId": 0,
                              "UserItemCategories": [
                                {
                                  "ItemCategoryId": 70676,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11714,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70709,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11715,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70699,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11716,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70694,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11717,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 80842,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11718,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70700,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11719,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 80843,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11720,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70675,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11721,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70695,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11722,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70696,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11723,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70697,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11724,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70698,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11725,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 80844,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11726,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 80845,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11727,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70704,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11728,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70692,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11729,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70677,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11730,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 80846,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11731,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70708,
                                  "UserId": null,
                                  "IsSelected": true,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11732,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70676,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11773,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70709,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11774,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70699,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11775,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70694,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11776,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 80842,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11777,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70700,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11778,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 80843,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11779,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70675,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11780,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70695,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11781,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70696,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11782,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70697,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11783,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70698,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11784,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 80844,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11785,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 80845,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11786,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70704,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11787,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70692,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11788,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70677,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11789,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 80846,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11790,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                {
                                  "ItemCategoryId": 70708,
                                  "UserId": null,
                                  "IsSelected": false,
                                  "CreatedDate": null,
                                  "User": null,
                                  "ItemCategory": null,
                                  "TenantId": 0,
                                  "Tenant": null,
                                  "Id": 11791,
                                  "Active": true,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                }
                              ],
                              "InActive": false,
                              "BranchId": 33,
                              "Branch": null,
                              "TenantId": 25,
                              "Tenant": null,
                              "Id": 30515,
                              "Active": true,
                              "UserId": null,
                              "HasErrors": false,
                              "ErrorCount": 0,
                              "NoErrors": true
                            },
                            "Patient": {
                              "OldId": null,
                              "FirstName": "Aslam Uddin",
                              "LastName": "",
                              "PhoneNumber": "876282627",
                              "GenderId": 0,
                              "BloodGroup": null,
                              "BloodGroupId": null,
                              "FatherName": null,
                              "DOB": null,
                              "NationalId": "",
                              "Occupation": "",
                              "Street": "",
                              "City": "",
                              "Zip": "",
                              "Country": null,
                              "Email": "",
                              "Photo": "null",
                              "EmergencyNumber": "",
                              "EmergencyContactName": "",
                              "EmergencyContactRelation": "",
                              "CreatedDate": "/Date(1685255537930)/",
                              "ServiceId": "777",
                              "RelationshipId": null,
                              "RankId": 179,
                              "TradeId": null,
                              "ServiceTypeId": null,
                              "RankTypeId": null,
                              "UnitName": "71 Bde",
                              "RankName": "Capt",
                              "TradeName": null,
                              "UnitId": 0,
                              "IsRetired": false,
                              "PatientPrefixId": 0,
                              "PatientStatusId": null,
                              "Sex": null,
                              "OldDob": null,
                              "Gender": null,
                              "PatientPrefix": null,
                              "PatientStatus": null,
                              "Memberships": [],
                              "PatientInvoices": [],
                              "PatientServices": [],
                              "Payments": [],
                              "DoctorAppointments": [],
                              "Relationship": null,
                              "Rank": {
                                "Name": "Capt",
                                "LanguageCode": null,
                                "Id": 179,
                                "Active": true,
                                "UserId": null,
                                "HasErrors": false,
                                "ErrorCount": 0,
                                "NoErrors": true
                              },
                              "Unit": null,
                              "Trade": null,
                              "ParentPatient": null,
                              "VisitNo": null,
                              "PatientInvoiceShadowId": 9631,
                              "TenantId": 25,
                              "Tenant": null,
                              "Id": 776083,
                              "Active": true,
                              "UserId": null,
                              "HasErrors": false,
                              "ErrorCount": 0,
                              "NoErrors": true
                            },
                            "PatientInvoice": null,
                            "ServiceProvider": {
                              "ContactId": 112169,
                              "Title": "",
                              "ServiceProviderTypeId": 56,
                              "NurseStationId": null,
                              "DepartmentId": 532,
                              "Degree": "",
                              "Speciality": "",
                              "Description": "",
                              "Code": "1002",
                              "AssignedToAllUsers": true,
                              "IsInHouse": true,
                              "IsReferer": true,
                              "Designation": "",
                              "HasSigningPermission": false,
                              "IsSurgeon": false,
                              "JoiningDate": null,
                              "CreatedDate": "/Date(1644483532000)/",
                              "ReferrerTypeId": 29,
                              "Contact": {
                                "FirstName": "CMH",
                                "LastName": "Ghatail OPD",
                                "PhoneNumber": "111",
                                "GenderId": 1,
                                "Street": "",
                                "City": "",
                                "Zip": "",
                                "Country": "BD",
                                "Email": "",
                                "Fax": "",
                                "WebSite": "null",
                                "Photo": "null",
                                "IsCompany": null,
                                "ServiceProviders": [],
                                "ServiceProviderType": 56,
                                "Gender": {
                                  "Name": "Male",
                                  "Code": 101,
                                  "TypeName": "Male",
                                  "User": null,
                                  "BloodDonors": [],
                                  "Id": 1,
                                  "Active": true,
                                  "UserId": 2,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                "TenantId": 25,
                                "Tenant": null,
                                "Id": 112169,
                                "Active": true,
                                "UserId": 30515,
                                "HasErrors": false,
                                "ErrorCount": 0,
                                "NoErrors": true
                              },
                              "Department": {
                                "Name": "Medicine",
                                "LabCategoryId": null,
                                "IsCMH": true,
                                "ServiceProviders": [],
                                "TenantId": 25,
                                "Tenant": {
                                  "Name": "mobileapp",
                                  "Url": "mobileapp",
                                  "BranchName": null,
                                  "BranchList": null,
                                  "Id": 25,
                                  "Active": true,
                                  "UserId": 10082,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                "Id": 532,
                                "Active": true,
                                "UserId": 30490,
                                "HasErrors": false,
                                "ErrorCount": 0,
                                "NoErrors": true
                              },
                              "ReferrerType": {
                                "Name": "None",
                                "TenantId": 25,
                                "Tenant": null,
                                "Id": 29,
                                "Active": true,
                                "UserId": null,
                                "HasErrors": false,
                                "ErrorCount": 0,
                                "NoErrors": true
                              },
                              "Items": [],
                              "PatientAdmissions": [],
                              "NurseStationInchargeList": [],
                              "ServiceProviderType": {
                                "Name": "Doctor",
                                "ServiceProviders": [],
                                "LanguageCode": null,
                                "Id": 56,
                                "Active": true,
                                "UserId": null,
                                "HasErrors": false,
                                "ErrorCount": 0,
                                "NoErrors": true
                              },
                              "DepartmentName": null,
                              "ReferralFee": 0,
                              "BranchId": 33,
                              "Branch": {
                                "Name": "Main",
                                "IsMainBranch": false,
                                "TenantId": 25,
                                "Tenant": {
                                  "Name": "mobileapp",
                                  "Url": "mobileapp",
                                  "BranchName": null,
                                  "BranchList": null,
                                  "Id": 25,
                                  "Active": true,
                                  "UserId": 10082,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                "Id": 33,
                                "Active": true,
                                "UserId": 2,
                                "HasErrors": false,
                                "ErrorCount": 0,
                                "NoErrors": true
                              },
                              "TenantId": 25,
                              "Tenant": null,
                              "Id": 71199,
                              "Active": true,
                              "UserId": null,
                              "HasErrors": false,
                              "ErrorCount": 0,
                              "NoErrors": true
                            },
                            "PrescriptionItem": null,
                            "Doctor": {
                              "ContactId": 112169,
                              "Title": "",
                              "ServiceProviderTypeId": 56,
                              "NurseStationId": null,
                              "DepartmentId": 532,
                              "Degree": "",
                              "Speciality": "",
                              "Description": "",
                              "Code": "1002",
                              "AssignedToAllUsers": true,
                              "IsInHouse": true,
                              "IsReferer": true,
                              "Designation": "",
                              "HasSigningPermission": false,
                              "IsSurgeon": false,
                              "JoiningDate": null,
                              "CreatedDate": "/Date(1644483532000)/",
                              "ReferrerTypeId": 29,
                              "Contact": {
                                "FirstName": "CMH",
                                "LastName": "Ghatail OPD",
                                "PhoneNumber": "111",
                                "GenderId": 1,
                                "Street": "",
                                "City": "",
                                "Zip": "",
                                "Country": "BD",
                                "Email": "",
                                "Fax": "",
                                "WebSite": "null",
                                "Photo": "null",
                                "IsCompany": null,
                                "ServiceProviders": [],
                                "ServiceProviderType": 56,
                                "Gender": {
                                  "Name": "Male",
                                  "Code": 101,
                                  "TypeName": "Male",
                                  "User": null,
                                  "BloodDonors": [],
                                  "Id": 1,
                                  "Active": true,
                                  "UserId": 2,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                "TenantId": 25,
                                "Tenant": null,
                                "Id": 112169,
                                "Active": true,
                                "UserId": 30515,
                                "HasErrors": false,
                                "ErrorCount": 0,
                                "NoErrors": true
                              },
                              "Department": {
                                "Name": "Medicine",
                                "LabCategoryId": null,
                                "IsCMH": true,
                                "ServiceProviders": [],
                                "TenantId": 25,
                                "Tenant": {
                                  "Name": "mobileapp",
                                  "Url": "mobileapp",
                                  "BranchName": null,
                                  "BranchList": null,
                                  "Id": 25,
                                  "Active": true,
                                  "UserId": 10082,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                "Id": 532,
                                "Active": true,
                                "UserId": 30490,
                                "HasErrors": false,
                                "ErrorCount": 0,
                                "NoErrors": true
                              },
                              "ReferrerType": {
                                "Name": "None",
                                "TenantId": 25,
                                "Tenant": null,
                                "Id": 29,
                                "Active": true,
                                "UserId": null,
                                "HasErrors": false,
                                "ErrorCount": 0,
                                "NoErrors": true
                              },
                              "Items": [],
                              "PatientAdmissions": [],
                              "NurseStationInchargeList": [],
                              "ServiceProviderType": {
                                "Name": "Doctor",
                                "ServiceProviders": [],
                                "LanguageCode": null,
                                "Id": 56,
                                "Active": true,
                                "UserId": null,
                                "HasErrors": false,
                                "ErrorCount": 0,
                                "NoErrors": true
                              },
                              "DepartmentName": null,
                              "ReferralFee": 0,
                              "BranchId": 33,
                              "Branch": {
                                "Name": "Main",
                                "IsMainBranch": false,
                                "TenantId": 25,
                                "Tenant": {
                                  "Name": "mobileapp",
                                  "Url": "mobileapp",
                                  "BranchName": null,
                                  "BranchList": null,
                                  "Id": 25,
                                  "Active": true,
                                  "UserId": 10082,
                                  "HasErrors": false,
                                  "ErrorCount": 0,
                                  "NoErrors": true
                                },
                                "Id": 33,
                                "Active": true,
                                "UserId": 2,
                                "HasErrors": false,
                                "ErrorCount": 0,
                                "NoErrors": true
                              },
                              "TenantId": 25,
                              "Tenant": null,
                              "Id": 71199,
                              "Active": true,
                              "UserId": null,
                              "HasErrors": false,
                              "ErrorCount": 0,
                              "NoErrors": true
                            },
                            "NurseStation": null,
                            "ReceiptPayment": null,
                            "PatientAdmission": null,
                            "ImagingDetails": [],
                            "PatientServicePayments": null,
                            "SignContactId": 102157,
                            "Isgroup": true,
                            "PatientServiceIds": null,
                            "GroupItemIds": null,
                            "MedicalTypeId": 0,
                            "BeforeReturnPrice": 0,
                            "ReturnBackupPrice": 0,
                            "FullReturnServiceListPrice": 0,
                            "Amount": 0,
                            "MedicalTypeName": null,
                            "PreviousDoctorName": null,
                            "HasImage": false,
                            "BranchId": 33,
                            "Branch": null,
                            "TenantId": 25,
                            "Tenant": null,
                            "Id": 933712,
                            "Active": true,
                            "UserId": 30515,
                            "HasErrors": false,
                            "ErrorCount": 0,
                            "NoErrors": true,
                            "Selected": true,
                            "StatusName": "Completed"
                          }
                        ];*/

                        markeAsPrintedVM.postMarkAsPrintedDAta(data: data);

                      });
                        Navigator.pop(context);


                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Confrom', style: TextStyle(fontSize: 20),),
                    )),

              ],
            ),
          );
        });
  }
}