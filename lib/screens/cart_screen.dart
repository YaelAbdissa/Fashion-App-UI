import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/forstes_effect_widget.dart';
import '../widgets/home_screen_widgets.dart';
import '../widgets/main_button_widget.dart';
import '../widgets/product_title_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isExpanded = false;
  bool isSizeExpanded = false;
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
      body: Stack(
        children: [
          ListView(
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
                    GestureDetector(
                      onTap: () {
                        print("object");
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                        print("object $isExpanded");
                      },
                      child: Stack(
                        children: [
                          if (isExpanded)
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 397,
                                width: 284,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFE7E7),
                                  borderRadius: BorderRadius.circular(27),
                                ),
                                alignment: Alignment.bottomCenter,
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/icons/icon_trash.png"),
                                    SizedBox(width: 4),
                                    Text(
                                      "Delete",
                                      style: TextStyle(
                                          color: Color(0xffEC4D69),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          productCartWidget(
                              imagePath: 'assets/images/image5.png'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    productCartWidget(imagePath: 'assets/images/image2.png'),
                    SizedBox(
                      width: 20,
                    ),
                    productCartWidget(imagePath: 'assets/images/image2.png'),
                    SizedBox(
                      width: 20,
                    ),
                    productCartWidget(imagePath: 'assets/images/image3.png'),
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
        ],
      ),
    );
  }

  Widget productCartWidget({required String imagePath}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isExpanded ? 320 : 397,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          if (!isSizeExpanded)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FrostedEffectWidget(
                  child: Container(
                    padding: EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.17),
                      borderRadius: BorderRadius.circular(26),
                      border: Border.all(
                        width: 1,
                        color: Colors.white.withValues(alpha: 0.17),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Size L",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isSizeExpanded = true;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                FrostedEffectWidget(
                    child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.17),
                    borderRadius: BorderRadius.circular(26),
                    border: Border.all(
                      width: 1,
                      color: Colors.white.withValues(alpha: 0.17),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "1",
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          if (isSizeExpanded)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FrostedEffectWidget(
                  child: Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.17),
                      borderRadius: BorderRadius.circular(26),
                      border: Border.all(
                        width: 1,
                        color: Colors.white.withValues(alpha: 0.17),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isSizeExpanded = false;
                        });
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FrostedEffectWidget(
                      child: Container(
                        height: 90,
                        padding: EdgeInsets.symmetric(horizontal: 8.5),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.17),
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(
                            width: 1,
                            color: Colors.white.withValues(alpha: 0.17),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "M",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "70 x 48 x 38",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    FrostedEffectWidget(
                      child: Container(
                        height: 90,
                        padding: EdgeInsets.symmetric(horizontal: 8.5),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.17),
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(
                            width: 1,
                            color: Colors.white.withValues(alpha: 0.17),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "L",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "71 x 55 x 61",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    FrostedEffectWidget(
                      child: Container(
                        height: 90,
                        padding: EdgeInsets.symmetric(horizontal: 8.5),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.17),
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(
                            width: 1,
                            color: Colors.white.withValues(alpha: 0.17),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "XL",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "73 x 57x 64",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
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
