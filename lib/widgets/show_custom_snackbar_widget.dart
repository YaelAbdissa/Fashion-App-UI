import 'package:flutter/material.dart';

import 'core_widgets.dart';

void showCustomSnackBar(BuildContext context, String message, String imagePath,
    Function onViewPressed) {
  OverlayEntry entry = OverlayEntry(
    builder: (context) => Positioned(
      top: 30,
      left: 14,
      right: 14,
      child: Material(
        color: Colors.transparent,
        child: FrostedEffectWidget(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 100,
          bgColor: Colors.white.withValues(alpha: 0.25),
          borderRadius: BorderRadius.circular(37),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                // width: 24,
                // height: 24,
              ),
              SizedBox(width: 14),
              Text(
                message,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  onViewPressed();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  "View",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(entry);

  Future.delayed(Duration(seconds: 2)).then((_) => entry.remove());
}
