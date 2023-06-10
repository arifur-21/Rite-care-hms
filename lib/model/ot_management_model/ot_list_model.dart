class OtScheduleModel {
  List<Items>? items;
  int? totalItems;

  OtScheduleModel({this.items, this.totalItems});

  OtScheduleModel.fromJson(Map<String, dynamic> json) {
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
  bool? instrumentReceived;
  bool? instrumentRefund;
  bool? archived;
  dynamic? disease;
  dynamic? aNS;
  dynamic? aSA;
  dynamic? ward;
  bool? isApproved;
  dynamic? approvedUserId;
  List<SurgeryServiceProviderMaps>? surgeryServiceProviderMaps;
  SurgeryType? surgeryType;
  SurgeryStatus? surgeryStatus;
  OperationRoom? operationRoom;
  Patient? patient;
  Item? item;
  List<SurgeryNotes>? surgeryNotes;

  Items(
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
        this.instrumentReceived,
        this.instrumentRefund,
        this.archived,
        this.disease,
        this.aNS,
        this.aSA,
        this.ward,
        this.isApproved,
        this.approvedUserId,
        this.surgeryServiceProviderMaps,
        this.surgeryType,
        this.surgeryStatus,
        this.operationRoom,
        this.patient,
        this.item,
        this.surgeryNotes});

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
    startTime = json['StartTime'];
    endTime = json['EndTime'];
    instrumentReceived = json['InstrumentReceived'];
    instrumentRefund = json['InstrumentRefund'];
    archived = json['Archived'];
    disease = json['Disease'];
    aNS = json['ANS'];
    aSA = json['ASA'];
    ward = json['Ward'];
    isApproved = json['IsApproved'];
    approvedUserId = json['ApprovedUserId'];
    if (json['SurgeryServiceProviderMaps'] != null) {
      surgeryServiceProviderMaps = <SurgeryServiceProviderMaps>[];
      json['SurgeryServiceProviderMaps'].forEach((v) {
        surgeryServiceProviderMaps!
            .add(new SurgeryServiceProviderMaps.fromJson(v));
      });
    }
    surgeryType = json['SurgeryType'] != null
        ? new SurgeryType.fromJson(json['SurgeryType'])
        : null;
    surgeryStatus = json['SurgeryStatus'] != null
        ? new SurgeryStatus.fromJson(json['SurgeryStatus'])
        : null;
    operationRoom = json['OperationRoom'] != null
        ? new OperationRoom.fromJson(json['OperationRoom'])
        : null;
    patient =
    json['Patient'] != null ? new Patient.fromJson(json['Patient']) : null;
    item = json['Item'] != null ? new Item.fromJson(json['Item']) : null;
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
    data['InstrumentReceived'] = this.instrumentReceived;
    data['InstrumentRefund'] = this.instrumentRefund;
    data['Archived'] = this.archived;
    data['Disease'] = this.disease;
    data['ANS'] = this.aNS;
    data['ASA'] = this.aSA;
    data['Ward'] = this.ward;
    data['IsApproved'] = this.isApproved;
    data['ApprovedUserId'] = this.approvedUserId;
    if (this.surgeryServiceProviderMaps != null) {
      data['SurgeryServiceProviderMaps'] =
          this.surgeryServiceProviderMaps!.map((v) => v.toJson()).toList();
    }
    if (this.surgeryType != null) {
      data['SurgeryType'] = this.surgeryType!.toJson();
    }
    if (this.surgeryStatus != null) {
      data['SurgeryStatus'] = this.surgeryStatus!.toJson();
    }
    if (this.operationRoom != null) {
      data['OperationRoom'] = this.operationRoom!.toJson();
    }
    if (this.patient != null) {
      data['Patient'] = this.patient!.toJson();
    }
    if (this.item != null) {
      data['Item'] = this.item!.toJson();
    }
    if (this.surgeryNotes != null) {
      data['SurgeryNotes'] = this.surgeryNotes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SurgeryServiceProviderMaps {
  dynamic? id;
  dynamic? surgeryId;
  dynamic? serviceProviderId;
  dynamic? userId;
  bool? active;
  ServiceProvider? serviceProvider;

  SurgeryServiceProviderMaps(
      {this.id,
        this.surgeryId,
        this.serviceProviderId,
        this.userId,
        this.active,
        this.serviceProvider});

  SurgeryServiceProviderMaps.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    surgeryId = json['SurgeryId'];
    serviceProviderId = json['ServiceProviderId'];
    userId = json['UserId'];
    active = json['Active'];
    serviceProvider = json['ServiceProvider'] != null
        ? new ServiceProvider.fromJson(json['ServiceProvider'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['SurgeryId'] = this.surgeryId;
    data['ServiceProviderId'] = this.serviceProviderId;
    data['UserId'] = this.userId;
    data['Active'] = this.active;
    if (this.serviceProvider != null) {
      data['ServiceProvider'] = this.serviceProvider!.toJson();
    }
    return data;
  }
}

class ServiceProvider {
  dynamic? contactId;
  dynamic? title;
  dynamic? serviceProviderTypeId;
  dynamic? departmentId;
  dynamic? speciality;
  dynamic? description;
  dynamic? code;
  bool? assignedToAllUsers;
  bool? isInHouse;
  bool? isReferer;
  dynamic? designation;
  bool? hasSigningPermission;
  Contact? contact;
  ServiceProviderType? serviceProviderType;
  Department? department;

  ServiceProvider(
      {this.contactId,
        this.title,
        this.serviceProviderTypeId,
        this.departmentId,
        this.speciality,
        this.description,
        this.code,
        this.assignedToAllUsers,
        this.isInHouse,
        this.isReferer,
        this.designation,
        this.hasSigningPermission,
        this.contact,
        this.serviceProviderType,
        this.department});

  ServiceProvider.fromJson(Map<String, dynamic> json) {
    contactId = json['ContactId'];
    title = json['Title'];
    serviceProviderTypeId = json['ServiceProviderTypeId'];
    departmentId = json['DepartmentId'];
    speciality = json['Speciality'];
    description = json['Description'];
    code = json['Code'];
    assignedToAllUsers = json['AssignedToAllUsers'];
    isInHouse = json['IsInHouse'];
    isReferer = json['IsReferer'];
    designation = json['Designation'];
    hasSigningPermission = json['HasSigningPermission'];
    contact =
    json['Contact'] != null ? new Contact.fromJson(json['Contact']) : null;
    serviceProviderType = json['ServiceProviderType'] != null
        ? new ServiceProviderType.fromJson(json['ServiceProviderType'])
        : null;
    department = json['Department'] != null
        ? new Department.fromJson(json['Department'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ContactId'] = this.contactId;
    data['Title'] = this.title;
    data['ServiceProviderTypeId'] = this.serviceProviderTypeId;
    data['DepartmentId'] = this.departmentId;
    data['Speciality'] = this.speciality;
    data['Description'] = this.description;
    data['Code'] = this.code;
    data['AssignedToAllUsers'] = this.assignedToAllUsers;
    data['IsInHouse'] = this.isInHouse;
    data['IsReferer'] = this.isReferer;
    data['Designation'] = this.designation;
    data['HasSigningPermission'] = this.hasSigningPermission;
    if (this.contact != null) {
      data['Contact'] = this.contact!.toJson();
    }
    if (this.serviceProviderType != null) {
      data['ServiceProviderType'] = this.serviceProviderType!.toJson();
    }
    if (this.department != null) {
      data['Department'] = this.department!.toJson();
    }
    return data;
  }
}

class Contact {
  dynamic? id;
  bool? active;
  dynamic? userId;
  dynamic? tenantId;
  dynamic? firstName;
  dynamic? lastName;
  dynamic? phoneNumber;
  dynamic? genderId;
  dynamic? street;
  dynamic? city;
  dynamic? zip;
  dynamic? country;
  dynamic? email;
  dynamic? fax;
  dynamic? webSite;
  dynamic? photo;
  dynamic? isCompany;

  Contact(
      {this.id,
        this.active,
        this.userId,
        this.tenantId,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.genderId,
        this.street,
        this.city,
        this.zip,
        this.country,
        this.email,
        this.fax,
        this.webSite,
        this.photo,
        this.isCompany});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    active = json['Active'];
    userId = json['UserId'];
    tenantId = json['TenantId'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    phoneNumber = json['PhoneNumber'];
    genderId = json['GenderId'];
    street = json['Street'];
    city = json['City'];
    zip = json['Zip'];
    country = json['Country'];
    email = json['Email'];
    fax = json['Fax'];
    webSite = json['WebSite'];
    photo = json['Photo'];
    isCompany = json['IsCompany'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Active'] = this.active;
    data['UserId'] = this.userId;
    data['TenantId'] = this.tenantId;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['PhoneNumber'] = this.phoneNumber;
    data['GenderId'] = this.genderId;
    data['Street'] = this.street;
    data['City'] = this.city;
    data['Zip'] = this.zip;
    data['Country'] = this.country;
    data['Email'] = this.email;
    data['Fax'] = this.fax;
    data['WebSite'] = this.webSite;
    data['Photo'] = this.photo;
    data['IsCompany'] = this.isCompany;
    return data;
  }
}

class ServiceProviderType {
  dynamic? languageCode;
  dynamic? name;

  ServiceProviderType({this.languageCode, this.name});

  ServiceProviderType.fromJson(Map<String, dynamic> json) {
    languageCode = json['LanguageCode'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LanguageCode'] = this.languageCode;
    data['Name'] = this.name;
    return data;
  }
}

class Department {
  dynamic? id;
  bool? active;
  dynamic? userId;
  dynamic? name;
  dynamic? branchId;
  dynamic? tenantId;

  Department(
      {this.id,
        this.active,
        this.userId,
        this.name,
        this.branchId,
        this.tenantId});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    active = json['Active'];
    userId = json['UserId'];
    name = json['Name'];
    branchId = json['BranchId'];
    tenantId = json['TenantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Active'] = this.active;
    data['UserId'] = this.userId;
    data['Name'] = this.name;
    data['BranchId'] = this.branchId;
    data['TenantId'] = this.tenantId;
    return data;
  }
}

class SurgeryType {
  dynamic? id;
  dynamic? name;
  dynamic? description;
  dynamic? userId;
  bool? active;
  dynamic? tenantId;

  SurgeryType(
      {this.id,
        this.name,
        this.description,
        this.userId,
        this.active,
        this.tenantId});

  SurgeryType.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    description = json['Description'];
    userId = json['UserId'];
    active = json['Active'];
    tenantId = json['TenantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Description'] = this.description;
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
  dynamic? surgeryDetails;

  SurgeryStatus(
      {this.id, this.name, this.userId, this.active, this.surgeryDetails});

  SurgeryStatus.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    userId = json['UserId'];
    active = json['Active'];
    surgeryDetails = json['SurgeryDetails'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['UserId'] = this.userId;
    data['Active'] = this.active;
    data['SurgeryDetails'] = this.surgeryDetails;
    return data;
  }
}

class OperationRoom {
  dynamic? id;
  dynamic? roomNumber;
  dynamic? roomName;
  dynamic? surgeryTypeId;
  dynamic? inchargeId;
  dynamic? noOfBed;
  dynamic? userId;
  bool? active;
  dynamic? branchId;
  dynamic? branch;
  dynamic? tenantId;
  SurgeryType? surgeryType;
  User? user;
  List<PostOperativeRooms>? postOperativeRooms;

  OperationRoom(
      {this.id,
        this.roomNumber,
        this.roomName,
        this.surgeryTypeId,
        this.inchargeId,
        this.noOfBed,
        this.userId,
        this.active,
        this.branchId,
        this.branch,
        this.tenantId,
        this.surgeryType,
        this.user,
        this.postOperativeRooms});

  OperationRoom.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    roomNumber = json['RoomNumber'];
    roomName = json['RoomName'];
    surgeryTypeId = json['SurgeryTypeId'];
    inchargeId = json['InchargeId'];
    noOfBed = json['NoOfBed'];
    userId = json['UserId'];
    active = json['Active'];
    branchId = json['BranchId'];
    branch = json['Branch'];
    tenantId = json['TenantId'];
    surgeryType = json['SurgeryType'] != null
        ? new SurgeryType.fromJson(json['SurgeryType'])
        : null;
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
    if (json['PostOperativeRooms'] != null) {
      postOperativeRooms = <PostOperativeRooms>[];
      json['PostOperativeRooms'].forEach((v) {
        postOperativeRooms!.add(new PostOperativeRooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['RoomNumber'] = this.roomNumber;
    data['RoomName'] = this.roomName;
    data['SurgeryTypeId'] = this.surgeryTypeId;
    data['InchargeId'] = this.inchargeId;
    data['NoOfBed'] = this.noOfBed;
    data['UserId'] = this.userId;
    data['Active'] = this.active;
    data['BranchId'] = this.branchId;
    data['Branch'] = this.branch;
    data['TenantId'] = this.tenantId;
    if (this.surgeryType != null) {
      data['SurgeryType'] = this.surgeryType!.toJson();
    }
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    if (this.postOperativeRooms != null) {
      data['PostOperativeRooms'] =
          this.postOperativeRooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  dynamic? id;
  dynamic? contactId;
  dynamic? userName;
  Contact? contact;

  User({this.id, this.contactId, this.userName, this.contact});

  User.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    contactId = json['ContactId'];
    userName = json['UserName'];
    contact =
    json['Contact'] != null ? new Contact.fromJson(json['Contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ContactId'] = this.contactId;
    data['UserName'] = this.userName;
    if (this.contact != null) {
      data['Contact'] = this.contact!.toJson();
    }
    return data;
  }
}


class PostOperativeRooms {
  dynamic? id;
  dynamic? operationRoomId;
  dynamic? bedNo;
  bool? occupency;
  dynamic? userId;
  bool? active;
  dynamic? patientId;
  dynamic? operationRoom;
  List<dynamic>? postOperativePatientHistories;

  PostOperativeRooms(
      {this.id,
        this.operationRoomId,
        this.bedNo,
        this.occupency,
        this.userId,
        this.active,
        this.patientId,
        this.operationRoom,
        this.postOperativePatientHistories});

  PostOperativeRooms.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    operationRoomId = json['OperationRoomId'];
    bedNo = json['BedNo'];
    occupency = json['Occupency'];
    userId = json['UserId'];
    active = json['Active'];
    patientId = json['PatientId'];
    operationRoom = json['OperationRoom'];
    if (json['PostOperativePatientHistories'] != null) {
      postOperativePatientHistories = <Null>[];
      json['PostOperativePatientHistories'].forEach((v) {
        ///postOperativePatientHistories!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['OperationRoomId'] = this.operationRoomId;
    data['BedNo'] = this.bedNo;
    data['Occupency'] = this.occupency;
    data['UserId'] = this.userId;
    data['Active'] = this.active;
    data['PatientId'] = this.patientId;
    data['OperationRoom'] = this.operationRoom;
    if (this.postOperativePatientHistories != null) {
     // data['PostOperativePatientHistories'] = this.postOperativePatientHistories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Patient {
  dynamic? id;
  dynamic? oldId;
  dynamic? firstName;
  dynamic? lastName;
  dynamic? phoneNumber;
  dynamic? genderId;
  dynamic? bloodGroup;
  dynamic? bloodGroupId;
  dynamic? fatherName;
  dynamic? dOB;
  dynamic? nationalId;
  dynamic? occupation;
  dynamic? street;
  dynamic? zip;
  dynamic? city;
  dynamic? country;
  dynamic? email;
  dynamic? photo;
  dynamic? emergencyNumber;
  dynamic? emergencyContactName;
  dynamic? emergencyContactRelation;
  dynamic? createdDate;
  dynamic? serviceId;
  dynamic? relationshipId;
  dynamic? rankId;
  dynamic? tradeId;
  dynamic? serviceTypeId;
  dynamic? rankTypeId;
  dynamic? unitName;
  dynamic? rankName;
  dynamic? tradeName;
  dynamic? unitId;
  bool? isRetired;
  dynamic? patientPrefixId;
  dynamic? patientStatusId;
  dynamic? sex;
  dynamic? oldDob;
  Relationship? relationship;
  Relationship? rank;
  Relationship? unit;
  dynamic? trade;
  ParentPatient? parentPatient;

  Patient(
      {this.id,
        this.oldId,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.genderId,
        this.bloodGroup,
        this.bloodGroupId,
        this.fatherName,
        this.dOB,
        this.nationalId,
        this.occupation,
        this.street,
        this.city,
        this.zip,
        this.country,
        this.email,
        this.photo,
        this.emergencyNumber,
        this.emergencyContactName,
        this.emergencyContactRelation,
        this.createdDate,
        this.serviceId,
        this.relationshipId,
        this.rankId,
        this.tradeId,
        this.serviceTypeId,
        this.rankTypeId,
        this.unitName,
        this.rankName,
        this.tradeName,
        this.unitId,
        this.isRetired,
        this.patientPrefixId,
        this.patientStatusId,
        this.sex,
        this.oldDob,
        this.relationship,
        this.rank,
        this.unit,
        this.trade,
        this.parentPatient});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    oldId = json['OldId'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    phoneNumber = json['PhoneNumber'];
    genderId = json['GenderId'];
    bloodGroup = json['BloodGroup'];
    bloodGroupId = json['BloodGroupId'];
    fatherName = json['FatherName'];
    dOB = json['DOB'];
    nationalId = json['NationalId'];
    occupation = json['Occupation'];
    street = json['Street'];
    city = json['City'];
    zip = json['Zip'];
    country = json['Country'];
    email = json['Email'];
    photo = json['Photo'];
    emergencyNumber = json['EmergencyNumber'];
    emergencyContactName = json['EmergencyContactName'];
    emergencyContactRelation = json['EmergencyContactRelation'];
    createdDate = json['CreatedDate'];
    serviceId = json['ServiceId'];
    relationshipId = json['RelationshipId'];
    rankId = json['RankId'];
    tradeId = json['TradeId'];
    serviceTypeId = json['ServiceTypeId'];
    rankTypeId = json['RankTypeId'];
    unitName = json['UnitName'];
    rankName = json['RankName'];
    tradeName = json['TradeName'];
    unitId = json['UnitId'];
    isRetired = json['IsRetired'];
    patientPrefixId = json['PatientPrefixId'];
    patientStatusId = json['PatientStatusId'];
    sex = json['Sex'];
    oldDob = json['OldDob'];
    relationship = json['Relationship'] != null
        ? new Relationship.fromJson(json['Relationship'])
        : null;
    rank =
    json['Rank'] != null ? new Relationship.fromJson(json['Rank']) : null;
    unit =
    json['Unit'] != null ? new Relationship.fromJson(json['Unit']) : null;
    trade = json['Trade'];
    parentPatient = json['ParentPatient'] != null
        ? new ParentPatient.fromJson(json['ParentPatient'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['OldId'] = this.oldId;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['PhoneNumber'] = this.phoneNumber;
    data['GenderId'] = this.genderId;
    data['BloodGroup'] = this.bloodGroup;
    data['BloodGroupId'] = this.bloodGroupId;
    data['FatherName'] = this.fatherName;
    data['DOB'] = this.dOB;
    data['NationalId'] = this.nationalId;
    data['Occupation'] = this.occupation;
    data['Street'] = this.street;
    data['City'] = this.city;
    data['Zip'] = this.zip;
    data['Country'] = this.country;
    data['Email'] = this.email;
    data['Photo'] = this.photo;
    data['EmergencyNumber'] = this.emergencyNumber;
    data['EmergencyContactName'] = this.emergencyContactName;
    data['EmergencyContactRelation'] = this.emergencyContactRelation;
    data['CreatedDate'] = this.createdDate;
    data['ServiceId'] = this.serviceId;
    data['RelationshipId'] = this.relationshipId;
    data['RankId'] = this.rankId;
    data['TradeId'] = this.tradeId;
    data['ServiceTypeId'] = this.serviceTypeId;
    data['RankTypeId'] = this.rankTypeId;
    data['UnitName'] = this.unitName;
    data['RankName'] = this.rankName;
    data['TradeName'] = this.tradeName;
    data['UnitId'] = this.unitId;
    data['IsRetired'] = this.isRetired;
    data['PatientPrefixId'] = this.patientPrefixId;
    data['PatientStatusId'] = this.patientStatusId;
    data['Sex'] = this.sex;
    data['OldDob'] = this.oldDob;
    if (this.relationship != null) {
      data['Relationship'] = this.relationship!.toJson();
    }
    if (this.rank != null) {
      data['Rank'] = this.rank!.toJson();
    }
    if (this.unit != null) {
      data['Unit'] = this.unit!.toJson();
    }
    data['Trade'] = this.trade;
    if (this.parentPatient != null) {
      data['ParentPatient'] = this.parentPatient!.toJson();
    }
    return data;
  }
}

class Relationship {
  dynamic? name;
  dynamic? languageCode;
  dynamic? id;
  bool? active;
  dynamic? userId;
  bool? hasErrors;
  dynamic? errorCount;
  bool? noErrors;

  Relationship(
      {this.name,
        this.languageCode,
        this.id,
        this.active,
        this.userId,
        this.hasErrors,
        this.errorCount,
        this.noErrors});

  Relationship.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    languageCode = json['LanguageCode'];
    id = json['Id'];
    active = json['Active'];
    userId = json['UserId'];
    hasErrors = json['HasErrors'];
    errorCount = json['ErrorCount'];
    noErrors = json['NoErrors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['LanguageCode'] = this.languageCode;
    data['Id'] = this.id;
    data['Active'] = this.active;
    data['UserId'] = this.userId;
    data['HasErrors'] = this.hasErrors;
    data['ErrorCount'] = this.errorCount;
    data['NoErrors'] = this.noErrors;
    return data;
  }
}

class ParentPatient {
  dynamic? oldId;
  dynamic? firstName;
  dynamic? lastName;
  dynamic? phoneNumber;
  dynamic? genderId;
  dynamic? bloodGroup;
  dynamic? bloodGroupId;
  dynamic? fatherName;
  dynamic? dOB;
  dynamic? nationalId;
  dynamic? occupation;
  dynamic? street;
  dynamic? city;
  dynamic? zip;
  dynamic? country;
  dynamic? email;
  dynamic? photo;
  dynamic? emergencyNumber;
  dynamic? emergencyContactName;
  dynamic? emergencyContactRelation;
  dynamic? createdDate;
  dynamic? serviceId;
  dynamic? relationshipId;
  dynamic? rankId;
  dynamic? tradeId;
  dynamic? serviceTypeId;
  dynamic? rankTypeId;
  dynamic? unitName;
  dynamic? rankName;
  dynamic? tradeName;
  dynamic? unitId;
  bool? isRetired;
  dynamic? patientPrefixId;
  dynamic? patientStatusId;
  dynamic? sex;
  dynamic? oldDob;
  Gender? gender;
  PatientPrefix? patientPrefix;
  dynamic? patientStatus;
  List<dynamic>? memberships;
  List<dynamic>? patientInvoices;
  List<dynamic>? patientServices;
  List<dynamic>? payments;
  List<dynamic>? doctorAppointments;
  Relationship? relationship;
  Relationship? rank;
  Relationship? unit;
  dynamic? trade;
  dynamic? parentPatient;
  dynamic? visitNo;
  dynamic? patientInvoiceShadowId;
  dynamic? tenantId;
  Null? tenant;
  dynamic? id;
  bool? active;
  dynamic? userId;
  bool? hasErrors;
  dynamic? errorCount;
  bool? noErrors;

  ParentPatient(
      {this.oldId,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.genderId,
        this.bloodGroup,
        this.bloodGroupId,
        this.fatherName,
        this.dOB,
        this.nationalId,
        this.occupation,
        this.street,
        this.city,
        this.zip,
        this.country,
        this.email,
        this.photo,
        this.emergencyNumber,
        this.emergencyContactName,
        this.emergencyContactRelation,
        this.createdDate,
        this.serviceId,
        this.relationshipId,
        this.rankId,
        this.tradeId,
        this.serviceTypeId,
        this.rankTypeId,
        this.unitName,
        this.rankName,
        this.tradeName,
        this.unitId,
        this.isRetired,
        this.patientPrefixId,
        this.patientStatusId,
        this.sex,
        this.oldDob,
        this.gender,
        this.patientPrefix,
        this.patientStatus,
        this.memberships,
        this.patientInvoices,
        this.patientServices,
        this.payments,
        this.doctorAppointments,
        this.relationship,
        this.rank,
        this.unit,
        this.trade,
        this.parentPatient,
        this.visitNo,
        this.patientInvoiceShadowId,
        this.tenantId,
        this.tenant,
        this.id,
        this.active,
        this.userId,
        this.hasErrors,
        this.errorCount,
        this.noErrors});

  ParentPatient.fromJson(Map<String, dynamic> json) {
    oldId = json['OldId'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    phoneNumber = json['PhoneNumber'];
    genderId = json['GenderId'];
    bloodGroup = json['BloodGroup'];
    bloodGroupId = json['BloodGroupId'];
    fatherName = json['FatherName'];
    dOB = json['DOB'];
    nationalId = json['NationalId'];
    occupation = json['Occupation'];
    street = json['Street'];
    city = json['City'];
    zip = json['Zip'];
    country = json['Country'];
    email = json['Email'];
    photo = json['Photo'];
    emergencyNumber = json['EmergencyNumber'];
    emergencyContactName = json['EmergencyContactName'];
    emergencyContactRelation = json['EmergencyContactRelation'];
    createdDate = json['CreatedDate'];
    serviceId = json['ServiceId'];
    relationshipId = json['RelationshipId'];
    rankId = json['RankId'];
    tradeId = json['TradeId'];
    serviceTypeId = json['ServiceTypeId'];
    rankTypeId = json['RankTypeId'];
    unitName = json['UnitName'];
    rankName = json['RankName'];
    tradeName = json['TradeName'];
    unitId = json['UnitId'];
    isRetired = json['IsRetired'];
    patientPrefixId = json['PatientPrefixId'];
    patientStatusId = json['PatientStatusId'];
    sex = json['Sex'];
    oldDob = json['OldDob'];
    gender =
    json['Gender'] != null ? new Gender.fromJson(json['Gender']) : null;
    patientPrefix = json['PatientPrefix'] != null
        ? new PatientPrefix.fromJson(json['PatientPrefix'])
        : null;
    patientStatus = json['PatientStatus'];
    if (json['Memberships'] != null) {
      memberships = <Null>[];
      json['Memberships'].forEach((v) {
       // memberships!.add(new Null.fromJson(v));
      });
    }
    if (json['PatientInvoices'] != null) {
      patientInvoices = <Null>[];
      json['PatientInvoices'].forEach((v) {
        //patientInvoices!.add(new Null.fromJson(v));
      });
    }
    if (json['PatientServices'] != null) {
      patientServices = <Null>[];
      json['PatientServices'].forEach((v) {
      //  patientServices!.add(new Null.fromJson(v));
      });
    }
    if (json['Payments'] != null) {
      payments = <Null>[];
      json['Payments'].forEach((v) {
      //  payments!.add(new Null.fromJson(v));
      });
    }
    if (json['DoctorAppointments'] != null) {
      doctorAppointments = <Null>[];
      json['DoctorAppointments'].forEach((v) {
      //  doctorAppointments!.add(new Null.fromJson(v));
      });
    }
    relationship = json['Relationship'] != null
        ? new Relationship.fromJson(json['Relationship'])
        : null;
    rank =
    json['Rank'] != null ? new Relationship.fromJson(json['Rank']) : null;
    unit =
    json['Unit'] != null ? new Relationship.fromJson(json['Unit']) : null;
    trade = json['Trade'];
    parentPatient = json['ParentPatient'];
    visitNo = json['VisitNo'];
    patientInvoiceShadowId = json['PatientInvoiceShadowId'];
    tenantId = json['TenantId'];
    tenant = json['Tenant'];
    id = json['Id'];
    active = json['Active'];
    userId = json['UserId'];
    hasErrors = json['HasErrors'];
    errorCount = json['ErrorCount'];
    noErrors = json['NoErrors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OldId'] = this.oldId;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['PhoneNumber'] = this.phoneNumber;
    data['GenderId'] = this.genderId;
    data['BloodGroup'] = this.bloodGroup;
    data['BloodGroupId'] = this.bloodGroupId;
    data['FatherName'] = this.fatherName;
    data['DOB'] = this.dOB;
    data['NationalId'] = this.nationalId;
    data['Occupation'] = this.occupation;
    data['Street'] = this.street;
    data['City'] = this.city;
    data['Zip'] = this.zip;
    data['Country'] = this.country;
    data['Email'] = this.email;
    data['Photo'] = this.photo;
    data['EmergencyNumber'] = this.emergencyNumber;
    data['EmergencyContactName'] = this.emergencyContactName;
    data['EmergencyContactRelation'] = this.emergencyContactRelation;
    data['CreatedDate'] = this.createdDate;
    data['ServiceId'] = this.serviceId;
    data['RelationshipId'] = this.relationshipId;
    data['RankId'] = this.rankId;
    data['TradeId'] = this.tradeId;
    data['ServiceTypeId'] = this.serviceTypeId;
    data['RankTypeId'] = this.rankTypeId;
    data['UnitName'] = this.unitName;
    data['RankName'] = this.rankName;
    data['TradeName'] = this.tradeName;
    data['UnitId'] = this.unitId;
    data['IsRetired'] = this.isRetired;
    data['PatientPrefixId'] = this.patientPrefixId;
    data['PatientStatusId'] = this.patientStatusId;
    data['Sex'] = this.sex;
    data['OldDob'] = this.oldDob;
    if (this.gender != null) {
      data['Gender'] = this.gender!.toJson();
    }
    if (this.patientPrefix != null) {
      data['PatientPrefix'] = this.patientPrefix!.toJson();
    }
    data['PatientStatus'] = this.patientStatus;
    if (this.memberships != null) {
    //  data['Memberships'] = this.memberships!.map((v) => v.toJson()).toList();
    }
    if (this.patientInvoices != null) {
     // data['PatientInvoices'] = this.patientInvoices!.map((v) => v.toJson()).toList();
    }
    if (this.patientServices != null) {
    ///  data['PatientServices'] = this.patientServices!.map((v) => v.toJson()).toList();
    }
    if (this.payments != null) {
     // data['Payments'] = this.payments!.map((v) => v.toJson()).toList();
    }
    if (this.doctorAppointments != null) {
     /// data['DoctorAppointments'] = this.doctorAppointments!.map((v) => v.toJson()).toList();
    }
    if (this.relationship != null) {
      data['Relationship'] = this.relationship!.toJson();
    }
    if (this.rank != null) {
      data['Rank'] = this.rank!.toJson();
    }
    if (this.unit != null) {
      data['Unit'] = this.unit!.toJson();
    }
    data['Trade'] = this.trade;
    data['ParentPatient'] = this.parentPatient;
    data['VisitNo'] = this.visitNo;
    data['PatientInvoiceShadowId'] = this.patientInvoiceShadowId;
    data['TenantId'] = this.tenantId;
    data['Tenant'] = this.tenant;
    data['Id'] = this.id;
    data['Active'] = this.active;
    data['UserId'] = this.userId;
    data['HasErrors'] = this.hasErrors;
    data['ErrorCount'] = this.errorCount;
    data['NoErrors'] = this.noErrors;
    return data;
  }
}

class Gender {
  dynamic? name;
  dynamic? code;
  dynamic? typeName;
  dynamic? user;
  List<dynamic>? bloodDonors;
  dynamic? id;
  bool? active;
  dynamic? userId;
  bool? hasErrors;
  dynamic? errorCount;
  bool? noErrors;

  Gender(
      {this.name,
        this.code,
        this.typeName,
        this.user,
        this.bloodDonors,
        this.id,
        this.active,
        this.userId,
        this.hasErrors,
        this.errorCount,
        this.noErrors});

  Gender.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    code = json['Code'];
    typeName = json['TypeName'];
    user = json['User'];
    if (json['BloodDonors'] != null) {
      bloodDonors = <Null>[];
      json['BloodDonors'].forEach((v) {
      //  bloodDonors!.add(new Null.fromJson(v));
      });
    }
    id = json['Id'];
    active = json['Active'];
    userId = json['UserId'];
    hasErrors = json['HasErrors'];
    errorCount = json['ErrorCount'];
    noErrors = json['NoErrors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Code'] = this.code;
    data['TypeName'] = this.typeName;
    data['User'] = this.user;
    if (this.bloodDonors != null) {
   //   data['BloodDonors'] = this.bloodDonors!.map((v) => v.toJson()).toList();
    }
    data['Id'] = this.id;
    data['Active'] = this.active;
    data['UserId'] = this.userId;
    data['HasErrors'] = this.hasErrors;
    data['ErrorCount'] = this.errorCount;
    data['NoErrors'] = this.noErrors;
    return data;
  }
}

class PatientPrefix {
  dynamic? name;
  dynamic? prefix;
  dynamic? languageCode;
  dynamic? id;
  bool? active;
  dynamic? userId;
  bool? hasErrors;
  dynamic? errorCount;
  bool? noErrors;

  PatientPrefix(
      {this.name,
        this.prefix,
        this.languageCode,
        this.id,
        this.active,
        this.userId,
        this.hasErrors,
        this.errorCount,
        this.noErrors});

  PatientPrefix.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    prefix = json['Prefix'];
    languageCode = json['LanguageCode'];
    id = json['Id'];
    active = json['Active'];
    userId = json['UserId'];
    hasErrors = json['HasErrors'];
    errorCount = json['ErrorCount'];
    noErrors = json['NoErrors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Prefix'] = this.prefix;
    data['LanguageCode'] = this.languageCode;
    data['Id'] = this.id;
    data['Active'] = this.active;
    data['UserId'] = this.userId;
    data['HasErrors'] = this.hasErrors;
    data['ErrorCount'] = this.errorCount;
    data['NoErrors'] = this.noErrors;
    return data;
  }
}

class Item {
  dynamic? name;
  dynamic? genericName;
  dynamic? code;
  dynamic? itemTypeId;
  dynamic? medicalTypeId;
  dynamic? itemCategoryId;
  dynamic? measurementUnitId;
  dynamic? salePrice;
  dynamic? buyPrice;
  dynamic? serviceProviderId;
  bool? referralAllowed;
  dynamic? description;
  dynamic? defaultReferrarFee;
  dynamic? labReportGroupId;
  dynamic? itemType;
  ItemCategory? itemCategory;
  dynamic? measurementUnit;
  dynamic? medicalType;
  dynamic? inventory;
  dynamic? id;
  bool? active;
  dynamic? userId;
  bool? hasErrors;
  dynamic? errorCount;
  bool? noErrors;

  Item(
      {this.name,
        this.genericName,
        this.code,
        this.itemTypeId,
        this.medicalTypeId,
        this.itemCategoryId,
        this.measurementUnitId,
        this.salePrice,
        this.buyPrice,
        this.serviceProviderId,
        this.referralAllowed,
        this.description,
        this.defaultReferrarFee,
        this.labReportGroupId,
        this.itemType,
        this.itemCategory,
        this.measurementUnit,
        this.medicalType,
        this.inventory,
        this.id,
        this.active,
        this.userId,
        this.hasErrors,
        this.errorCount,
        this.noErrors});

  Item.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    genericName = json['GenericName'];
    code = json['Code'];
    itemTypeId = json['ItemTypeId'];
    medicalTypeId = json['MedicalTypeId'];
    itemCategoryId = json['ItemCategoryId'];
    measurementUnitId = json['MeasurementUnitId'];
    salePrice = json['SalePrice'];
    buyPrice = json['BuyPrice'];
    serviceProviderId = json['ServiceProviderId'];
    referralAllowed = json['ReferralAllowed'];
    description = json['Description'];
    defaultReferrarFee = json['DefaultReferrarFee'];
    labReportGroupId = json['LabReportGroupId'];
    itemType = json['ItemType'];
    itemCategory = json['ItemCategory'] != null
        ? new ItemCategory.fromJson(json['ItemCategory'])
        : null;
    measurementUnit = json['MeasurementUnit'];
    medicalType = json['MedicalType'];
    inventory = json['Inventory'];
    id = json['Id'];
    active = json['Active'];
    userId = json['UserId'];
    hasErrors = json['HasErrors'];
    errorCount = json['ErrorCount'];
    noErrors = json['NoErrors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['GenericName'] = this.genericName;
    data['Code'] = this.code;
    data['ItemTypeId'] = this.itemTypeId;
    data['MedicalTypeId'] = this.medicalTypeId;
    data['ItemCategoryId'] = this.itemCategoryId;
    data['MeasurementUnitId'] = this.measurementUnitId;
    data['SalePrice'] = this.salePrice;
    data['BuyPrice'] = this.buyPrice;
    data['ServiceProviderId'] = this.serviceProviderId;
    data['ReferralAllowed'] = this.referralAllowed;
    data['Description'] = this.description;
    data['DefaultReferrarFee'] = this.defaultReferrarFee;
    data['LabReportGroupId'] = this.labReportGroupId;
    data['ItemType'] = this.itemType;
    if (this.itemCategory != null) {
      data['ItemCategory'] = this.itemCategory!.toJson();
    }
    data['MeasurementUnit'] = this.measurementUnit;
    data['MedicalType'] = this.medicalType;
    data['Inventory'] = this.inventory;
    data['Id'] = this.id;
    data['Active'] = this.active;
    data['UserId'] = this.userId;
    data['HasErrors'] = this.hasErrors;
    data['ErrorCount'] = this.errorCount;
    data['NoErrors'] = this.noErrors;
    return data;
  }
}

class ItemCategory {
  dynamic? name;
  dynamic? medicalTypeId;
  dynamic? referralCommission;
  bool? isPathology;
  dynamic? sampleId;
  List<dynamic>? items;
  List<dynamic>? itemSubCategories;
  dynamic? medicalType;
  dynamic? tenantId;
  dynamic? tenant;
  dynamic? id;
  bool? active;
  dynamic? userId;
  bool? hasErrors;
  dynamic? errorCount;
  bool? noErrors;

  ItemCategory(
      {this.name,
        this.medicalTypeId,
        this.referralCommission,
        this.isPathology,
        this.sampleId,
        this.items,
        this.itemSubCategories,
        this.medicalType,
        this.tenantId,
        this.tenant,
        this.id,
        this.active,
        this.userId,
        this.hasErrors,
        this.errorCount,
        this.noErrors});

  ItemCategory.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    medicalTypeId = json['MedicalTypeId'];
    referralCommission = json['ReferralCommission'];
    isPathology = json['IsPathology'];
    sampleId = json['SampleId'];
    if (json['Items'] != null) {
      items = <Null>[];
      json['Items'].forEach((v) {
      //  items!.add(new Null.fromJson(v));
      });
    }
    if (json['ItemSubCategories'] != null) {
      itemSubCategories = <Null>[];
      json['ItemSubCategories'].forEach((v) {
       // itemSubCategories!.add(new Null.fromJson(v));
      });
    }
    medicalType = json['MedicalType'];
    tenantId = json['TenantId'];
    tenant = json['Tenant'];
    id = json['Id'];
    active = json['Active'];
    userId = json['UserId'];
    hasErrors = json['HasErrors'];
    errorCount = json['ErrorCount'];
    noErrors = json['NoErrors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['MedicalTypeId'] = this.medicalTypeId;
    data['ReferralCommission'] = this.referralCommission;
    data['IsPathology'] = this.isPathology;
    data['SampleId'] = this.sampleId;
    if (this.items != null) {
      //data['Items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.itemSubCategories != null) {
     // data['ItemSubCategories'] = this.itemSubCategories!.map((v) => v.toJson()).toList();
    }
    data['MedicalType'] = this.medicalType;
    data['TenantId'] = this.tenantId;
    data['Tenant'] = this.tenant;
    data['Id'] = this.id;
    data['Active'] = this.active;
    data['UserId'] = this.userId;
    data['HasErrors'] = this.hasErrors;
    data['ErrorCount'] = this.errorCount;
    data['NoErrors'] = this.noErrors;
    return data;
  }
}

class SurgeryNotes {
  dynamic? id;
  dynamic? surgeryId;
  dynamic? note;
  dynamic? userId;
  bool? active;

  SurgeryNotes({this.id, this.surgeryId, this.note, this.userId, this.active});

  SurgeryNotes.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    surgeryId = json['SurgeryId'];
    note = json['Note'];
    userId = json['UserId'];
    active = json['Active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['SurgeryId'] = this.surgeryId;
    data['Note'] = this.note;
    data['UserId'] = this.userId;
    data['Active'] = this.active;
    return data;
  }
}