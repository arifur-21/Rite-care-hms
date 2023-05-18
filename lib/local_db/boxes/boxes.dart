import 'package:hive/hive.dart';

import '../../model/local_db/search_user_model.dart';

class Boxes{
  
  static Box<SearchUserModel> getData()=> Hive.box<SearchUserModel>('search_user');
}