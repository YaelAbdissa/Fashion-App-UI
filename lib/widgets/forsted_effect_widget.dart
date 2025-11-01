import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedEffectWidget extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry borderRadius;
  final BoxBorder? border;
  const FrostedEffectWidget(
      {super.key,
      required this.child,
      this.height,
      this.padding,
      this.width,
      this.borderRadius = const BorderRadius.all(Radius.circular(26)),
      this.border});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 8.0,
          sigmaY: 8.0,
        ),
        child: Container(
          height: height,
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.17),
            borderRadius: borderRadius,
            border: border ??
                Border.all(
                  width: 1,
                  color: Colors.white.withOpacity(0.17),
                ),
          ),
          child: child,
        ),
      ),
    );
  }
}
