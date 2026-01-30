import 'dart:ui';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../utils/constants.dart';

import '../widgets/core_widgets.dart';
import 'core_screens.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  final bool justSignedUp;
  const HomeScreen({super.key, this.justSignedUp = false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool justSignedUp = true;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  String selectedCategory = "all";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder<List<ProductModel>>(
        future: loadProducts(),
        builder: (context, snapShot) {
          final products = snapShot.data ?? [];
          final productsByCategory =
              getProoductsByCategory(selectedCategory, products);
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchScreen(
                                products: products,
                              ),
                            ),
                          );
                        },
                        child: Image.asset("assets/icons/icon_search.png"),
                      ),
                    ),
                  ],
                ),
                body: ListView(
                  physics: widget.justSignedUp && justSignedUp
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
                      child: ListView.builder(
                        itemCount: productCategories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(
                                left: index == 0 ? 18 : 9,
                                right: index == productCategories.length - 1
                                    ? 18
                                    : 9),
                            child: categoriesWidget(
                              isSelected: productCategories[index].id ==
                                      selectedCategory
                                  ? true
                                  : false,
                              category: productCategories[index],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.589,
                      child: Stack(
                        children: [
                          Positioned(
                            top: size.height * 0.183,
                            left: 55,
                            right: 55,
                            child: Container(
                              height: size.height * 0.399,
                              width: size.width,
                              padding: EdgeInsets.symmetric(horizontal: 55),
                              decoration: BoxDecoration(
                                color: Color(0xffEBF2F4),
                                // color: Colors.amber,
                                borderRadius: BorderRadius.circular(37),
                              ),
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.109,
                            left: 30,
                            right: 30,
                            child: Container(
                              height: size.height * 0.460,
                              width: size.width,
                              padding: EdgeInsets.symmetric(horizontal: 32),
                              decoration: BoxDecoration(
                                color: Color(0xffCFE1E7),
                                // color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(37),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 14,
                            right: 14,
                            top: 16,
                            child: SizedBox(
                              height: size.height * 0.539,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(37),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/images/image5.png',
                                        ),
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
                                              height: 40,
                                              // width: 40,
                                              child: iconDisplayWidget(
                                                  iconData: Icons.favorite),
                                            ),
                                            SizedBox(width: 6),
                                            FrostedEffectWidget(
                                              height: 40,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 17, vertical: 8),
                                              child: priceDisplayWidget(
                                                price: "240",
                                              ),
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
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.678,
                      children: List.generate(
                          selectedCategory == "all"
                              ? products.length
                              : productsByCategory.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => DetailScreen(
                            //       product: products[index],
                            //     ),
                            //   ),
                            // );
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  product: products[index],
                                ),
                              ),
                            );
                          },
                          child: extraTshirtWidget(
                              index: index,
                              product: selectedCategory == "all"
                                  ? products[index]
                                  : productsByCategory[index]),
                        );
                      }),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: TitleWidget(
                        title: "Collaboration",
                        style: headingTitleTextStyle,
                      ),
                    ),
                    SizedBox(height: 10),
                    collaborationWidget(size: size),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              widget.justSignedUp && justSignedUp
                  // true
                  ? Positioned(
                      // top: _currentPage == 1 ? 150 : 130,
                      // bottom: _currentPage == 1 ? 170 : 140,
                      top: 130,
                      bottom: 140,
                      left: 10,
                      right: 10,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Container(
                          height: size.height * 0.575,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(37),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 22, left: 22, right: 22),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      height: 4,
                                      decoration: BoxDecoration(
                                          color: Color(_currentPage == 1
                                              ? 0xffEBF2F4
                                              : 0xff3AA2ED),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    )),
                                    SizedBox(width: 8),
                                    Expanded(
                                        child: Container(
                                      height: 4,
                                      decoration: BoxDecoration(
                                          color: Color(_currentPage == 1
                                              ? 0xff3AA2ED
                                              : 0xffEBF2F4),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    )),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "${_currentPage == 1 ? "2" : "1"}/2",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Expanded(
                                child: PageView(
                                  controller: _pageController,
                                  onPageChanged: (int page) {
                                    setState(() {
                                      _currentPage = page;
                                    });
                                  },
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          "Complete your profile photo",
                                          style: appBarTextStyle,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: size.height * 0.129,
                                          height: size.height * 0.129,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(26),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/image_profile.png"),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              height: 107,
                                              width: 107,
                                              decoration: BoxDecoration(
                                                color: Color(0xffEBF2F4),
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
                                                    "assets/icons/icon_camera_black.png",
                                                    height: 30,
                                                    width: 30,
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    "Camera",
                                                    style: TextStyle(
                                                      color: Colors.black,
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
                                                color: Color(0xffEBF2F4),
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
                                                    "assets/icons/icon_gallery_black.png",
                                                    height: 30,
                                                    width: 30,
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    "Gallery",
                                                    style: TextStyle(
                                                      color: Colors.black,
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
                                                color: Color(0xffEBF2F4),
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
                                                    "assets/icons/icon_avatar_black.png",
                                                    height: 30,
                                                    width: 30,
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    "Avatar",
                                                    style: TextStyle(
                                                      color: Colors.black,
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
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 22),
                                          child: MainButtonWidget(
                                            onPressed: () {
                                              _pageController.nextPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.easeInOut,
                                              );
                                            },
                                            buttonText: "Next",
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Image.asset(
                                          "assets/icons/icon_add_location.png",
                                          height: 44,
                                          width: 44,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Complete your address",
                                          style: appBarTextStyle,
                                        ),
                                        SizedBox(
                                          height: 14,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 22),
                                          child: Text(
                                            "To process orders and delivery quickly and accurately, please complete your address information.",
                                            style: normalTextTextStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 35,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 22,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: MainButtonWidget(
                                                    buttonStyle: ElevatedButton
                                                        .styleFrom(
                                                      minimumSize: Size(
                                                          double.infinity, 61),
                                                      backgroundColor:
                                                          Color(0xffDDDDDD),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        justSignedUp = false;
                                                      });
                                                    },
                                                    buttonText: "Skip"),
                                              ),
                                              SizedBox(width: 12),
                                              Expanded(
                                                child: MainButtonWidget(
                                                  buttonStyle:
                                                      ElevatedButton.styleFrom(
                                                    minimumSize: Size(
                                                        double.infinity, 61),
                                                    backgroundColor:
                                                        Color(0xff3AA2ED),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                  buttonText: "Add Address",
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                        // Add content for the second page here
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          );
        });
  }

  Widget categoriesWidget(
      {required bool isSelected, required ProductCategory category}) {
    return GestureDetector(
      onTap: () => {
        setState(() {
          selectedCategory = category.id;
        })
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Color(0xffEBF2F4),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            category.name,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
