
class AppUrl{
   static const String base_url = 'https://mobileapp.rite-hms.com';
   static const String loginApi = '$base_url/auth/token';

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


}

