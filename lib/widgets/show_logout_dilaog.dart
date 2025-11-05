import 'package:fashion_app/screens/login_screen.dart';
import 'package:fashion_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (builder) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            "Are you sure you want to logout?",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
          content: const Text(
            'You will be logged out of your account and returned to the login screen.',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainButtonWidget(
                  buttonText: "Cancel",
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  buttonStyle: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffDDDDDD),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.34, 61),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                MainButtonWidget(
                  buttonText: "Yes",
                  buttonStyle: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffEC4D69),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.34, 61),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        );
      });
}
