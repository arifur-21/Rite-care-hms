
class AppUrl{
   static const String base_url = 'https://mobileapp.rite-hms.com';
   static const String loginApi = '$base_url/auth/token';
   static const String forgotPassword = '$base_url/Login/SendForgotPasswordURL';

   static const String registerPatientApi = '$base_url/Patient/CreatePatient';
   static const String registerUpdateApi = 'https://mobileapp.rite-hms.com/Patient/UpdatePatient';
   static const String getPatientByidUrl = '$base_url/Patient/GetPatientById?id=775898&oldId=false';
   static const String getPatientByIBaseUrl = '$base_url/Patient/GetPatientById?id=775898&oldId=false';
   static const String getGenderApi = 'https://mobileapp.rite-hms.com/Gender/GetAllAsync';
   static const String patientPrefixurl = "$base_url/Patient/GetPatientPrefix";
   static const String patientStatusurl ='$base_url/Patient/GetPatientStatus';
   static const String patientRelationurl ='$base_url/Patient/GetAllRelationshipList';
   static const String patientListUrl ='$base_url/Patient/GetPatientList?pageNumber=1&pageSize=25&startDate=undefined&endDate=undefined&unitId=null&bloodGroupId=null';
   static const String patientSummeryListUrl ='$base_url/Item/GetPatientInvoicebyMedicalType?id=775925&statusid=0&medicalTypeID=62&DateStart=2023-03-04&DateEnd=2023-04-09&pageNumber=1&pageSize=25&invoiceId=undefined&sampleId=null&itemId=undefined';
   static const String userProfile =  '$base_url/Login/GetLoggedinUser';
   static const String otScheduleUrl =  '$base_url/OT/GetOperationScheduleList?pageNumber=1&pageSize=150&startDate=2023-04-18&endDate=2023-04-18&patientId=0&isMobileApp=true';
   static const String surgeryNoteUrl =  'https://mobileapp.rite-hms.com/OT/SaveSurgeryNote';
   static const String labTestListUrl =  'https://mobileapp.rite-hms.com/Item/GetLabItemsByMedicalType?medicalTypeID=62&pageNumber=1&pageSize=25&categoryId=null&searchTerm=&allData=undefined&ItemId=0&isLabItemSerialNo=false';
   static const String getsurgeryNoteUrl =  '$base_url/OT/GetSurgeryNotes?surgeryId=50420';
   static const String getAlLabStatusUrl =  '$base_url/Item/GetAllLabStatus';
   static const String getBloodGroutUrl =  '$base_url/Blood/GetAllAsync';
   static const String getGenderUrl =  '$base_url/Gender/GetAllAsync';
   static const String surgeryNoteDeleteUrl =  '$base_url/OT/DeleteSurgeryNote';
   static const String operationScheduleStatusUrl =  '$base_url/OT/SaveOperationSchedule';
   static const String sampleListFilterStatusUrl =  '$base_url/Item/GetAllLabStatus';
   static const String labTestListFilterStatusUrl =  '$base_url/Item/loadLabTestCategories?medicalTypeID=62';



}

