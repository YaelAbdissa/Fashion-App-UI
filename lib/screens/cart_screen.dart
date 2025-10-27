import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/forstes_effect_widget.dart';
import '../widgets/home_screen_widgets.dart';
import '../widgets/main_button_widget.dart';
import '../widgets/product_title_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Cart",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(29),
              border: Border.all(
                  // color: Color(0xffEBF2F4),
                  color: Colors.black),
            ),
            child: Text(
              "3 Items",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 397,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 397,
                  width: 284,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: Colors.amber,
                    border: Border.all(
                        // color: Color(0xffEBF2F4),
                        color: Colors.black),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleWidget(
                                title: "Flex Shirt Cream",
                                style: productTitleTextStyle,
                              ),
                              TitleWidget(
                                title: "T-shirt",
                                style: productSubTitleTextStyle,
                              ),
                            ],
                          ),
                          FrostedEffectWidget(
                            child: priceDisplayWidget(price: "299"),
                          ),
                        ],
                      ),
                      Row(
                        children: [],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 397,
                  width: 284,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    border: Border.all(
                        // color: Color(0xffEBF2F4),
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 397,
                  width: 284,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    border: Border.all(
                        // color: Color(0xffEBF2F4),
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleWidget(
                  title: "Delivery Amount",
                  style: normalTextTextStyle,
                ),
                TitleWidget(
                  title: "\$0.56",
                  style: normalTextTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleWidget(
                  title: "Subtoal",
                  style: normalTextTextStyle,
                ),
                TitleWidget(
                  title: "\$897",
                  style: normalTextTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleWidget(
                  title: "Total amount",
                  style: normalTextTextStyle,
                ),
                TitleWidget(
                  title: "\$898",
                  style: totalPriceTextTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: MainButtonWidget(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => HomeScreen(),
                //   ),
                // );
              },
              buttonText: "Buy now",
            ),
          ),
        ],
      ),
    );
  }
}
