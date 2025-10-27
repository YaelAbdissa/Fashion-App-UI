import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatelessWidget {
  final String imagePath;
  final double height;
  const BackgroundImageWidget({
    super.key,
    required this.imagePath,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
        width: double.infinity,
        height: height,
      ),
    );
  }
}
