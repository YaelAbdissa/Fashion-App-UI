import 'package:flutter/material.dart';

class FormLableWidget extends StatelessWidget {
  final String lable;
  final bool isBackgroundWhite;
  const FormLableWidget({
    super.key,
    required this.lable,
    this.isBackgroundWhite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      lable,
      style: TextStyle(
        fontSize: 14,
        color: isBackgroundWhite
            ? Colors.black.withValues(alpha: 0.7)
            : Colors.white70,
      ),
    );
  }
}
