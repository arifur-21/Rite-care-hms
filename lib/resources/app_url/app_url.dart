
class AppUrl{
   static const String base_url = 'https://mobileapp.rite-hms.com';
   static const String loginApi = '$base_url/auth/token';

   static const String registerPatientApi = 'https://mobileapp.rite-hms.com/Patient/CreatePatient';
   static const String registerUpdateApi = 'https://mobileapp.rite-hms.com/Patient/UpdatePatient';
   static const String getPatientByidUrl = 'https://mobileapp.rite-hms.com/Patient/GetPatientById?id=775898&oldId=false';
   static const String getPatientByIBaseUrl = 'https://mobileapp.rite-hms.com/Patient/GetPatientById?id=775898&oldId=false';
   static const String getGenderApi = '//mobileapp.rite-hms.com/Gender/GetAllAsync';
   static const String patientPrefixurl = "https://mobileapp.rite-hms.com/Patient/GetPatientPrefix";
   static const String patientStatusurl ='https://mobileapp.rite-hms.com/Patient/GetPatientStatus';
   static const String patientRelationurl ='https://mobileapp.rite-hms.com/Patient/GetAllRelationshipList';



}