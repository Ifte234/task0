
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class FormSubmitButton extends StatelessWidget {
  final String submitText;
  final VoidCallback ontap;

  const FormSubmitButton({
    Key? key,
    required this.submitText,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.066,
        decoration: BoxDecoration(
            color: Colors.deepPurple.shade400,
            borderRadius: BorderRadius.circular(12)),
        child: Text(
          submitText,
          style: TextStyle(fontSize: MySizes.textLarge, color: Colors.white),
        ),
      ),
    );
  }
}
