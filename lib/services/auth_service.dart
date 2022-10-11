

import 'package:shared_preferences/shared_preferences.dart';

class AuthService{

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginUser(String userName) async {
    try {
      SharedPreferences sharedPref = await _prefs;
      sharedPref.setString('userName', userName);
    }catch(e){
      print(e);
    }
  }

  Future<void> logoutUser() async {
    SharedPreferences sharedPref = await _prefs;
    sharedPref.clear();
  }

  Future<String?> getUserName() async {
    SharedPreferences sharedPref = await _prefs;
    return sharedPref.getString('userName') ?? 'DefaultValue';
  }
}