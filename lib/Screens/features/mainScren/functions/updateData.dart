import 'package:shared_preferences/shared_preferences.dart';

Future<void> updateData({required String name,
required String password,required String email}) async {
  
  

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('username', name);
    pref.setString('password', password);
    pref.setString('email', email);
  }

