import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final TextStyle style;

  const TitleWidget({
    super.key,
    required this.title,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style,
    );
  }
}

// class ProductSubTitleWidget extends StatelessWidget {
//   const ProductSubTitleWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       "T-shirt",
//       style: productSubTitleTextStyle,
//     );
//   }
// }
