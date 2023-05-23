class SaveOperationScheduleModel {
  dynamic? id;
  dynamic? surgeryTypeId;
  dynamic? patientId;
  dynamic? surgeryItemId;
  dynamic? surgeryStatusId;
  dynamic? userId;
  bool? active;
  dynamic? branchId;
  dynamic? tenantId;
  dynamic? roomId;
  dynamic? surgeryScheduleDate;
  dynamic? startTime;
  dynamic? endTime;
  bool? isApproved;
  dynamic? approvedUserId;
  SurgeryType? surgeryType;
  SurgeryStatus? surgeryStatus;
  List<SurgeryNotes>? surgeryNotes;

  SaveOperationScheduleModel(
      {this.id,
        this.surgeryTypeId,
        this.patientId,
        this.surgeryItemId,
        this.surgeryStatusId,
        this.userId,
        this.active,
        this.branchId,
        this.tenantId,
        this.roomId,
        this.surgeryScheduleDate,
        this.startTime,
        this.endTime,
        this.isApproved,
        this.approvedUserId,
        this.surgeryType,
        this.surgeryStatus,
        this.surgeryNotes});

  SaveOperationScheduleModel.fromJson(Map<String, dynamic> json) {
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
    startTime = json['StartTime'];
    endTime = json['EndTime'];
    isApproved = json['IsApproved'];
    approvedUserId = json['ApprovedUserId'];
    surgeryType = json['SurgeryType'] != null
        ? new SurgeryType.fromJson(json['SurgeryType'])
        : null;
    surgeryStatus = json['SurgeryStatus'] != null
        ? new SurgeryStatus.fromJson(json['SurgeryStatus'])
        : null;
    if (json['SurgeryNotes'] != null) {
      surgeryNotes = <SurgeryNotes>[];
      json['SurgeryNotes'].forEach((v) {
        surgeryNotes!.add(new SurgeryNotes.fromJson(v));
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
    data['StartTime'] = this.startTime;
    data['EndTime'] = this.endTime;
    data['IsApproved'] = this.isApproved;
    data['ApprovedUserId'] = this.approvedUserId;
    if (this.surgeryType != null) {
      data['SurgeryType'] = this.surgeryType!.toJson();
    }
    if (this.surgeryStatus != null) {
      data['SurgeryStatus'] = this.surgeryStatus!.toJson();
    }
    if (this.surgeryNotes != null) {
      data['SurgeryNotes'] = this.surgeryNotes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SurgeryType {
  dynamic? id;
  dynamic? name;
  dynamic? userId;
  bool? active;
  dynamic? tenantId;

  SurgeryType(
      {this.id,
        this.name,
        this.userId,
        this.active,
        this.tenantId});

  SurgeryType.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    userId = json['UserId'];
    active = json['Active'];
    tenantId = json['TenantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['UserId'] = this.userId;
    data['Active'] = this.active;
    data['TenantId'] = this.tenantId;
    return data;
  }
}

class SurgeryStatus {
  dynamic? id;
  dynamic? name;
  dynamic? userId;
  bool? active;


  SurgeryStatus(
      {this.id, this.name, this.userId, this.active});

  SurgeryStatus.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    userId = json['UserId'];
    active = json['Active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['UserId'] = this.userId;
    data['Active'] = this.active;
    return data;
  }
}

class SurgeryNotes {
  dynamic? userId;
  bool? active;
  dynamic? id;
  dynamic? note;
  dynamic? surgeryId;

  SurgeryNotes({this.userId, this.active, this.id, this.note, this.surgeryId});

  SurgeryNotes.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    active = json['Active'];
    id = json['Id'];
    note = json['Note'];
    surgeryId = json['SurgeryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['Active'] = this.active;
    data['Id'] = this.id;
    data['Note'] = this.note;
    data['SurgeryId'] = this.surgeryId;
    return data;
  }
}