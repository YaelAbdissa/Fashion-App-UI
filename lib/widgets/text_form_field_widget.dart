import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final bool isObscured;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool isBackgroundWhite;

  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.isObscured = false,
    this.isBackgroundWhite = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: isBackgroundWhite ? Colors.black : Colors.white,
          fontSize: 14,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: isBackgroundWhite ? Color(0xffEBF2F4) : Colors.white38,
          ),
        ),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isBackgroundWhite
                ? Color(0xffEBF2F4)
                : Colors.white.withValues(alpha: 0.4),
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      style: TextStyle(
        color: isBackgroundWhite ? Colors.black : Colors.white,
      ),
    );
  }
}
