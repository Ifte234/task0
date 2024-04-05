
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../auth/authscreens/signUpScreen.dart';
import '../widgets/MycustomAlertDialoge.dart';

void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return MyAlertDialoge(text: "Do you want to logout?", ontap: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.remove('username');
            pref.remove('email');
            pref.remove('password');
            var checkUser = pref.containsKey('username');
            debugPrint('CheckUser ' + checkUser.toString());
           
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },);
    },
  );
}

