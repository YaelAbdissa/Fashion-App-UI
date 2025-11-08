import 'dart:ui';

import 'package:fashion_app/widgets/show_logout_dilaog.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'core_screens.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: appBarTextStyle,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FaqScreen(),
                ),
              );
            },
            child: Image.asset(
              "assets/icons/icon_help.png",
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(height: 10),
          Container(
            alignment: Alignment.center,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  width: size.height * 0.129,
                  height: size.height * 0.129,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    image: DecorationImage(
                      image: AssetImage("assets/images/image_profile.png"),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            )),
                            backgroundColor:
                                Color(0xff48494b).withValues(alpha: 0.5),
                            elevation: 0,
                            context: context,
                            builder: (context) {
                              return ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 8.0,
                                    sigmaY: 8.0,
                                  ),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      // color: Color.fromARGB(255, 52, 53, 56),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: [0.0, 0.19],
                                        colors: [
                                          Colors.black.withValues(alpha: 0.1),
                                          Colors.white.withValues(alpha: 0.5),
                                        ],
                                      ),
                                      backgroundBlendMode: BlendMode.overlay,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50),
                                      ),
                                      // color: Colors.?blue,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 25),
                                        Text(
                                          "Change profile photo",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              height: 107,
                                              width: 107,
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withValues(alpha: 0.15),
                                                borderRadius:
                                                    BorderRadius.circular(26),
                                                border: Border.all(
                                                  color: Colors.white
                                                      .withValues(alpha: 0.25),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/icons/icon_camera.png",
                                                    height: 30,
                                                    width: 30,
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    "Camera",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 107,
                                              width: 107,
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withValues(alpha: 0.15),
                                                borderRadius:
                                                    BorderRadius.circular(26),
                                                border: Border.all(
                                                  color: Colors.white
                                                      .withValues(alpha: 0.25),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/icons/icon_gallery.png",
                                                    height: 30,
                                                    width: 30,
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    "Gallery",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 107,
                                              width: 107,
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withValues(alpha: 0.15),
                                                borderRadius:
                                                    BorderRadius.circular(26),
                                                border: Border.all(
                                                  color: Colors.white
                                                      .withValues(alpha: 0.25),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/icons/icon_avatar.png",
                                                    height: 30,
                                                    width: 30,
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    "Avatar",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Image.asset(
                                              "assets/icons/icon_close.png"),
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      icon: Image.asset(
                        "assets/icons/icon_camera.png",
                        width: 17,
                        height: 17,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Juliana Silva",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          Text(
            "@julianasilva2211@gmail.com",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ManageAccountScreen(),
                    ),
                  );
                },
                child: Container(
                  height: size.height * 0.15,
                  width: size.width * 0.44,
                  decoration: BoxDecoration(
                    color: Color(0xffEBF2F4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/icons/icon_manage_acc.png",
                          width: 24, height: 24),
                      Spacer(),
                      Text(
                        "Manage Account",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WhislistScreen(),
                    ),
                  );
                },
                child: Container(
                  height: size.height * 0.15,
                  width: size.width * 0.44,
                  decoration: BoxDecoration(
                    color: Color(0xffEBF2F4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/icons/icon_heart.png",
                          width: 24, height: 24),
                      Spacer(),
                      Text(
                        "whislist",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DeliveryItemScreen(),
                    ),
                  );
                },
                child: Container(
                  height: size.height * 0.323,
                  width: size.width * 0.44,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/icons/icon_delivery.png",
                          width: 24, height: 24),
                      Spacer(),
                      Text(
                        "3 items",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Being deliver",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OrderHistoryScreen()));
                    },
                    child: Container(
                      height: size.height * 0.223,
                      width: size.width * 0.44,
                      decoration: BoxDecoration(
                        color: Color(0xffEBF2F4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/icons/icon_time_quarter.png",
                              width: 24, height: 24),
                          Spacer(),
                          Text(
                            "12 items",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            "Order history",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      showLogoutDialog(context);
                    },
                    child: Container(
                      height: size.height * 0.089,
                      width: size.width * 0.44,
                      decoration: BoxDecoration(
                        color: Color(0xffFFE7E7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/icons/icon_log_out.png",
                              width: 24, height: 24),
                          SizedBox(width: 10),
                          Text(
                            "Logout",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xffEC4D69),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
