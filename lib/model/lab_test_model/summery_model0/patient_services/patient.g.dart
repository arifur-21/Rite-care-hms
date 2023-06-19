// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      oldId: json['OldId'],
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      genderId: json['GenderId'],
      bloodGroup: json['BloodGroup'],
      bloodGroupId: json['BloodGroupId'],
      fatherName: json['FatherName'],
      dob: json['DOB'] as String?,
      nationalId: json['NationalId'] as String?,
      occupation: json['Occupation'] as String?,
      street: json['Street'] as String?,
      city: json['City'] as String?,
      zip: json['Zip'] as String?,
      country: json['Country'] as String?,
      email: json['Email'] as String?,
      photo: json['Photo'],
      emergencyNumber: json['EmergencyNumber'] as String?,
      emergencyContactName: json['EmergencyContactName'] as String?,
      emergencyContactRelation: json['EmergencyContactRelation'] as String?,
      createdDate: json['CreatedDate'] as String?,
      serviceId: json['ServiceId'] as String?,
      relationshipId: json['RelationshipId'],
      rankId: json['RankId'],
      tradeId: json['TradeId'],
      serviceTypeId: json['ServiceTypeId'],
      rankTypeId: json['RankTypeId'],
      unitName: json['UnitName'] as String?,
      rankName: json['RankName'] as String?,
      tradeName: json['TradeName'],
      unitId: json['UnitId'],
      isRetired: json['IsRetired'] as bool?,
      patientPrefixId: json['PatientPrefixId'],
      patientStatusId: json['PatientStatusId'],
      sex: json['Sex'],
      oldDob: json['OldDob'],
      gender: json['Gender'] == null
          ? null
          : Gender.fromJson(json['Gender'] as Map<String, dynamic>),
      patientPrefix: json['PatientPrefix'],
      patientStatus: json['PatientStatus'],
      memberships: json['Memberships'] as List<dynamic>?,
      patientInvoices: json['PatientInvoices'] as List<dynamic>?,
      patientServices: json['PatientServices'] as List<dynamic>?,
      payments: json['Payments'] as List<dynamic>?,
      doctorAppointments: json['DoctorAppointments'] as List<dynamic>?,
      relationship: json['Relationship'] == null
          ? null
          : Relationship.fromJson(json['Relationship'] as Map<String, dynamic>),
      rank: json['Rank'],
      unit: json['Unit'],
      trade: json['Trade'],
      parentPatient: json['ParentPatient'],
      visitNo: json['VisitNo'],
      patientInvoiceShadowId: json['PatientInvoiceShadowId'],
      tenantId: json['TenantId'],
      tenant: json['Tenant'],
      id: json['Id'],
      active: json['Active'] as bool?,
      userId: json['UserId'],
      hasErrors: json['HasErrors'] as bool?,
      errorCount: json['ErrorCount'],
      noErrors: json['NoErrors'] as bool?,
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'OldId': instance.oldId,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'PhoneNumber': instance.phoneNumber,
      'GenderId': instance.genderId,
      'BloodGroup': instance.bloodGroup,
      'BloodGroupId': instance.bloodGroupId,
      'FatherName': instance.fatherName,
      'DOB': instance.dob,
      'NationalId': instance.nationalId,
      'Occupation': instance.occupation,
      'Street': instance.street,
      'City': instance.city,
      'Zip': instance.zip,
      'Country': instance.country,
      'Email': instance.email,
      'Photo': instance.photo,
      'EmergencyNumber': instance.emergencyNumber,
      'EmergencyContactName': instance.emergencyContactName,
      'EmergencyContactRelation': instance.emergencyContactRelation,
      'CreatedDate': instance.createdDate,
      'ServiceId': instance.serviceId,
      'RelationshipId': instance.relationshipId,
      'RankId': instance.rankId,
      'TradeId': instance.tradeId,
      'ServiceTypeId': instance.serviceTypeId,
      'RankTypeId': instance.rankTypeId,
      'UnitName': instance.unitName,
      'RankName': instance.rankName,
      'TradeName': instance.tradeName,
      'UnitId': instance.unitId,
      'IsRetired': instance.isRetired,
      'PatientPrefixId': instance.patientPrefixId,
      'PatientStatusId': instance.patientStatusId,
      'Sex': instance.sex,
      'OldDob': instance.oldDob,
      'Gender': instance.gender,
      'PatientPrefix': instance.patientPrefix,
      'PatientStatus': instance.patientStatus,
      'Memberships': instance.memberships,
      'PatientInvoices': instance.patientInvoices,
      'PatientServices': instance.patientServices,
      'Payments': instance.payments,
      'DoctorAppointments': instance.doctorAppointments,
      'Relationship': instance.relationship,
      'Rank': instance.rank,
      'Unit': instance.unit,
      'Trade': instance.trade,
      'ParentPatient': instance.parentPatient,
      'VisitNo': instance.visitNo,
      'PatientInvoiceShadowId': instance.patientInvoiceShadowId,
      'TenantId': instance.tenantId,
      'Tenant': instance.tenant,
      'Id': instance.id,
      'Active': instance.active,
      'UserId': instance.userId,
      'HasErrors': instance.hasErrors,
      'ErrorCount': instance.errorCount,
      'NoErrors': instance.noErrors,
    };