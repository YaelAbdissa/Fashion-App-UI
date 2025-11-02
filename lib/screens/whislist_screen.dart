import 'dart:ui';

import 'package:fashion_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../models/whislist_model.dart';
import '../utils/constants.dart';

class WhislistScreen extends StatefulWidget {
  const WhislistScreen({super.key});

  @override
  State<WhislistScreen> createState() => _WhislistScreenState();
}

class _WhislistScreenState extends State<WhislistScreen> {
  List<int> selectedIndexes = [];
  bool _isSheetOpen = false;
  PersistentBottomSheetController? _controller;
  late Future<List<Object>> myFuture;

  @override
  void initState() {
    super.initState();
    myFuture = Future.wait([loadWhisList(), loadProducts()]);
  }

  void reloadData() {
    setState(() {
      myFuture = Future.wait([loadWhisList(), loadProducts()]);
    });
  }

  void toggleSelection(index) {
    setState(() {
      if (selectedIndexes.contains(index)) {
        selectedIndexes.remove(index);
      } else {
        selectedIndexes.add(index);
      }
    });
  }

  void selectAll(List<WhislistModel> whislistItemsList) {
    setState(() {
      selectedIndexes =
          List.generate(whislistItemsList.length, (index) => index);
    });
  }

  void deselectAll() {
    setState(() {
      selectedIndexes = [];
    });
  }

  void _toggleBottomSheet(BuildContext context, int selectedItems,
      List<WhislistModel> whislistItemsList) {
    if (_isSheetOpen && selectedIndexes.isEmpty) {
      _controller?.close();
      setState(() {
        _isSheetOpen = false;
      });
    } else {
      _controller = showBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        )),
        backgroundColor: Color(0xff48494b).withValues(alpha: 0.5),
        elevation: 0,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setModalState) {
            return ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 8.0,
                  sigmaY: 8.0,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 52, 53, 56),

                    backgroundBlendMode: BlendMode.overlay,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    // color: Colors.?blue,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: ,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff3AA2ED),
                            ),
                            child: Center(
                              child: Text(
                                "${selectedIndexes.length}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          FrostedEffectWidget(
                            border: Border.all(
                              color: Colors.white38,
                            ),
                            borderRadius: BorderRadius.circular(36),
                            height: 61,
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 26),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (whislistItemsList.length ==
                                        selectedIndexes.length) {
                                      setModalState(() {
                                        deselectAll();
                                      });
                                    } else {
                                      setModalState(() {
                                        selectAll(whislistItemsList);
                                      });
                                    }
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: whislistItemsList.length ==
                                              selectedIndexes.length
                                          ? Color(0xff3AA2ED)
                                          : Colors.white.withValues(alpha: 0.2),
                                    ),
                                    child: (whislistItemsList.length ==
                                            selectedIndexes.length)
                                        ? Image.asset(
                                            "assets/icons/icon_check.png")
                                        : null,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  whislistItemsList.length ==
                                          selectedIndexes.length
                                      ? "De-select"
                                      : "Select All",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 61,
                            height: 61,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffFFE7E7),
                            ),
                            child: Image.asset("assets/icons/icon_trash.png"),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 61,
                            height: 61,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withValues(alpha: 0.15),
                              border: Border.all(
                                color: Colors.white38,
                              ),
                            ),
                            child: Image.asset(
                              "assets/icons/icon_add_to_cart.png",
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          _controller?.close();
                          setState(() {
                            _isSheetOpen = false;
                          });
                        },
                        child: Image.asset("assets/icons/icon_close.png"),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        },
      );
      setState(() {
        _isSheetOpen = true;
      });

      // Reset the flag when the sheet closes
      _controller!.closed.then((_) {
        setState(() {
          _isSheetOpen = false;
        });
      });
    }
  }

  String selectedCategory = "all";
  @override
  Widget build(BuildContext context) {
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
          "Whislist",
          style: appBarTextStyle,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: myFuture,
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapShot.hasError) {
              return Center(child: Text("Error: ${snapShot.error}"));
            } else if (!snapShot.hasData || snapShot.data!.isEmpty) {
              return const Center(child: Text("No products found"));
            }
            final products = snapShot.data![1] as List<ProductModel>;
            final whislists = snapShot.data![0] as List<WhislistModel>;

            final productsFromWhislist =
                getProductModelintersectionWhishilist(whislists, products);
            final productsByCategory =
                getProoductsByCategory(selectedCategory, productsFromWhislist);

            return ListView(
              children: [
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
                            right:
                                index == productCategories.length - 1 ? 18 : 9),
                        child: categoriesWidget(
                          isSelected:
                              productCategories[index].id == selectedCategory
                                  ? true
                                  : false,
                          category: productCategories[index],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 25),
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
                          ? whislists.length
                          : productsByCategory.length, (index) {
                    final isSelected = selectedIndexes.contains(index);
                    ProductModel product = findProductById(
                        selectedCategory == "all"
                            ? whislists[index].productId
                            : productsByCategory[index].productId,
                        selectedCategory == "all"
                            ? products
                            : productsByCategory);

                    return GestureDetector(
                      onLongPress: () {
                        toggleSelection(index);
                        _toggleBottomSheet(
                            context, selectedIndexes.length, whislists);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        padding: EdgeInsets.all(isSelected ? 3 : 0),
                        decoration: BoxDecoration(
                          color: isSelected ? Color(0xff3AA2ED) : null,
                          borderRadius: BorderRadius.circular(30),
                          // border: Border.all(
                          //   color: isSelected
                          //       ? Color(0xff3AA2ED)
                          //       : Colors.transparent,
                          //   width: 3,
                          // ),
                        ),
                        child: extraTshirtWidget(
                            index: index,
                            product: product,
                            isSelected: isSelected),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 25),
              ],
            );
          }),
    );
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
