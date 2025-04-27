
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


abstract interface class AppPreferences {


  //save url for api
}

class AppPreferencesImpl implements AppPreferences {
  
  final FlutterSecureStorage _secureStorage;

  AppPreferencesImpl(
      {
      required FlutterSecureStorage secureStorage})
      
       : _secureStorage = secureStorage;
  
  
}
