import 'dart:core';
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SP {


  Future<void> saveData({required String name,required String password,required String email}) async {
    // _submitted = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('username', name);
    pref.setString('password', password);
    pref.setString('email', email);
  }

  
void showStoredData() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? username = pref.getString('username');
  String? email = pref.getString('email');
  String? password = pref.getString('password');

  print('Username: $username');
  print('Email: $email');
  print('Password: $password');
}

}
