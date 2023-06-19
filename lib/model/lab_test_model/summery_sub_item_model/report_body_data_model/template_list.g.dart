// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateList _$TemplateListFromJson(Map<String, dynamic> json) => TemplateList(
      itemId: json['ItemId'],
      headerName: json['HeaderName'],
      headerNote: json['HeaderNote'],
      name: json['Name'],
      isResultDropDown: json['IsResultDropDown'] as bool?,
      result: json['Result'],
      itemWiseValueId: json['ItemWiseValueId'],
      isUnitDropDown: json['IsUnitDropDown'] as bool?,
      unitId: json['UnitId'],
      opinionId: json['OpinionId'],
      comment: json['Comment'],
      referanceValue: json['ReferanceValue'],
      techonology: json['Techonology'],
      machineUnitName: json['MachineUnitName'],
      createdDate: json['CreatedDate'],
      opinionText: json['OpinionText'],
      isOpinionDropDown: json['IsOpinionDropDown'] as bool?,
      machineId: json['MachineId'],
      serialNo: json['SerialNo'],
      machine: json['Machine'],
      opinion: json['Opinion'],
      itemWiseValue: json['ItemWiseValue'],
      labTemplateDesignComment: json['LabTemplateDesignComment'],
      isComment: json['IsComment'] as bool?,
      tenantId: json['TenantId'],
      tenant: json['Tenant'],
      id: json['Id'],
      active: json['Active'] as bool?,
      userId: json['UserId'],
      hasErrors: json['HasErrors'] as bool?,
      errorCount: json['ErrorCount'],
      noErrors: json['NoErrors'] as bool?,
      selectedIcon: json['selectedIcon'] as bool?,
      activePosition: json['activePosition'] as bool?,
      isBold: json['IsBold'] as bool?,
      boldImage: json['BoldImage'],
      isReferanceColumn: json['IsReferanceColumn'] as bool?,
      isTechonologyColumn: json['IsTechonologyColumn'] as bool?,
      patientServiceId: json['PatientServiceId'],
    );

Map<String, dynamic> _$TemplateListToJson(TemplateList instance) =>
    <String, dynamic>{
      'ItemId': instance.itemId,
      'HeaderName': instance.headerName,
      'HeaderNote': instance.headerNote,
      'Name': instance.name,
      'IsResultDropDown': instance.isResultDropDown,
      'Result': instance.result,
      'ItemWiseValueId': instance.itemWiseValueId,
      'IsUnitDropDown': instance.isUnitDropDown,
      'UnitId': instance.unitId,
      'OpinionId': instance.opinionId,
      'Comment': instance.comment,
      'ReferanceValue': instance.referanceValue,
      'Techonology': instance.techonology,
      'MachineUnitName': instance.machineUnitName,
      'CreatedDate': instance.createdDate,
      'OpinionText': instance.opinionText,
      'IsOpinionDropDown': instance.isOpinionDropDown,
      'MachineId': instance.machineId,
      'SerialNo': instance.serialNo,
      'Machine': instance.machine,
      'Opinion': instance.opinion,
      'ItemWiseValue': instance.itemWiseValue,
      'LabTemplateDesignComment': instance.labTemplateDesignComment,
      'IsComment': instance.isComment,
      'TenantId': instance.tenantId,
      'Tenant': instance.tenant,
      'Id': instance.id,
      'Active': instance.active,
      'UserId': instance.userId,
      'HasErrors': instance.hasErrors,
      'ErrorCount': instance.errorCount,
      'NoErrors': instance.noErrors,
      'selectedIcon': instance.selectedIcon,
      'activePosition': instance.activePosition,
      'IsBold': instance.isBold,
      'BoldImage': instance.boldImage,
      'IsReferanceColumn': instance.isReferanceColumn,
      'IsTechonologyColumn': instance.isTechonologyColumn,
      'PatientServiceId': instance.patientServiceId,
    };