import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/add_address_widget.dart';
import '../widgets/core_widgets.dart';
import 'core_screens.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool isClicked = false;
  bool isOrdered = false;
  int selectedAddress = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => ManageAccountScreen(),
                        //   ),
                        // );
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddCardScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: size.height * 0.3,
                          width: size.width * 0.21,
                          decoration: BoxDecoration(
                            color: Color(0xffEBF2F4),
                            borderRadius: BorderRadius.circular(39),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  "assets/icons/icon_add_credit_card.png",
                                  width: 24,
                                  height: 24),
                              SizedBox(height: 10),
                              Text(
                                "Add card",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => ManageAccountScreen(),
                        //   ),
                        // );
                      },
                      child: Container(
                        height: size.height * 0.3,
                        width: size.width * 0.676,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(37),
                        ),
                        // padding: const EdgeInsets.all(15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons/icon_group.png",
                                  // width: 24, height: 24,
                                ),
                                Spacer(),
                                Text(
                                  "***4522",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white.withValues(alpha: 0.7),
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            Text(
                              "Juliana silva",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Card holder",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.white.withValues(alpha: 0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Text(
                    "Your address",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => ManageAccountScreen(),
                        //   ),
                        // );
                      },
                      child: Container(
                        height: size.height * 0.2,
                        width: size.width * 0.78,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(39),
                          border: Border.all(
                            color: Color(0xffEBF2F4),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pamuruyan, Kec. Cibadak, Kabupaten Sukabumi, Jawa Barat 43351",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              width: 100,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(26),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/icon_home_white.png",
                                    width: 25,
                                    height: 25,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Home",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isClicked = true;
                        });
                      },
                      child: Container(
                        height: size.height * 0.2,
                        width: size.width * 0.13,
                        decoration: BoxDecoration(
                          color: Color(0xffEBF2F4),
                          borderRadius: BorderRadius.circular(37),
                        ),
                        // padding: const EdgeInsets.all(15),
                        // padding:
                        //     const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                        child: Image.asset(
                          "assets/icons/icon_arrows_repeat.png",
                          // width: 24, height: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    // alignment: Alignment.center,
                    height: size.height * 0.12,
                    width: size.width * 0.93,
                    decoration: BoxDecoration(
                      color: Color(0xffd0e9fb),
                      borderRadius: BorderRadius.circular(34),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/icons/icon_shield_check.png",
                          width: 24,
                          height: 24,
                        ),
                        Text(
                          "We adhere entirely to the data security \nstandards of the payment card industry.",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xff3AA2ED),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery amount",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "\$0.56",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "\$897",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total amount",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "\$898",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MainButtonWidget(
                    onPressed: () {
                      setState(() {
                        isOrdered = true;
                      });
                    },
                    buttonText: "Buy now",
                  ),
                ),
                // SizedBox(height: 10),
              ],
            ),
          ),
          isClicked
              ? Positioned(
                  top: 140,
                  // bottom: 220,
                  left: 14,
                  right: 14,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(37),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          Text(
                            "Your adress",
                            style: someTextStyle.copyWith(
                              color: Color(0xff000000).withValues(alpha: 0.7),
                            ),
                          ),
                          SizedBox(height: 14),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedAddress = 0;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 18),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(34),
                                border: Border.all(
                                  color: Color(
                                    selectedAddress == 0
                                        ? 0xff3AA2ED
                                        : 0xffEBF2F4,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AddAddressWidget(),
                                  ),
                                  selectedAddress == 0
                                      ? Image.asset(
                                          "assets/icons/icon_check.png")
                                      : Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(31),
                                              color: Color(
                                                0xffEBF2F4,
                                              )),
                                        )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedAddress = 1;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 18),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(34),
                                  border: Border.all(
                                      color: Color(selectedAddress == 1
                                          ? 0xff3AA2ED
                                          : 0xffEBF2F4))),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AddAddressWidget(),
                                  ),
                                  selectedAddress == 1
                                      ? Image.asset(
                                          "assets/icons/icon_check.png")
                                      : Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(31),
                                              color: Color(
                                                0xffEBF2F4,
                                              )),
                                        )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          MainButtonWidget(
                            onPressed: () {
                              setState(() {
                                isClicked = false;
                              });
                            },
                            buttonText: "Confirm",
                          ),
                          SizedBox(
                            height: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          isOrdered
              ? Positioned(
                  top: 220,
                  // bottom: 220,
                  left: 14,
                  right: 14,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 32,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(37),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(37),
                              border: Border.all(
                                color: Color(0XFF3AA2ED),
                              ),
                            ),
                            child: Image.asset(
                                "assets/icons/icon_confirm_payment.png"),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            "Your payment successfully",
                            style: appBarTextStyle,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Your order is being processed and will be shipped soon.",
                            style: normalTextTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: MainButtonWidget(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeNavScreen(),
                                      ),
                                    );
                                  },
                                  buttonText: "Back to home",
                                  buttonStyle: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xffDDDDDD),
                                    minimumSize: Size(double.infinity, 61),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: MainButtonWidget(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            OrderHistoryScreen(),
                                      ),
                                    );
                                  },
                                  buttonText: "View Order",
                                  buttonStyle: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff3AA2ED),
                                    minimumSize: Size(double.infinity, 61),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
