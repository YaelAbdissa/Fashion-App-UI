import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/core_widgets.dart';

class ManageAccountScreen extends StatelessWidget {
  const ManageAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordTextController = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          "Manage Account",
          style: appBarTextStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            FormLableWidget(
              lable: "Username",
              isBackgroundWhite: true,
            ),
            SizedBox(height: 4),
            TextFormFieldWidget(
              hintText: 'Juiliana Silva',
              controller: passwordTextController,
              isBackgroundWhite: true,
            ),
            SizedBox(height: 12),
            FormLableWidget(
              lable: "Email",
              isBackgroundWhite: true,
            ),
            SizedBox(height: 4),
            TextFormFieldWidget(
              hintText: 'juilianasilva2211@gmail.com',
              controller: passwordTextController,
              isBackgroundWhite: true,
            ),
            SizedBox(height: 12),
            FormLableWidget(
              lable: "Phone number",
              isBackgroundWhite: true,
            ),
            SizedBox(height: 4),
            TextFormPhoneField(
              isBackgroundWhite: true,
            ),
            SizedBox(height: 12),
            FormLableWidget(
              lable: "Password",
              isBackgroundWhite: true,
            ),
            SizedBox(height: 4),
            TextFormFieldWidget(
              suffixIcon: Image.asset(
                "assets/icons/icon_black_see.png",
              ),
              hintText: '••••••••••••',
              controller: passwordTextController,
              isObscured: true,
              isBackgroundWhite: true,
            ),
            SizedBox(height: 12),
            FormLableWidget(
              lable: "Your Address",
              isBackgroundWhite: true,
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Container(
                  height: size.height * 0.2,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    color: Color(0xffEBF2F4),
                    borderRadius: BorderRadius.circular(34),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/icon_address.png"),
                      SizedBox(height: 14),
                      Text(
                        "Add address",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          // height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: size.height * 0.2,
                    // width: size.width * 0.32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xffEBF2F4),
                      ),
                      borderRadius: BorderRadius.circular(34),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pamuruyan, Kec. Cibadak, Kabupaten Sukabumi, Jawa Barat 43351",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            // height: 1.3,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 38,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(34),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/icon_home_white.png",
                                width: 25,
                                height: 25,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Home",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Spacer(),
            MainButtonWidget(
              onPressed: () {},
              buttonText: "Save changes",
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
