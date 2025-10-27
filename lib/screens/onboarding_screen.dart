import 'package:flutter/material.dart';

import '../widgets/background_image_widget.dart';
import '../widgets/main_button_widget.dart';
import 'signup_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImageWidget(
            imagePath: 'assets/Image.png',
            height: MediaQuery.of(context).size.height * 0.78,
          ),
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Find the Latest\nCollection',
                  style: TextStyle(
                    fontFamily: 'Golos',
                    letterSpacing: -0.5,
                    height: 1.2,
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Explore the latest fashion collections designed to reflect modern elegance and style',
                  style: TextStyle(
                    fontSize: 13,
                    // color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 22,
            right: 22,
            child: MainButtonWidget(
              buttonText: 'Get Started',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupScreen(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
