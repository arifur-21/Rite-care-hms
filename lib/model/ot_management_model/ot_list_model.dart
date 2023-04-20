import '../lab_test_model/simple_list_models.dart';

class OtScheduleModel {
  List<Items>? items;
  int? totalItems;

  OtScheduleModel({this.items, this.totalItems});

  OtScheduleModel.fromJson(Map<String, dynamic> json) {
    print("from json");
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    totalItems = json['totalItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['totalItems'] = this.totalItems;
    return data;
  }
}

class Items {
  int? id;
  int? surgeryTypeId;
  int? patientId;
  int? surgeryItemId;
  int? surgeryStatusId;
  int? userId;
  bool? active;
  int? branchId;
  int? tenantId;
  int? roomId;
  String? surgeryScheduleDate;
  bool? instrumentReceived;
  bool? instrumentRefund;
  bool? archived;
  String? disease;
  String? aNS;
  String? aSA;
  String? ward;
  bool? isApproved;
  int? approvedUserId;
  SurgeryType? surgeryType;
  SurgeryStatus? surgeryStatus;
  Patient? patient;
  Item? item;
  List<Null>? surgeryNotes;

  Items(
      {this.id,
        this.surgeryTypeId,
        this.patientId,
        this.surgeryItemId,
        this.surgeryStatusId,
        this.userId,
        this.patient,
        this.surgeryType,
        this.surgeryStatus,
        this.item,
      });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    surgeryTypeId = json['SurgeryTypeId'];
    patientId = json['PatientId'];
    surgeryItemId = json['SurgeryItemId'];
    surgeryStatusId = json['SurgeryStatusId'];
    userId = json['UserId'];
    active = json['Active'];
    branchId = json['BranchId'];
    tenantId = json['TenantId'];
    roomId = json['RoomId'];
    surgeryScheduleDate = json['SurgeryScheduleDate'];
    instrumentReceived = json['InstrumentReceived'];
    instrumentRefund = json['InstrumentRefund'];
    archived = json['Archived'];
    disease = json['Disease'];
    aNS = json['ANS'];
    aSA = json['ASA'];
    ward = json['Ward'];
    isApproved = json['IsApproved'];
    approvedUserId = json['ApprovedUserId'];
    surgeryType = json['SurgeryType'] != null
        ? new SurgeryType.fromJson(json['SurgeryType'])
        : null;
    surgeryStatus = json['SurgeryStatus'] != null
        ? new SurgeryStatus.fromJson(json['SurgeryStatus'])
        : null;
    item = json['Item'] != null ? new Item.fromJson(json['Item']) : null;

    patient =
    json['Patient'] != null ? new Patient.fromJson(json['Patient']) : null;
    if (json['SurgeryNotes'] != null) {
      surgeryNotes = <Null>[];
      json['SurgeryNotes'].forEach((v) {
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['SurgeryTypeId'] = this.surgeryTypeId;
    data['PatientId'] = this.patientId;
    data['SurgeryItemId'] = this.surgeryItemId;
    data['SurgeryStatusId'] = this.surgeryStatusId;
    data['UserId'] = this.userId;
    data['Active'] = this.active;
    data['BranchId'] = this.branchId;
    data['TenantId'] = this.tenantId;
    data['RoomId'] = this.roomId;
    data['SurgeryScheduleDate'] = this.surgeryScheduleDate;
    data['InstrumentReceived'] = this.instrumentReceived;
    data['InstrumentRefund'] = this.instrumentRefund;
    data['Archived'] = this.archived;
    data['Disease'] = this.disease;
    data['ANS'] = this.aNS;
    data['ASA'] = this.aSA;
    data['Ward'] = this.ward;
    data['IsApproved'] = this.isApproved;
    data['ApprovedUserId'] = this.approvedUserId;
    if (this.surgeryType != null) {
      data['SurgeryType'] = this.surgeryType!.toJson();
    }
    if (this.surgeryStatus != null) {
      data['SurgeryStatus'] = this.surgeryStatus!.toJson();
    }
    if (this.item != null) {
      data['Item'] = this.item!.toJson();
    }
    if (this.patient != null) {
      data['Patient'] = this.patient!.toJson();
    }
    if (this.surgeryNotes != null) {

    }
    return data;
  }
}



class SurgeryType {
  dynamic? id;
  dynamic? name;
  SurgeryType(
      {this.id,
        this.name,});

  SurgeryType.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    return data;
  }
}

class SurgeryStatus {
  dynamic? id;
  dynamic? name;
  dynamic? userId;
  SurgeryStatus(
      {this.id, this.name, this.userId});

  SurgeryStatus.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['UserId'] = this.userId;
    return data;
  }
}

class Patient {
  dynamic? id;
  dynamic? oldId;
  dynamic? firstName;

  Patient(
      {this.id,
        this.oldId,
        this.firstName,
       });
  Patient.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    oldId = json['OldId'];
    firstName = json['FirstName'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['OldId'] = this.oldId;
    data['FirstName'] = this.firstName;
    return data;
  }
}
class Item {
  dynamic? name;
  Item(
      {this.name,
        });
  Item.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    return data;
  }
}


