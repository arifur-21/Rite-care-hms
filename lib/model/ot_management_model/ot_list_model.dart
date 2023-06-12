// import 'package:ritecare_hms/model/ot_schedule_model0/patient.dart';


// import '../ot_schedule_model0/item.dart';
// import '../ot_schedule_model0/operation_room.dart';
// import '../ot_schedule_model0/surgery_note.dart';
// import '../ot_schedule_model0/surgery_status.dart';
// import '../ot_schedule_model0/surgery_type.dart';

import 'ot_schedule_model0/surgery.dart';

class OtScheduleModel {
  List<Surgery>? items;
  int? totalItems;

  OtScheduleModel({this.items, this.totalItems});

  OtScheduleModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null && json['items'] != '') {
      items = <Surgery>[];
      json['items'].forEach((v) {
        items!.add(Surgery.fromJson(v));
      });
    }
    totalItems = json['totalItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['totalItems'] = totalItems;
    return data;
  }
}

// class Items {
//   dynamic id;
//   dynamic surgeryTypeId;
//   dynamic patientId;
//   dynamic surgeryItemId;
//   dynamic surgeryStatusId;
//   dynamic userId;
//   bool? active;
//   dynamic branchId;
//   dynamic tenantId;
//   dynamic roomId;
//   dynamic surgeryScheduleDate;
//   bool? instrumentReceived;
//   bool? instrumentRefund;
//   bool? archived;
//   dynamic startTime;
//   dynamic endTime;
//   dynamic surgeryServiceProviderMaps;
//   OperationRoom? operationRoom;
//   dynamic disease;
//   dynamic aNS;
//   dynamic aSA;
//   dynamic ward;
//   bool? isApproved;
//   dynamic approvedUserId;
//   SurgeryType? surgeryType;
//   SurgeryStatus? surgeryStatus;
//   Patient? patient;
//   Item? item;
//   List<SurgeryNote>? surgeryNotes;

//   Items({
//     this.id,
//     this.surgeryTypeId,
//     this.patientId,
//     this.surgeryItemId,
//     this.surgeryStatusId,
//     this.userId,
//     this.active,
//     this.branchId,
//     this.tenantId,
//     this.roomId,
//     this.surgeryScheduleDate,
//     this.startTime,
//     this.endTime,
//     this.instrumentReceived,
//     this.instrumentRefund,
//     this.archived,
//     this.disease,
//     this.aNS,
//     this.aSA,
//     this.ward,
//     this.isApproved,
//     this.approvedUserId,
//     this.surgeryServiceProviderMaps,
//     this.surgeryType,
//     this.surgeryStatus,
//     this.operationRoom,
//     this.patient,
//     this.item,
//     this.surgeryNotes,
//   });

//   Items.fromJson(Map<String, dynamic> json) {
//     id = json['Id'];
//     surgeryTypeId = json['SurgeryTypeId'];
//     patientId = json['PatientId'];
//     surgeryItemId = json['SurgeryItemId'];
//     surgeryStatusId = json['SurgeryStatusId'];
//     userId = json['UserId'];
//     active = json['Active'];
//     branchId = json['BranchId'];
//     tenantId = json['TenantId'];
//     roomId = json['RoomId'];
//     startTime = json['StartTime'];
//     endTime = json['EndTime'];
//     surgeryScheduleDate = json['SurgeryScheduleDate'];
//     instrumentReceived = json['InstrumentReceived'];
//     instrumentRefund = json['InstrumentRefund'];
//     archived = json['Archived'];
//     disease = json['Disease'];
//     aNS = json['ANS'];
//     aSA = json['ASA'];
//     ward = json['Ward'];
//     isApproved = json['IsApproved'];
//     approvedUserId = json['ApprovedUserId'];
//     surgeryType = json['SurgeryType'] != null
//         ? SurgeryType.fromJson(json['SurgeryType'])
//         : null;
//     surgeryStatus = json['SurgeryStatus'] != null
//         ? SurgeryStatus.fromJson(json['SurgeryStatus'])
//         : null;
//     item = json['Item'] != null ? Item.fromJson(json['Item']) : null;

//     patient =
//         json['Patient'] != null ? Patient.fromJson(json['Patient']) : null;
//     operationRoom = json['OperationRoom'] == null
//         ? null
//         : OperationRoom.fromJson(json['OperationRoom'] as Map<String, dynamic>);
//     surgeryServiceProviderMaps = json['SurgeryServiceProviderMaps'];
//     /* if (json['SurgeryNotes'] != null) {
//       surgeryNotes = <Null>[];
//       json['SurgeryNotes'].forEach((v) {
//       });
//     }*/
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Id'] = id;
//     data['SurgeryTypeId'] = surgeryTypeId;
//     data['PatientId'] = patientId;
//     data['SurgeryItemId'] = surgeryItemId;
//     data['SurgeryStatusId'] = surgeryStatusId;
//     data['UserId'] = userId;
//     data['Active'] = active;
//     data['BranchId'] = branchId;
//     data['TenantId'] = tenantId;
//     data['RoomId'] = roomId;
//     data['SurgeryScheduleDate'] = surgeryScheduleDate;
//     data['InstrumentReceived'] = instrumentReceived;
//     data['InstrumentRefund'] = instrumentRefund;
//     data['Archived'] = archived;
//     data['Disease'] = disease;
//     data['StartTime'] = startTime;
//     data['EndTime'] = endTime;
//     data['SurgeryServiceProviderMaps'] = surgeryServiceProviderMaps;
//     data['ANS'] = aNS;
//     data['ASA'] = aSA;
//     data['Ward'] = ward;
//     data['IsApproved'] = isApproved;
//     data['ApprovedUserId'] = approvedUserId;
//     if (surgeryType != null) {
//       data['SurgeryType'] = surgeryType!.toJson();
//     }
//     if (operationRoom != null) {
//       data['OperationRoom'] = operationRoom!.toJson();
//     }
//     if (surgeryStatus != null) {
//       data['SurgeryStatus'] = surgeryStatus!.toJson();
//     }
//     if (item != null) {
//       data['Item'] = item!.toJson();
//     }
//     if (patient != null) {
//       data['Patient'] = patient!.toJson();
//     }
//     if (surgeryNotes != null) {}
//     return data;
//   }
// }

// class SurgeryType {
//   dynamic? id;
//   dynamic? name;
//   SurgeryType({
//     this.id,
//     this.name,
//   });

//   SurgeryType.fromJson(Map<String, dynamic> json) {
//     id = json['Id'];
//     name = json['Name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Id'] = this.id;
//     data['Name'] = this.name;
//     return data;
//   }
// }

// class SurgeryStatus {
//   dynamic? id;
//   dynamic? name;
//   dynamic? userId;
//   SurgeryStatus({this.id, this.name, this.userId});

//   SurgeryStatus.fromJson(Map<String, dynamic> json) {
//     id = json['Id'];
//     name = json['Name'];
//     userId = json['UserId'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Id'] = this.id;
//     data['Name'] = this.name;
//     data['UserId'] = this.userId;
//     return data;
//   }
// }

// class Patient {
//   dynamic? id;
//   dynamic? oldId;
//   dynamic? firstName;

//   Patient({
//     this.id,
//     this.oldId,
//     this.firstName,
//   });
//   Patient.fromJson(Map<String, dynamic> json) {
//     id = json['Id'];
//     oldId = json['OldId'];
//     firstName = json['FirstName'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Id'] = this.id;
//     data['OldId'] = this.oldId;
//     data['FirstName'] = this.firstName;
//     return data;
//   }
// }

// class Item {
//   dynamic? name;
//   Item({
//     this.name,
//   });
//   Item.fromJson(Map<String, dynamic> json) {
//     name = json['Name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Name'] = this.name;
//     return data;
//   }
// }

// class SurgeryNotes {
//   dynamic? id;
//   dynamic? surgeryId;
//   dynamic? note;
//   dynamic? userId;
//   bool? active;

//   SurgeryNotes({this.id, this.surgeryId, this.note, this.userId, this.active});

//   SurgeryNotes.fromJson(Map<String, dynamic> json) {
//     id = json['Id'];
//     surgeryId = json['SurgeryId'];
//     note = json['Note'];
//     userId = json['UserId'];
//     active = json['Active'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Id'] = this.id;
//     data['SurgeryId'] = this.surgeryId;
//     data['Note'] = this.note;
//     data['UserId'] = this.userId;
//     data['Active'] = this.active;
//     return data;
//   }
// }
