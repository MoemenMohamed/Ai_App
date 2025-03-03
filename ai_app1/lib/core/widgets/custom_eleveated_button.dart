import 'package:flutter/material.dart';

class CustomeElevatedButton extends StatelessWidget {
  CustomeElevatedButton(
      {super.key, required this.onPressed, required this.child, this.style});
  final void Function()? onPressed;
  final Widget? child;
  ButtonStyle? style;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, style: style, child: child);
  }
}
