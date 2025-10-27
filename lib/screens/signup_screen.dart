import 'dart:ui';

import 'package:fashion_app/widgets/main_button_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/background_image_widget.dart';
import '../widgets/text_form_field_phone_widget.dart';
import 'login_screen.dart';
import 'verify_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff1E1E1E),
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImageWidget(
              imagePath: 'assets/blur_background.png',
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: 20,
              left: 10,
              right: 10,
              child: Image.asset("assets/logo.png"),
            ),
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.87,
                child: SingleChildScrollView(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 14.0, sigmaY: 14.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.815,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.1),
                              Colors.black
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Form(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 22),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Create your account',
                                  style: TextStyle(
                                    fontFamily: 'Golos',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "we've send code to",
                                  style: TextStyle(
                                    fontFamily: 'Golos',
                                    fontSize: 11,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 34),

                              // Add more widgets for the signup form here
                              Text(
                                'Your name',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Juiliana Silva',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 14),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white
                                            .withValues(alpha: 0.4)),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'juilianasilva2211@gmail.com',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 14),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide:
                                        BorderSide(color: Colors.white38),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white
                                            .withValues(alpha: 0.4)),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'Phone number',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),

                              TextFormPhoneField(),
                              SizedBox(height: 12),
                              Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: '••••••••••••',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 14),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide:
                                        BorderSide(color: Colors.white38),
                                  ),
                                  suffixIcon: Image.asset(
                                    "assets/icons/see_icon.png",
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white
                                            .withValues(alpha: 0.4)),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                              Spacer(),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "I have an account?",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.only(
                                          left: 3), // removes default padding
                                      minimumSize: Size(0,
                                          0), // removes minimum size constraints
                                      tapTargetSize: MaterialTapTargetSize
                                          .shrinkWrap, // optional: shrink tap area
                                    ),
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Color(0xff3AA2ED),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              MainButtonWidget(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => VerifyScreen(),
                                    ),
                                  );
                                },
                                buttonText: "Sign up",
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
