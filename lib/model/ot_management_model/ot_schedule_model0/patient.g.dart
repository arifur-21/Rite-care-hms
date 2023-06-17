// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      id: json['Id'] as int?,
      oldId: json['OldId'],
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      genderId: json['GenderId'] as int?,
      bloodGroup: json['BloodGroup'] as String?,
      bloodGroupId: json['BloodGroupId'] as int?,
      fatherName: json['FatherName'],
      dob: json['DOB'] as String?,
      nationalId: json['NationalId'] as String?,
      occupation: json['Occupation'],
      street: json['Street'] as String?,
      city: json['City'] as String?,
      zip: json['Zip'] as String?,
      country: json['Country'] as String?,
      email: json['Email'] as String?,
      photo: json['Photo'] as String?,
      emergencyNumber: json['EmergencyNumber'] as String?,
      emergencyContactName: json['EmergencyContactName'] as String?,
      emergencyContactRelation: json['EmergencyContactRelation'] as String?,
      createdDate: json['CreatedDate'] as String?,
      serviceId: json['ServiceId'] as String?,
      relationshipId: json['RelationshipId'] as int?,
      rankId: json['RankId'] as int?,
      tradeId: json['TradeId'],
      serviceTypeId: json['ServiceTypeId'] as int?,
      rankTypeId: json['RankTypeId'] as String?,
      unitName: json['UnitName'] as String?,
      rankName: json['RankName'] as String?,
      tradeName: json['TradeName'] as String?,
      unitId: json['UnitId'] as int?,
      isRetired: json['IsRetired'] as bool?,
      patientPrefixId: json['PatientPrefixId'] as int?,
      patientStatusId: json['PatientStatusId'],
      sex: json['Sex'] as String?,
      oldDob: json['OldDob'] as String?,
      relationship: json['Relationship'] == null
          ? null
          : Relationship.fromJson(json['Relationship'] as Map<String, dynamic>),
      rank: json['Rank'],
      unit: json['Unit'],
      trade: json['Trade'],
      parentPatient: json['ParentPatient'] == null
          ? null
          : ParentPatient.fromJson(
              json['ParentPatient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'Id': instance.id,
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
      'Relationship': instance.relationship,
      'Rank': instance.rank,
      'Unit': instance.unit,
      'Trade': instance.trade,
      'ParentPatient': instance.parentPatient,
    };