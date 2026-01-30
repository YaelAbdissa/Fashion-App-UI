// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/product_model.dart';
import '../widgets/home_screen_widgets.dart';
import 'detail_screen.dart';

class SearchScreen extends StatefulWidget {
  final List<ProductModel> products;
  const SearchScreen({
    super.key,
    required this.products,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isClicked = false;
  String categoryName = "";
  String selectedCategory = 'all';

  @override
  Widget build(BuildContext context) {
    final productsByCategory =
        getProoductsByCategory(selectedCategory, widget.products);
    print("productsByCategory ${productsByCategory.length}");
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(34),
                      border: Border.all(color: Color(0xffEBF2F4))),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "search...",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withValues(alpha: 0.7),
                        ),
                        border: InputBorder.none,
                        suffixIcon:
                            Image.asset("assets/icons/icon_search.png")),
                  ),
                ))
              ],
            ),
          ),
          SizedBox(
            height: isClicked ? 0 : 15,
          ),
          //  collections
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isClicked
                    ? SizedBox()
                    : Text(
                        "Collection",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                isClicked ? SizedBox() : SizedBox(height: 20),
                isClicked
                    ? SizedBox()
                    : SizedBox(
                        height: 126 + 126 + 160,
                        child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: productCategories.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 1.45),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isClicked = true;
                                    categoryName =
                                        productCategories[index].name;
                                    selectedCategory =
                                        productCategories[index].id;
                                  });
                                },
                                child: Container(
                                  // margin: EdgeInsets.all(20),
                                  height: 126,
                                  padding: EdgeInsets.only(left: 22),
                                  decoration: BoxDecoration(
                                      color: Color(0xffEBF2F4),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          productCategories[index].iconPath),
                                      SizedBox(height: 29),
                                      Text(productCategories[index].name),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                SizedBox(
                  height: isClicked ? 0 : 20,
                ),
                isClicked
                    ? SizedBox()
                    : Text(
                        "Collaboration",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                isClicked
                    ? SizedBox()
                    : SizedBox(
                        height: 20,
                      ),
                isClicked
                    ? SizedBox()
                    : Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 277,
                              width: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                // color: Colors.brown,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Stack(
                                  children: [
                                    MasonryGridView.count(
                                        itemCount: 2,
                                        crossAxisCount: 2,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            height: 277,
                                            width: 190,
                                            decoration: BoxDecoration(
                                              color: Colors.brown,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/image${index + 1}.png'),
                                                fit: BoxFit.cover,
                                                // alignment: index == 1
                                                //     ? Alignment.bottomCenter
                                                //     : index == 3
                                                //         ? Alignment.topCenter
                                                //         : Alignment.center,
                                              ),
                                            ),
                                            // margin: EdgeInsets.all(8),
                                            // child: ,
                                          );
                                        }),
                                    Padding(
                                      padding: const EdgeInsets.all(17.0),
                                      child: Text(
                                        "Elegance x Zuma",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 277,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Stack(
                                  children: [
                                    MasonryGridView.count(
                                        itemCount: 2,
                                        crossAxisCount: 2,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            height: 277,
                                            width: 190,
                                            decoration: BoxDecoration(
                                              color: Colors.brown,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/image${index + 1}.png'),
                                                fit: BoxFit.cover,
                                                // alignment: index == 1
                                                //     ? Alignment.bottomCenter
                                                //     : index == 3
                                                //         ? Alignment.topCenter
                                                //         : Alignment.center,
                                              ),
                                            ),
                                            // margin: EdgeInsets.all(8),
                                            // child: ,
                                          );
                                        }),
                                    Padding(
                                      padding: const EdgeInsets.all(17.0),
                                      child: Text(
                                        "Elegance x Donna",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                isClicked
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                categoryName,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffEBF2F4),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isClicked = false;
                                      categoryName = "";
                                      selectedCategory = 'all';
                                    });
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 16),
                          GridView.count(
                            // padding: EdgeInsets.symmetric(horizontal: 10),
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.678,
                            children: List.generate(
                                selectedCategory == "all"
                                    ? widget.products.length
                                    : productsByCategory.length, (index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        product: widget.products[index],
                                      ),
                                    ),
                                  );
                                },
                                child: extraTshirtWidget(
                                    index: index,
                                    product: selectedCategory == "all"
                                        ? widget.products[index]
                                        : productsByCategory[index]),
                              );
                            }),
                          ),
                        ],
                      )
                    : SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }
}
