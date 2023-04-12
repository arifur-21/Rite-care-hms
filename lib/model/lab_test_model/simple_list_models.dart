class SampleTest {
  List<Items>? items;
  int? totalItems;

  SampleTest({this.items, this.totalItems});

  SampleTest.fromJson(Map<String, dynamic> json) {
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
  int? invoiceNo;
  int? patientID;
  String? invoiceDate;
  String? dueDate;
  int? invoiceStatusId;
  int? labStatusId;
  int? totalAmount;
  int? totalDiscount;
  Null? itemDiscount;
  bool? isRefunded;
  bool? isReturn;
  Null? modifiedBy;
  bool? isBothSideDiscount;
  int? discountPercentage;
  Null? discountNote;
  Null? patientAdmission;
  bool? isAnyCompleteItem;
  int? advance;
  Null? vat;
  bool? isVatPaid;
  Patient? patient;
  int? amount;
  Null? medicalTypeName;
  bool? isDueCollection;
  int? branchId;
  Null? branch;
  int? tenantId;
  int? id;
  bool? active;
  int? userId;
  bool? hasErrors;
  int? errorCount;
  bool? noErrors;

  Items(
      {this.invoiceNo,
        this.patientID,
        this.invoiceDate,
        this.dueDate,
        this.invoiceStatusId,
        this.labStatusId,
        this.totalAmount,
        this.totalDiscount,
        this.itemDiscount,
        this.isRefunded,
        this.isReturn,
        this.modifiedBy,
        this.isBothSideDiscount,
        this.discountPercentage,
        this.discountNote,
        this.patientAdmission,
        this.isAnyCompleteItem,
        this.advance,
        this.vat,
        this.isVatPaid,
        this.patient,
        this.amount,
        this.medicalTypeName,
        this.isDueCollection,
        this.branchId,
        this.branch,
        this.tenantId,
        this.id,
        this.active,
        this.userId,
        this.hasErrors,
        this.errorCount,
        this.noErrors});

  Items.fromJson(Map<String, dynamic> json) {
    invoiceNo = json['InvoiceNo'];
    patientID = json['PatientID'];
    invoiceDate = json['InvoiceDate'];
    dueDate = json['DueDate'];
    invoiceStatusId = json['InvoiceStatusId'];
    labStatusId = json['LabStatusId'];
    totalAmount = json['TotalAmount'];
    totalDiscount = json['TotalDiscount'];
    itemDiscount = json['ItemDiscount'];
    isRefunded = json['IsRefunded'];
    isReturn = json['IsReturn'];
    modifiedBy = json['ModifiedBy'];
    isBothSideDiscount = json['IsBothSideDiscount'];
    discountPercentage = json['DiscountPercentage'];
    discountNote = json['DiscountNote'];
    patientAdmission = json['PatientAdmission'];
    isAnyCompleteItem = json['IsAnyCompleteItem'];
    advance = json['Advance'];
    vat = json['Vat'];
    isVatPaid = json['IsVatPaid'];
    patient =
    json['Patient'] != null ? new Patient.fromJson(json['Patient']) : null;
    amount = json['Amount'];
    medicalTypeName = json['MedicalTypeName'];
    isDueCollection = json['IsDueCollection'];
    branchId = json['BranchId'];
    branch = json['Branch'];
    tenantId = json['TenantId'];
    id = json['Id'];
    active = json['Active'];
    userId = json['UserId'];
    hasErrors = json['HasErrors'];
    errorCount = json['ErrorCount'];
    noErrors = json['NoErrors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['InvoiceNo'] = this.invoiceNo;
    data['PatientID'] = this.patientID;
    data['InvoiceDate'] = this.invoiceDate;
    data['DueDate'] = this.dueDate;
    data['InvoiceStatusId'] = this.invoiceStatusId;
    data['LabStatusId'] = this.labStatusId;
    data['TotalAmount'] = this.totalAmount;
    data['TotalDiscount'] = this.totalDiscount;
    data['ItemDiscount'] = this.itemDiscount;
    data['IsRefunded'] = this.isRefunded;
    data['IsReturn'] = this.isReturn;
    data['ModifiedBy'] = this.modifiedBy;
    data['IsBothSideDiscount'] = this.isBothSideDiscount;
    data['DiscountPercentage'] = this.discountPercentage;
    data['DiscountNote'] = this.discountNote;
    data['PatientAdmission'] = this.patientAdmission;
    data['IsAnyCompleteItem'] = this.isAnyCompleteItem;
    data['Advance'] = this.advance;
    data['Vat'] = this.vat;
    data['IsVatPaid'] = this.isVatPaid;
    if (this.patient != null) {
      data['Patient'] = this.patient!.toJson();
    }

    data['Amount'] = this.amount;
    data['MedicalTypeName'] = this.medicalTypeName;
    data['IsDueCollection'] = this.isDueCollection;
    data['BranchId'] = this.branchId;
    data['Branch'] = this.branch;
    data['TenantId'] = this.tenantId;
    data['Id'] = this.id;
    data['Active'] = this.active;
    data['UserId'] = this.userId;
    data['HasErrors'] = this.hasErrors;
    data['ErrorCount'] = this.errorCount;
    data['NoErrors'] = this.noErrors;
    return data;
  }
}

class Patient {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  int? genderId;
  Null? bloodGroup;
  Null? bloodGroupId;
  Null? fatherName;
  String? dOB;
  String? nationalId;
  String? occupation;
  String? street;
  String? city;
  String? zip;
  String? country;
  String? email;

  Patient(
      {
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
        });

  Patient.fromJson(Map<String, dynamic> json) {
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

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    return data;
  }
}


