import 'package:shared_preferences/shared_preferences.dart';

class LocalStrorageService {
  static LocalStrorageService  _instance;
  static SharedPreferences   _prefereces;

  static Future<LocalStrorageService>  getInstance() async{
    if(_instance == null){
      _instance = LocalStrorageService();
    }

    if(_prefereces == null) {
      _prefereces = await SharedPreferences.getInstance();
    }

    return _instance;
  }

}