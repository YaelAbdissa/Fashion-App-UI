import 'dart:math';

import '../widgets/core_widgets.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class DetailScreen extends StatelessWidget {
  final ProductModel product;
  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black, // background to enhance reflection
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    // Main image
                    Image.asset(
                      product.productImage, // Replace with your image
                      fit: BoxFit.cover,
                      width: size.width,
                      height: size.height * 0.612,
                    ),

                    // Reflection
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.white,
                        ],
                      ).createShader(bounds),
                      blendMode: BlendMode.dstOver,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationX(pi),
                        child: Image.asset(
                          product.productImage,
                          fit: BoxFit.cover,
                          width: size.width,
                          height: size.height * 0.388,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Indicators

              // const SizedBox(height: 40),
            ],
          ),
          //  const SizedBox(height: 20),
          Positioned(
            bottom: size.height * 0.519,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.circle, size: 10, color: Colors.white70),
                SizedBox(width: 6),
                Icon(Icons.circle, size: 10, color: Colors.white),
                SizedBox(width: 6),
                Icon(Icons.circle, size: 10, color: Colors.white70),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: FrostedEffectWidget(
                    height: 44,
                    width: 44,
                    child: Icon(Icons.arrow_back_ios_new_rounded,
                        color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showCustomSnackBar(
                      context,
                      "Just added to your whishlist",
                      "assets/icons/icon_heart_check.png",
                      () {
                        print("added to whishlist pressed");
                      },
                    );
                  },
                  child: FrostedEffectWidget(
                    height: 44,
                    width: 44,
                    bgColor: Colors.white,
                    child: Icon(Icons.favorite, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.5,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  gradient: LinearGradient(
                    stops: [0.0, 0.15, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 158, 158, 158)
                          .withValues(alpha: 0.9), // top
                      Color.fromARGB(255, 119, 118, 118)
                          .withValues(alpha: 0.98), // middle
                      Colors.black, // bottom
                    ],
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.productName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              getCategoryById(product.categories).name,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.7),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          height: 40,
                          padding:
                              EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                          child: priceDisplayWidget(
                            price: product.price.toString(),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        product.productDescription,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.7),
                          fontSize: 12,
                        ),
                        maxLines: 3,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Size",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Lenght x Chest x Shoulder",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: product.size.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: index == 0 ? 15 : 4,
                              right: index == product.size.length - 1 ? 20 : 4),
                          child: FrostedEffectWidget(
                            height: 90,
                            padding: EdgeInsets.symmetric(horizontal: 8.5),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    product.size[index]['size'].toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    product.size[index]['dimension'].toString(),
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
                        );
                      },
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showCustomSnackBar(
                              context,
                              "Just added to your cart",
                              "assets/icons/icon_shopping_cart_check.png",
                              () {
                                print("added to cart pressed");
                              },
                            );
                          },
                          child: Container(
                            width: 61,
                            height: 61,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white38,
                              ),
                            ),
                            child: Image.asset(
                              "assets/icons/icon_add_to_cart_black.png",
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff3AA2ED),
                              minimumSize: Size(double.infinity, 61),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Buy now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
