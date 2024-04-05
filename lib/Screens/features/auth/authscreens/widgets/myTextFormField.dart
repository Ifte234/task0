import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final labelText;
  final hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback onchange;
  final VoidCallback onSaved;
  final bool enable;
  const MyTextField({
    super.key,
    required this.labelText,
    this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.validator,
    required this.onchange,
    required this.onSaved,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable,
      controller: controller,
      validator: validator,
      // onSaved: onSaved,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black12,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          prefixIcon: Icon(prefixIcon),
          labelText: labelText,
          hintText: hintText,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null),
    );
  }
}
