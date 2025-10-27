import 'dart:ui';
import 'package:fashion_app/utils/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/forstes_effect_widget.dart';
import '../widgets/home_screen_widgets.dart';
import '../widgets/product_title_widget.dart';

class HomeScreen extends StatefulWidget {
  final bool justSignedUp;
  const HomeScreen({super.key, this.justSignedUp = false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Image.asset("assets/icons/logo_black.png"),
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            scrolledUnderElevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/profile.png'),
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 18),
                child: GestureDetector(
                  onTap: () {
                    // Handle notification icon tap
                  },
                  child: Image.asset("assets/icons/icon_search.png"),
                ),
              ),
            ],
          ),
          body: ListView(
            physics: widget.justSignedUp
                ? NeverScrollableScrollPhysics()
                : AlwaysScrollableScrollPhysics(),
            children: [
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: TitleWidget(
                  title: "Collections",
                  style: headingTitleTextStyle,
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 50,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // physics: NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(width: 18),
                    categoriesWidget(isSelected: true, title: "All"),
                    SizedBox(width: 8),
                    categoriesWidget(isSelected: false, title: "Hoodie"),
                    SizedBox(width: 8),
                    categoriesWidget(isSelected: false, title: "Sweater"),
                    SizedBox(width: 8),
                    categoriesWidget(isSelected: false, title: "T-Shirt"),
                    SizedBox(width: 8),
                    categoriesWidget(isSelected: false, title: "Pant"),
                    SizedBox(width: 8),
                    categoriesWidget(isSelected: false, title: "Jacket"),
                    SizedBox(width: 8),
                    categoriesWidget(isSelected: false, title: "All"),
                    SizedBox(width: 8),
                    categoriesWidget(isSelected: false, title: "All"),
                    SizedBox(width: 8),
                    categoriesWidget(isSelected: false, title: "All"),
                    SizedBox(width: 8),
                    categoriesWidget(isSelected: false, title: "All"),
                    SizedBox(width: 8),
                    categoriesWidget(isSelected: false, title: "All"),
                    SizedBox(width: 18),
                  ],
                ),
              ),
              SizedBox(
                height: 500,
                child: Stack(
                  children: [
                    Positioned(
                      top: 150,
                      left: 55,
                      right: 55,
                      child: Container(
                        height: 340,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 55),
                        decoration: BoxDecoration(
                          color: Color(0xffEBF2F4),
                          // color: Colors.amber,
                          borderRadius: BorderRadius.circular(37),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 92,
                      left: 32,
                      right: 32,
                      child: Container(
                        height: 392,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        decoration: BoxDecoration(
                          color: Color(0xffCFE1E7),
                          // color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(37),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        height: 460,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(37),
                        ),
                        margin: EdgeInsets.only(top: 16),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(37),
                                image: DecorationImage(
                                  fit: BoxFit
                                      .fitWidth, // Adjust fit as needed (e.g., BoxFit.fill, BoxFit.contain)
                                  image: AssetImage('assets/images/image5.png'),
                                  // Or:
                                  // image: NetworkImage('https://example.com/your_image.jpg'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  Row(
                                    children: [
                                      FrostedEffectWidget(
                                        child: iconDisplayWidget(
                                            iconData: Icons.favorite),
                                      ),
                                      SizedBox(width: 6),
                                      FrostedEffectWidget(
                                        child: priceDisplayWidget(price: "240"),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: TitleWidget(
                  title: "Elegance T-Shirt",
                  style: headingTitleTextStyle,
                ),
              ),
              SizedBox(height: 15),
              GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 14),
                crossAxisCount: 2,
                shrinkWrap: true, // makes GridView take only needed height
                physics:
                    NeverScrollableScrollPhysics(), // prevents nested scroll conflict
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.678,
                children: List.generate(6, (index) {
                  return extraTshirtWidget(index);
                }),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: TitleWidget(
                  title: "Elegance T-Shirt",
                  style: headingTitleTextStyle,
                ),
              ),
              SizedBox(height: 10),
              collaborationWidget(),
              SizedBox(height: 30),
            ],
          ),
        ),
        widget.justSignedUp
            ? Positioned(
                top: 150,
                bottom: 150,
                left: 10,
                right: 10,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    height: 490,
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.circular(37)),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  Container categoriesWidget(
      {required bool isSelected, required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Color(0xffEBF2F4),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
