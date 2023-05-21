
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ritecare_hms/local_db/search_user_model.dart';
import 'package:ritecare_hms/resources/routes/routes_name.dart';
import 'package:ritecare_hms/screens/home_screen.dart';
import 'package:ritecare_hms/screens/languages/languages_screen.dart';
import 'package:ritecare_hms/screens/login_screen/sign_in_screen.dart';
import 'package:ritecare_hms/screens/login_screen/slider_screen/slider_screen.dart';
import 'package:ritecare_hms/screens/report_screen/report_screen.dart';


void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(SearchUserModelAdapter());

  await Hive.openBox<SearchUserModel>('search_user');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      fallbackLocale: Locale('en', 'US'),
      locale: Locale('bn', 'BD'),


      home: SliderScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
