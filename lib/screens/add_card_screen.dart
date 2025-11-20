import 'package:flutter/material.dart';

import '../widgets/core_widgets.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController accountNumberTextController =
      TextEditingController();
  final bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Add new card',
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
          SizedBox(height: 10),
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
                  height: size.height * 0.17,
                  width: size.width * 0.44,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color(0xff3AA2ED),
                      width: 3,
                    ),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/icon_group.png",
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Master card",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => WhislistScreen(),
                  //   ),
                  // );
                },
                child: Container(
                  height: size.height * 0.17,
                  width: size.width * 0.44,
                  decoration: BoxDecoration(
                    color: Color(0xffEBF2F4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/icon_paypal.png",
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Paypal",
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
          SizedBox(height: 10),
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
                  height: size.height * 0.17,
                  width: size.width * 0.44,
                  decoration: BoxDecoration(
                    color: Color(0xffEBF2F4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/icon_american_express.png", width: 25,
                        // height: 25,
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Amex",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          // color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => WhislistScreen(),
                  //   ),
                  // );
                },
                child: Container(
                  height: size.height * 0.17,
                  width: size.width * 0.44,
                  decoration: BoxDecoration(
                    color: Color(0xffEBF2F4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/icon_cc_visa.png",
                        width: 25,
                        // height: 25,
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Visa",
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
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Account number"),
                SizedBox(
                  height: 10,
                ),
                TextFormFieldWidget(
                  hintText: '8392 3732 6372',
                  controller: accountNumberTextController,
                  isBackgroundWhite: true,
                  suffixIcon: Image.asset(
                    "assets/icons/icon_credit_card.png",
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Expiration date"),
                          SizedBox(height: 6),
                          TextFormFieldWidget(
                            hintText: '12 /40',
                            controller: accountNumberTextController,
                            isBackgroundWhite: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CVV"),
                          SizedBox(height: 6),
                          TextFormFieldWidget(
                            hintText: '244',
                            controller: accountNumberTextController,
                            isBackgroundWhite: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text("Card holder"),
                SizedBox(height: 6),
                TextFormFieldWidget(
                  hintText: 'Julian Silva',
                  controller: accountNumberTextController,
                  isBackgroundWhite: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
