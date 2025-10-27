import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedEffectWidget extends StatelessWidget {
  final Widget child;
  const FrostedEffectWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 8.0,
          sigmaY: 8.0,
        ),
        child: child,
      ),
    );
  }
}
