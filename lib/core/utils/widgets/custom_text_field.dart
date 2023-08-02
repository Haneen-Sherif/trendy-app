import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.title,
      this.icon,
      required this.controller,
      required this.validator,
      required this.keyboardType,
      this.obscureText = false,
      required this.textInputAction,
      this.onFieldSubmitted});

  final String title;
  final Widget? icon;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  final bool? obscureText;
  final TextInputAction textInputAction;
  void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted!,
      textInputAction: textInputAction,
      obscureText: obscureText!,
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(labelText: title, suffixIcon: icon),
    );
  }
}
