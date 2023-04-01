import 'dart:convert';
/// OldId : null
/// FirstName : "Rizwan"
/// LastName : ""
/// PhoneNumber : "0174569874"
/// GenderId : 1
/// BloodGroup : "O (+ve)"
/// BloodGroupId : 5
/// FatherName : ""
/// DOB : "/Date(859399200000)/"
/// NationalId : ""
/// Occupation : ""
/// Street : ""
/// City : ""
/// Zip : ""
/// Country : "BD"
/// Email : ""
/// Photo : "null"
/// EmergencyNumber : ""
/// EmergencyContactName : ""
/// EmergencyContactRelation : ""
/// CreatedDate : "/Date(1679901252000)/"
/// ServiceId : "987654"
/// RelationshipId : 1
/// RankId : 179
/// TradeId : null
/// ServiceTypeId : 0
/// RankTypeId : "null"
/// UnitName : "71 Bde"
/// RankName : "Capt"
/// TradeName : "null"
/// UnitId : 69
/// IsRetired : false
/// PatientPrefixId : 101
/// PatientStatusId : null
/// Sex : "null"
/// OldDob : "null"
/// Gender : {"Name":"Male","Code":101,"TypeName":"Male","User":null,"BloodDonors":[],"Id":1,"Active":true,"UserId":2,"HasErrors":false,"ErrorCount":0,"NoErrors":true}
/// PatientPrefix : {"Name":"Officers","Prefix":"O         ","LanguageCode":"EN","Id":101,"Active":true,"UserId":null,"HasErrors":false,"ErrorCount":0,"NoErrors":true}
/// PatientStatus : null
/// Memberships : []
/// PatientInvoices : []
/// PatientServices : []
/// Payments : []
/// DoctorAppointments : []
/// Relationship : {"Name":"Self","LanguageCode":null,"Id":1,"Active":true,"UserId":null,"HasErrors":false,"ErrorCount":0,"NoErrors":true}
/// Rank : {"Name":"Capt","LanguageCode":null,"Id":179,"Active":true,"UserId":null,"HasErrors":false,"ErrorCount":0,"NoErrors":true}
/// Unit : {"Name":"71 Bde","LanguageCode":null,"Id":69,"Active":true,"UserId":null,"HasErrors":false,"ErrorCount":0,"NoErrors":true}
/// Trade : null
/// ParentPatient : null
/// VisitNo : null
/// PatientInvoiceShadowId : 0
/// TenantId : 25
/// Tenant : null
/// Id : 775898
/// Active : true
/// UserId : null
/// HasErrors : false
/// ErrorCount : 0
/// NoErrors : true

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));
String searchModelToJson(SearchModel data) => json.encode(data.toJson());
class SearchModel {
  SearchModel({
      dynamic oldId, 
      String? firstName, 
      String? lastName, 
      String? phoneNumber, 
      num? genderId, 
      String? bloodGroup, 
      num? bloodGroupId, 
      String? fatherName, 
      String? dob, 
      String? nationalId, 
      String? occupation, 
      String? street, 
      String? city, 
      String? zip, 
      String? country, 
      String? email, 
      String? photo, 
      String? emergencyNumber, 
      String? emergencyContactName, 
      String? emergencyContactRelation, 
      String? createdDate, 
      String? serviceId, 
      num? relationshipId, 
      num? rankId, 
      dynamic tradeId, 
      num? serviceTypeId, 
      String? rankTypeId, 
      String? unitName, 
      String? rankName, 
      String? tradeName, 
      num? unitId, 
      bool? isRetired, 
      num? patientPrefixId, 
      dynamic patientStatusId, 
      String? sex, 
      String? oldDob, 
      Gender? gender, 
      PatientPrefix? patientPrefix, 
      dynamic patientStatus, 
      List<dynamic>? memberships, 
      List<dynamic>? patientInvoices, 
      List<dynamic>? patientServices, 
      List<dynamic>? payments, 
      List<dynamic>? doctorAppointments, 
      Relationship? relationship, 
      Rank? rank, 
      Unit? unit, 
      dynamic trade, 
      dynamic parentPatient, 
      dynamic visitNo, 
      num? patientInvoiceShadowId, 
      num? tenantId, 
      dynamic tenant, 
      num? id ,
      bool? active, 
      dynamic userId, 
      bool? hasErrors, 
      num? errorCount, 
      bool? noErrors,}){
    _oldId = oldId;
    _firstName = firstName;
    _lastName = lastName;
    _phoneNumber = phoneNumber;
    _genderId = genderId;
    _bloodGroup = bloodGroup;
    _bloodGroupId = bloodGroupId;
    _fatherName = fatherName;
    _dob = dob;
    _nationalId = nationalId;
    _occupation = occupation;
    _street = street;
    _city = city;
    _zip = zip;
    _country = country;
    _email = email;
    _photo = photo;
    _emergencyNumber = emergencyNumber;
    _emergencyContactName = emergencyContactName;
    _emergencyContactRelation = emergencyContactRelation;
    _createdDate = createdDate;
    _serviceId = serviceId;
    _relationshipId = relationshipId;
    _rankId = rankId;
    _tradeId = tradeId;
    _serviceTypeId = serviceTypeId;
    _rankTypeId = rankTypeId;
    _unitName = unitName;
    _rankName = rankName;
    _tradeName = tradeName;
    _unitId = unitId;
    _isRetired = isRetired;
    _patientPrefixId = patientPrefixId;
    _patientStatusId = patientStatusId;
    _sex = sex;
    _oldDob = oldDob;
    _gender = gender;
    _patientPrefix = patientPrefix;
    _patientStatus = patientStatus;
    _memberships = memberships;
    _patientInvoices = patientInvoices;
    _patientServices = patientServices;
    _payments = payments;
    _doctorAppointments = doctorAppointments;
    _relationship = relationship;
    _rank = rank;
    _unit = unit;
    _trade = trade;
    _parentPatient = parentPatient;
    _visitNo = visitNo;
    _patientInvoiceShadowId = patientInvoiceShadowId;
    _tenantId = tenantId;
    _tenant = tenant;
    _id = id;
    _active = active;
    _userId = userId;
    _hasErrors = hasErrors;
    _errorCount = errorCount;
    _noErrors = noErrors;
}

  SearchModel.fromJson(dynamic json) {
    _oldId = json['OldId'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _phoneNumber = json['PhoneNumber'];
    _genderId = json['GenderId'];
    _bloodGroup = json['BloodGroup'];
    _bloodGroupId = json['BloodGroupId'];
    _fatherName = json['FatherName'];
    _dob = json['DOB'];
    _nationalId = json['NationalId'];
    _occupation = json['Occupation'];
    _street = json['Street'];
    _city = json['City'];
    _zip = json['Zip'];
    _country = json['Country'];
    _email = json['Email'];
    _photo = json['Photo'];
    _emergencyNumber = json['EmergencyNumber'];
    _emergencyContactName = json['EmergencyContactName'];
    _emergencyContactRelation = json['EmergencyContactRelation'];
    _createdDate = json['CreatedDate'];
    _serviceId = json['ServiceId'];
    _relationshipId = json['RelationshipId'];
    _rankId = json['RankId'];
    _tradeId = json['TradeId'];
    _serviceTypeId = json['ServiceTypeId'];
    _rankTypeId = json['RankTypeId'];
    _unitName = json['UnitName'];
    _rankName = json['RankName'];
    _tradeName = json['TradeName'];
    _unitId = json['UnitId'];
    _isRetired = json['IsRetired'];
    _patientPrefixId = json['PatientPrefixId'];
    _patientStatusId = json['PatientStatusId'];
    _sex = json['Sex'];
    _oldDob = json['OldDob'];
    _gender = json['Gender'] != null ? Gender.fromJson(json['Gender']) : null;
    _patientPrefix = json['PatientPrefix'] != null ? PatientPrefix.fromJson(json['PatientPrefix']) : null;
    _patientStatus = json['PatientStatus'];
    if (json['Memberships'] != null) {
      _memberships = [];
      json['Memberships'].forEach((v) {
      //  _memberships?.add(Dynamic.fromJson(v));
      });
    }
    if (json['PatientInvoices'] != null) {
      _patientInvoices = [];
      json['PatientInvoices'].forEach((v) {
       // _patientInvoices?.add(Dynamic.fromJson(v));
      });
    }
    if (json['PatientServices'] != null) {
      _patientServices = [];
      json['PatientServices'].forEach((v) {
       // _patientServices?.add(Dynamic.fromJson(v));
      });
    }
    if (json['Payments'] != null) {
      _payments = [];
      json['Payments'].forEach((v) {
      //  _payments?.add(Dynamic.fromJson(v));
      });
    }
    if (json['DoctorAppointments'] != null) {
      _doctorAppointments = [];
      json['DoctorAppointments'].forEach((v) {
        //_doctorAppointments?.add(Dynamic.fromJson(v));
      });
    }
    _relationship = json['Relationship'] != null ? Relationship.fromJson(json['Relationship']) : null;
    _rank = json['Rank'] != null ? Rank.fromJson(json['Rank']) : null;
    _unit = json['Unit'] != null ? Unit.fromJson(json['Unit']) : null;
    _trade = json['Trade'];
    _parentPatient = json['ParentPatient'];
    _visitNo = json['VisitNo'];
    _patientInvoiceShadowId = json['PatientInvoiceShadowId'];
    _tenantId = json['TenantId'];
    _tenant = json['Tenant'];
    _id = json['Id'];
    _active = json['Active'];
    _userId = json['UserId'];
    _hasErrors = json['HasErrors'];
    _errorCount = json['ErrorCount'];
    _noErrors = json['NoErrors'];
  }
  dynamic _oldId;
  String? _firstName;
  String? _lastName;
  String? _phoneNumber;
  num? _genderId;
  String? _bloodGroup;
  num? _bloodGroupId;
  String? _fatherName;
  String? _dob;
  String? _nationalId;
  String? _occupation;
  String? _street;
  String? _city;
  String? _zip;
  String? _country;
  String? _email;
  String? _photo;
  String? _emergencyNumber;
  String? _emergencyContactName;
  String? _emergencyContactRelation;
  String? _createdDate;
  String? _serviceId;
  num? _relationshipId;
  num? _rankId;
  dynamic _tradeId;
  num? _serviceTypeId;
  String? _rankTypeId;
  String? _unitName;
  String? _rankName;
  String? _tradeName;
  num? _unitId;
  bool? _isRetired;
  num? _patientPrefixId;
  dynamic _patientStatusId;
  String? _sex;
  String? _oldDob;
  Gender? _gender;
  PatientPrefix? _patientPrefix;
  dynamic _patientStatus;
  List<dynamic>? _memberships;
  List<dynamic>? _patientInvoices;
  List<dynamic>? _patientServices;
  List<dynamic>? _payments;
  List<dynamic>? _doctorAppointments;
  Relationship? _relationship;
  Rank? _rank;
  Unit? _unit;
  dynamic _trade;
  dynamic _parentPatient;
  dynamic _visitNo;
  num? _patientInvoiceShadowId;
  num? _tenantId;
  dynamic _tenant;
  num? _id;
  bool? _active;
  dynamic _userId;
  bool? _hasErrors;
  num? _errorCount;
  bool? _noErrors;
SearchModel copyWith({  dynamic oldId,
  String? firstName,
  String? lastName,
  String? phoneNumber,
  num? genderId,
  String? bloodGroup,
  num? bloodGroupId,
  String? fatherName,
  String? dob,
  String? nationalId,
  String? occupation,
  String? street,
  String? city,
  String? zip,
  String? country,
  String? email,
  String? photo,
  String? emergencyNumber,
  String? emergencyContactName,
  String? emergencyContactRelation,
  String? createdDate,
  String? serviceId,
  num? relationshipId,
  num? rankId,
  dynamic tradeId,
  num? serviceTypeId,
  String? rankTypeId,
  String? unitName,
  String? rankName,
  String? tradeName,
  num? unitId,
  bool? isRetired,
  num? patientPrefixId,
  dynamic patientStatusId,
  String? sex,
  String? oldDob,
  Gender? gender,
  PatientPrefix? patientPrefix,
  dynamic patientStatus,
  List<dynamic>? memberships,
  List<dynamic>? patientInvoices,
  List<dynamic>? patientServices,
  List<dynamic>? payments,
  List<dynamic>? doctorAppointments,
  Relationship? relationship,
  Rank? rank,
  Unit? unit,
  dynamic trade,
  dynamic parentPatient,
  dynamic visitNo,
  num? patientInvoiceShadowId,
  num? tenantId,
  dynamic tenant,
  num? id,
  bool? active,
  dynamic userId,
  bool? hasErrors,
  num? errorCount,
  bool? noErrors,
}) => SearchModel(  oldId: oldId ?? _oldId,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  phoneNumber: phoneNumber ?? _phoneNumber,
  genderId: genderId ?? _genderId,
  bloodGroup: bloodGroup ?? _bloodGroup,
  bloodGroupId: bloodGroupId ?? _bloodGroupId,
  fatherName: fatherName ?? _fatherName,
  dob: dob ?? _dob,
  nationalId: nationalId ?? _nationalId,
  occupation: occupation ?? _occupation,
  street: street ?? _street,
  city: city ?? _city,
  zip: zip ?? _zip,
  country: country ?? _country,
  email: email ?? _email,
  photo: photo ?? _photo,
  emergencyNumber: emergencyNumber ?? _emergencyNumber,
  emergencyContactName: emergencyContactName ?? _emergencyContactName,
  emergencyContactRelation: emergencyContactRelation ?? _emergencyContactRelation,
  createdDate: createdDate ?? _createdDate,
  serviceId: serviceId ?? _serviceId,
  relationshipId: relationshipId ?? _relationshipId,
  rankId: rankId ?? _rankId,
  tradeId: tradeId ?? _tradeId,
  serviceTypeId: serviceTypeId ?? _serviceTypeId,
  rankTypeId: rankTypeId ?? _rankTypeId,
  unitName: unitName ?? _unitName,
  rankName: rankName ?? _rankName,
  tradeName: tradeName ?? _tradeName,
  unitId: unitId ?? _unitId,
  isRetired: isRetired ?? _isRetired,
  patientPrefixId: patientPrefixId ?? _patientPrefixId,
  patientStatusId: patientStatusId ?? _patientStatusId,
  sex: sex ?? _sex,
  oldDob: oldDob ?? _oldDob,
  gender: gender ?? _gender,
  patientPrefix: patientPrefix ?? _patientPrefix,
  patientStatus: patientStatus ?? _patientStatus,
  memberships: memberships ?? _memberships,
  patientInvoices: patientInvoices ?? _patientInvoices,
  patientServices: patientServices ?? _patientServices,
  payments: payments ?? _payments,
  doctorAppointments: doctorAppointments ?? _doctorAppointments,
  relationship: relationship ?? _relationship,
  rank: rank ?? _rank,
  unit: unit ?? _unit,
  trade: trade ?? _trade,
  parentPatient: parentPatient ?? _parentPatient,
  visitNo: visitNo ?? _visitNo,
  patientInvoiceShadowId: patientInvoiceShadowId ?? _patientInvoiceShadowId,
  tenantId: tenantId ?? _tenantId,
  tenant: tenant ?? _tenant,
  id: id ?? _id,
  active: active ?? _active,
  userId: userId ?? _userId,
  hasErrors: hasErrors ?? _hasErrors,
  errorCount: errorCount ?? _errorCount,
  noErrors: noErrors ?? _noErrors,
);
  dynamic get oldId => _oldId;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get phoneNumber => _phoneNumber;
  num? get genderId => _genderId;
  String? get bloodGroup => _bloodGroup;
  num? get bloodGroupId => _bloodGroupId;
  String? get fatherName => _fatherName;
  String? get dob => _dob;
  String? get nationalId => _nationalId;
  String? get occupation => _occupation;
  String? get street => _street;
  String? get city => _city;
  String? get zip => _zip;
  String? get country => _country;
  String? get email => _email;
  String? get photo => _photo;
  String? get emergencyNumber => _emergencyNumber;
  String? get emergencyContactName => _emergencyContactName;
  String? get emergencyContactRelation => _emergencyContactRelation;
  String? get createdDate => _createdDate;
  String? get serviceId => _serviceId;
  num? get relationshipId => _relationshipId;
  num? get rankId => _rankId;
  dynamic get tradeId => _tradeId;
  num? get serviceTypeId => _serviceTypeId;
  String? get rankTypeId => _rankTypeId;
  String? get unitName => _unitName;
  String? get rankName => _rankName;
  String? get tradeName => _tradeName;
  num? get unitId => _unitId;
  bool? get isRetired => _isRetired;
  num? get patientPrefixId => _patientPrefixId;
  dynamic get patientStatusId => _patientStatusId;
  String? get sex => _sex;
  String? get oldDob => _oldDob;
  Gender? get gender => _gender;
  PatientPrefix? get patientPrefix => _patientPrefix;
  dynamic get patientStatus => _patientStatus;
  List<dynamic>? get memberships => _memberships;
  List<dynamic>? get patientInvoices => _patientInvoices;
  List<dynamic>? get patientServices => _patientServices;
  List<dynamic>? get payments => _payments;
  List<dynamic>? get doctorAppointments => _doctorAppointments;
  Relationship? get relationship => _relationship;
  Rank? get rank => _rank;
  Unit? get unit => _unit;
  dynamic get trade => _trade;
  dynamic get parentPatient => _parentPatient;
  dynamic get visitNo => _visitNo;
  num? get patientInvoiceShadowId => _patientInvoiceShadowId;
  num? get tenantId => _tenantId;
  dynamic get tenant => _tenant;
  num? get id => _id;
  bool? get active => _active;
  dynamic get userId => _userId;
  bool? get hasErrors => _hasErrors;
  num? get errorCount => _errorCount;
  bool? get noErrors => _noErrors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['OldId'] = _oldId;
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['PhoneNumber'] = _phoneNumber;
    map['GenderId'] = _genderId;
    map['BloodGroup'] = _bloodGroup;
    map['BloodGroupId'] = _bloodGroupId;
    map['FatherName'] = _fatherName;
    map['DOB'] = _dob;
    map['NationalId'] = _nationalId;
    map['Occupation'] = _occupation;
    map['Street'] = _street;
    map['City'] = _city;
    map['Zip'] = _zip;
    map['Country'] = _country;
    map['Email'] = _email;
    map['Photo'] = _photo;
    map['EmergencyNumber'] = _emergencyNumber;
    map['EmergencyContactName'] = _emergencyContactName;
    map['EmergencyContactRelation'] = _emergencyContactRelation;
    map['CreatedDate'] = _createdDate;
    map['ServiceId'] = _serviceId;
    map['RelationshipId'] = _relationshipId;
    map['RankId'] = _rankId;
    map['TradeId'] = _tradeId;
    map['ServiceTypeId'] = _serviceTypeId;
    map['RankTypeId'] = _rankTypeId;
    map['UnitName'] = _unitName;
    map['RankName'] = _rankName;
    map['TradeName'] = _tradeName;
    map['UnitId'] = _unitId;
    map['IsRetired'] = _isRetired;
    map['PatientPrefixId'] = _patientPrefixId;
    map['PatientStatusId'] = _patientStatusId;
    map['Sex'] = _sex;
    map['OldDob'] = _oldDob;
    if (_gender != null) {
      map['Gender'] = _gender?.toJson();
    }
    if (_patientPrefix != null) {
      map['PatientPrefix'] = _patientPrefix?.toJson();
    }
    map['PatientStatus'] = _patientStatus;
    if (_memberships != null) {
      map['Memberships'] = _memberships?.map((v) => v.toJson()).toList();
    }
    if (_patientInvoices != null) {
      map['PatientInvoices'] = _patientInvoices?.map((v) => v.toJson()).toList();
    }
    if (_patientServices != null) {
      map['PatientServices'] = _patientServices?.map((v) => v.toJson()).toList();
    }
    if (_payments != null) {
      map['Payments'] = _payments?.map((v) => v.toJson()).toList();
    }
    if (_doctorAppointments != null) {
      map['DoctorAppointments'] = _doctorAppointments?.map((v) => v.toJson()).toList();
    }
    if (_relationship != null) {
      map['Relationship'] = _relationship?.toJson();
    }
    if (_rank != null) {
      map['Rank'] = _rank?.toJson();
    }
    if (_unit != null) {
      map['Unit'] = _unit?.toJson();
    }
    map['Trade'] = _trade;
    map['ParentPatient'] = _parentPatient;
    map['VisitNo'] = _visitNo;
    map['PatientInvoiceShadowId'] = _patientInvoiceShadowId;
    map['TenantId'] = _tenantId;
    map['Tenant'] = _tenant;
    map['Id'] = _id;
    map['Active'] = _active;
    map['UserId'] = _userId;
    map['HasErrors'] = _hasErrors;
    map['ErrorCount'] = _errorCount;
    map['NoErrors'] = _noErrors;
    return map;
  }

}

/// Name : "71 Bde"
/// LanguageCode : null
/// Id : 69
/// Active : true
/// UserId : null
/// HasErrors : false
/// ErrorCount : 0
/// NoErrors : true

Unit unitFromJson(String str) => Unit.fromJson(json.decode(str));
String unitToJson(Unit data) => json.encode(data.toJson());
class Unit {
  Unit({
      String? name, 
      dynamic languageCode, 
      num? id, 
      bool? active, 
      dynamic userId, 
      bool? hasErrors, 
      num? errorCount, 
      bool? noErrors,}){
    _name = name;
    _languageCode = languageCode;
    _id = id;
    _active = active;
    _userId = userId;
    _hasErrors = hasErrors;
    _errorCount = errorCount;
    _noErrors = noErrors;
}

  Unit.fromJson(dynamic json) {
    _name = json['Name'];
    _languageCode = json['LanguageCode'];
    _id = json['Id'];
    _active = json['Active'];
    _userId = json['UserId'];
    _hasErrors = json['HasErrors'];
    _errorCount = json['ErrorCount'];
    _noErrors = json['NoErrors'];
  }
  String? _name;
  dynamic _languageCode;
  num? _id;
  bool? _active;
  dynamic _userId;
  bool? _hasErrors;
  num? _errorCount;
  bool? _noErrors;
Unit copyWith({  String? name,
  dynamic languageCode,
  num? id,
  bool? active,
  dynamic userId,
  bool? hasErrors,
  num? errorCount,
  bool? noErrors,
}) => Unit(  name: name ?? _name,
  languageCode: languageCode ?? _languageCode,
  id: id ?? _id,
  active: active ?? _active,
  userId: userId ?? _userId,
  hasErrors: hasErrors ?? _hasErrors,
  errorCount: errorCount ?? _errorCount,
  noErrors: noErrors ?? _noErrors,
);
  String? get name => _name;
  dynamic get languageCode => _languageCode;
  num? get id => _id;
  bool? get active => _active;
  dynamic get userId => _userId;
  bool? get hasErrors => _hasErrors;
  num? get errorCount => _errorCount;
  bool? get noErrors => _noErrors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = _name;
    map['LanguageCode'] = _languageCode;
    map['Id'] = _id;
    map['Active'] = _active;
    map['UserId'] = _userId;
    map['HasErrors'] = _hasErrors;
    map['ErrorCount'] = _errorCount;
    map['NoErrors'] = _noErrors;
    return map;
  }

}

/// Name : "Capt"
/// LanguageCode : null
/// Id : 179
/// Active : true
/// UserId : null
/// HasErrors : false
/// ErrorCount : 0
/// NoErrors : true

Rank rankFromJson(String str) => Rank.fromJson(json.decode(str));
String rankToJson(Rank data) => json.encode(data.toJson());
class Rank {
  Rank({
      String? name, 
      dynamic languageCode, 
      num? id, 
      bool? active, 
      dynamic userId, 
      bool? hasErrors, 
      num? errorCount, 
      bool? noErrors,}){
    _name = name;
    _languageCode = languageCode;
    _id = id;
    _active = active;
    _userId = userId;
    _hasErrors = hasErrors;
    _errorCount = errorCount;
    _noErrors = noErrors;
}

  Rank.fromJson(dynamic json) {
    _name = json['Name'];
    _languageCode = json['LanguageCode'];
    _id = json['Id'];
    _active = json['Active'];
    _userId = json['UserId'];
    _hasErrors = json['HasErrors'];
    _errorCount = json['ErrorCount'];
    _noErrors = json['NoErrors'];
  }
  String? _name;
  dynamic _languageCode;
  num? _id;
  bool? _active;
  dynamic _userId;
  bool? _hasErrors;
  num? _errorCount;
  bool? _noErrors;
Rank copyWith({  String? name,
  dynamic languageCode,
  num? id,
  bool? active,
  dynamic userId,
  bool? hasErrors,
  num? errorCount,
  bool? noErrors,
}) => Rank(  name: name ?? _name,
  languageCode: languageCode ?? _languageCode,
  id: id ?? _id,
  active: active ?? _active,
  userId: userId ?? _userId,
  hasErrors: hasErrors ?? _hasErrors,
  errorCount: errorCount ?? _errorCount,
  noErrors: noErrors ?? _noErrors,
);
  String? get name => _name;
  dynamic get languageCode => _languageCode;
  num? get id => _id;
  bool? get active => _active;
  dynamic get userId => _userId;
  bool? get hasErrors => _hasErrors;
  num? get errorCount => _errorCount;
  bool? get noErrors => _noErrors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = _name;
    map['LanguageCode'] = _languageCode;
    map['Id'] = _id;
    map['Active'] = _active;
    map['UserId'] = _userId;
    map['HasErrors'] = _hasErrors;
    map['ErrorCount'] = _errorCount;
    map['NoErrors'] = _noErrors;
    return map;
  }

}

/// Name : "Self"
/// LanguageCode : null
/// Id : 1
/// Active : true
/// UserId : null
/// HasErrors : false
/// ErrorCount : 0
/// NoErrors : true

Relationship relationshipFromJson(String str) => Relationship.fromJson(json.decode(str));
String relationshipToJson(Relationship data) => json.encode(data.toJson());
class Relationship {
  Relationship({
      String? name, 
      dynamic languageCode, 
      num? id, 
      bool? active, 
      dynamic userId, 
      bool? hasErrors, 
      num? errorCount, 
      bool? noErrors,}){
    _name = name;
    _languageCode = languageCode;
    _id = id;
    _active = active;
    _userId = userId;
    _hasErrors = hasErrors;
    _errorCount = errorCount;
    _noErrors = noErrors;
}

  Relationship.fromJson(dynamic json) {
    _name = json['Name'];
    _languageCode = json['LanguageCode'];
    _id = json['Id'];
    _active = json['Active'];
    _userId = json['UserId'];
    _hasErrors = json['HasErrors'];
    _errorCount = json['ErrorCount'];
    _noErrors = json['NoErrors'];
  }
  String? _name;
  dynamic _languageCode;
  num? _id;
  bool? _active;
  dynamic _userId;
  bool? _hasErrors;
  num? _errorCount;
  bool? _noErrors;
Relationship copyWith({  String? name,
  dynamic languageCode,
  num? id,
  bool? active,
  dynamic userId,
  bool? hasErrors,
  num? errorCount,
  bool? noErrors,
}) => Relationship(  name: name ?? _name,
  languageCode: languageCode ?? _languageCode,
  id: id ?? _id,
  active: active ?? _active,
  userId: userId ?? _userId,
  hasErrors: hasErrors ?? _hasErrors,
  errorCount: errorCount ?? _errorCount,
  noErrors: noErrors ?? _noErrors,
);
  String? get name => _name;
  dynamic get languageCode => _languageCode;
  num? get id => _id;
  bool? get active => _active;
  dynamic get userId => _userId;
  bool? get hasErrors => _hasErrors;
  num? get errorCount => _errorCount;
  bool? get noErrors => _noErrors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = _name;
    map['LanguageCode'] = _languageCode;
    map['Id'] = _id;
    map['Active'] = _active;
    map['UserId'] = _userId;
    map['HasErrors'] = _hasErrors;
    map['ErrorCount'] = _errorCount;
    map['NoErrors'] = _noErrors;
    return map;
  }

}

/// Name : "Officers"
/// Prefix : "O         "
/// LanguageCode : "EN"
/// Id : 101
/// Active : true
/// UserId : null
/// HasErrors : false
/// ErrorCount : 0
/// NoErrors : true

PatientPrefix patientPrefixFromJson(String str) => PatientPrefix.fromJson(json.decode(str));
String patientPrefixToJson(PatientPrefix data) => json.encode(data.toJson());
class PatientPrefix {
  PatientPrefix({
      String? name, 
      String? prefix, 
      String? languageCode, 
      num? id, 
      bool? active, 
      dynamic userId, 
      bool? hasErrors, 
      num? errorCount, 
      bool? noErrors,}){
    _name = name;
    _prefix = prefix;
    _languageCode = languageCode;
    _id = id;
    _active = active;
    _userId = userId;
    _hasErrors = hasErrors;
    _errorCount = errorCount;
    _noErrors = noErrors;
}

  PatientPrefix.fromJson(dynamic json) {
    _name = json['Name'];
    _prefix = json['Prefix'];
    _languageCode = json['LanguageCode'];
    _id = json['Id'];
    _active = json['Active'];
    _userId = json['UserId'];
    _hasErrors = json['HasErrors'];
    _errorCount = json['ErrorCount'];
    _noErrors = json['NoErrors'];
  }
  String? _name;
  String? _prefix;
  String? _languageCode;
  num? _id;
  bool? _active;
  dynamic _userId;
  bool? _hasErrors;
  num? _errorCount;
  bool? _noErrors;
PatientPrefix copyWith({  String? name,
  String? prefix,
  String? languageCode,
  num? id,
  bool? active,
  dynamic userId,
  bool? hasErrors,
  num? errorCount,
  bool? noErrors,
}) => PatientPrefix(  name: name ?? _name,
  prefix: prefix ?? _prefix,
  languageCode: languageCode ?? _languageCode,
  id: id ?? _id,
  active: active ?? _active,
  userId: userId ?? _userId,
  hasErrors: hasErrors ?? _hasErrors,
  errorCount: errorCount ?? _errorCount,
  noErrors: noErrors ?? _noErrors,
);
  String? get name => _name;
  String? get prefix => _prefix;
  String? get languageCode => _languageCode;
  num? get id => _id;
  bool? get active => _active;
  dynamic get userId => _userId;
  bool? get hasErrors => _hasErrors;
  num? get errorCount => _errorCount;
  bool? get noErrors => _noErrors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = _name;
    map['Prefix'] = _prefix;
    map['LanguageCode'] = _languageCode;
    map['Id'] = _id;
    map['Active'] = _active;
    map['UserId'] = _userId;
    map['HasErrors'] = _hasErrors;
    map['ErrorCount'] = _errorCount;
    map['NoErrors'] = _noErrors;
    return map;
  }

}

/// Name : "Male"
/// Code : 101
/// TypeName : "Male"
/// User : null
/// BloodDonors : []
/// Id : 1
/// Active : true
/// UserId : 2
/// HasErrors : false
/// ErrorCount : 0
/// NoErrors : true

Gender genderFromJson(String str) => Gender.fromJson(json.decode(str));
String genderToJson(Gender data) => json.encode(data.toJson());
class Gender {
  Gender({
      String? name, 
      num? code, 
      String? typeName, 
      dynamic user, 
      List<dynamic>? bloodDonors, 
      num? id, 
      bool? active, 
      num? userId, 
      bool? hasErrors, 
      num? errorCount, 
      bool? noErrors,}){
    _name = name;
    _code = code;
    _typeName = typeName;
    _user = user;
    _bloodDonors = bloodDonors;
    _id = id;
    _active = active;
    _userId = userId;
    _hasErrors = hasErrors;
    _errorCount = errorCount;
    _noErrors = noErrors;
}

  Gender.fromJson(dynamic json) {
    _name = json['Name'];
    _code = json['Code'];
    _typeName = json['TypeName'];
    _user = json['User'];
    if (json['BloodDonors'] != null) {
      _bloodDonors = [];
      json['BloodDonors'].forEach((v) {
       // _bloodDonors?.add(Dynamic.fromJson(v));
      });
    }
    _id = json['Id'];
    _active = json['Active'];
    _userId = json['UserId'];
    _hasErrors = json['HasErrors'];
    _errorCount = json['ErrorCount'];
    _noErrors = json['NoErrors'];
  }
  String? _name;
  num? _code;
  String? _typeName;
  dynamic _user;
  List<dynamic>? _bloodDonors;
  num? _id;
  bool? _active;
  num? _userId;
  bool? _hasErrors;
  num? _errorCount;
  bool? _noErrors;
Gender copyWith({  String? name,
  num? code,
  String? typeName,
  dynamic user,
  List<dynamic>? bloodDonors,
  num? id,
  bool? active,
  num? userId,
  bool? hasErrors,
  num? errorCount,
  bool? noErrors,
}) => Gender(  name: name ?? _name,
  code: code ?? _code,
  typeName: typeName ?? _typeName,
  user: user ?? _user,
  bloodDonors: bloodDonors ?? _bloodDonors,
  id: id ?? _id,
  active: active ?? _active,
  userId: userId ?? _userId,
  hasErrors: hasErrors ?? _hasErrors,
  errorCount: errorCount ?? _errorCount,
  noErrors: noErrors ?? _noErrors,
);
  String? get name => _name;
  num? get code => _code;
  String? get typeName => _typeName;
  dynamic get user => _user;
  List<dynamic>? get bloodDonors => _bloodDonors;
  num? get id => _id;
  bool? get active => _active;
  num? get userId => _userId;
  bool? get hasErrors => _hasErrors;
  num? get errorCount => _errorCount;
  bool? get noErrors => _noErrors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = _name;
    map['Code'] = _code;
    map['TypeName'] = _typeName;
    map['User'] = _user;
    if (_bloodDonors != null) {
      map['BloodDonors'] = _bloodDonors?.map((v) => v.toJson()).toList();
    }
    map['Id'] = _id;
    map['Active'] = _active;
    map['UserId'] = _userId;
    map['HasErrors'] = _hasErrors;
    map['ErrorCount'] = _errorCount;
    map['NoErrors'] = _noErrors;
    return map;
  }

}