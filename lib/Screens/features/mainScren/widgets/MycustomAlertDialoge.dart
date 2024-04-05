
import 'package:flutter/material.dart';

class MyAlertDialoge extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final String? btn1;
  final String? btn2;
  const MyAlertDialoge({
    super.key,
    required this.text,
    required this.ontap, this.btn1 = 'Yes', this.btn2 = 'No',
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: ontap,
          child: Text(
            btn1!,
            style: TextStyle(color: Colors.deepPurple),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text(
            btn2!,
            style: TextStyle(color: Colors.deepPurple),
          ),
        ),
      ],
    );
  }
}
