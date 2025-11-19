import 'package:fashion_app/widgets/main_button_widget.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                      Image.asset("assets/icons/icon_add_credit_card.png",
                          width: 24, height: 24),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
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
                onTap: () {},
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
          SizedBox(height: 15),
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
          SizedBox(height: 15),
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
              onPressed: () {},
              buttonText: "Buy now",
            ),
          ),
          // SizedBox(height: 10),
        ],
      ),
    );
  }
}
