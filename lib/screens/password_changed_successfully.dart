import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/core_widgets.dart';

class PasswordChangedSuccessfullyScreen extends StatelessWidget {
  const PasswordChangedSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff1E1E1E),
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImageWidget(
              imagePath: 'assets/images/blur_background.png',
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: 20,
              left: 10,
              right: 10,
              child: Image.asset("assets/images/logo.png"),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.49,
              left: 0,
              right: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: SingleChildScrollView(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 50),

                              Image.asset(
                                "assets/icons/icon_pcs.png",
                              ),
                              Text(
                                "Password Changed\nSuccessfully!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Your password has been updated successfully.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.7),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              // Add more widgets for the signup form here

                              // SizedBox(height: 0),
                              Spacer(),
                              MainButtonWidget(
                                onPressed: () {},
                                buttonText: "Confirm",
                              ),
                              SizedBox(height: 30),
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
