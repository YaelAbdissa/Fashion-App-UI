import 'package:flutter/material.dart';

class MainButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;
  const MainButtonWidget({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.textStyle,
    this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle ??
          ElevatedButton.styleFrom(
            backgroundColor: Color(0xff3AA2ED),
            minimumSize: Size(MediaQuery.of(context).size.width, 61),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
      onPressed: () => onPressed(),
      child: Text(
        buttonText,
        style: textStyle ??
            TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }
}
