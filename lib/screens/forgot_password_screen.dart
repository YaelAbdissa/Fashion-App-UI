// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/core_widgets.dart';
import 'core_screens.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordTextController = TextEditingController();
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
                      filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
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
                          // color: Colors.black.withValues(alpha: 0.1),
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
                                  'Change Password',
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
                                  "Choose a strong and unique password. Passwords must have a minimum of 8 characters, including uppercase letters, lowercase letters, numbers, and symbols.",
                                  style: TextStyle(
                                    fontFamily: 'Golos',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 34),

                              // Add more widgets for the signup form here

                              Text(
                                'Current Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(height: 6),
                              TextFormFieldWidget(
                                suffixIcon: Image.asset(
                                  "assets/icons/see_icon.png",
                                ),
                                hintText: '••••••••••••',
                                controller: passwordTextController,
                                isObscured: true,
                              ),
                              SizedBox(height: 12),
                              Text(
                                'New Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(height: 6),
                              TextFormFieldWidget(
                                suffixIcon: Image.asset(
                                  "assets/icons/see_icon.png",
                                ),
                                hintText: '••••••••••••',
                                controller: passwordTextController,
                                isObscured: true,
                              ),

                              SizedBox(height: 12),

                              Text(
                                'Repeat new password',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(height: 6),
                              TextFormFieldWidget(
                                suffixIcon: Image.asset(
                                  "assets/icons/see_icon.png",
                                ),
                                hintText: '••••••••••••',
                                controller: passwordTextController,
                                isObscured: true,
                              ),

                              Spacer(),
                              MainButtonWidget(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PasswordChangedSuccessfullyScreen(),
                                    ),
                                  );
                                },
                                buttonText: "Change Password",
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
