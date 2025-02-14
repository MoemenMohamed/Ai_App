import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final InputBorder? enabledBorder;
  final Function(String)? onChanged;
  final bool obscureText;
  final Widget? prefixIcon;
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.onChanged,
      this.enabledBorder,
      this.prefixIcon,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: enabledBorder,
          prefixIcon: prefixIcon),
    );
  }
}
