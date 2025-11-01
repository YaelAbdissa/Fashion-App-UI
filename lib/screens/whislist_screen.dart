import 'package:fashion_app/widgets/home_screen_widgets.dart';
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
                    ProductModel product = findProductById(
                        selectedCategory == "all"
                            ? whislists[index].productId
                            : productsByCategory[index].productId,
                        selectedCategory == "all"
                            ? products
                            : productsByCategory);

                    return extraTshirtWidget(
                      index: index,
                      product: product,
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
