import 'package:flutter/material.dart';

import '../models/cart_model.dart';
import '../models/product_model.dart';
import '../utils/constants.dart';

class DeliveryItemScreen extends StatefulWidget {
  const DeliveryItemScreen({super.key});

  @override
  State<DeliveryItemScreen> createState() => _DeliveryItemScreenState();
}

class _DeliveryItemScreenState extends State<DeliveryItemScreen> {
  late Future<List<Object>> myFuture;

  @override
  void initState() {
    super.initState();
    myFuture = Future.wait([loadCart(), loadProducts()]);
  }

  void reloadData() {
    setState(() {
      myFuture = Future.wait([loadCart(), loadProducts()]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
        final carts = snapShot.data![0] as List<CartModel>;
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
              "Delivery item",
              style: appBarTextStyle,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  itemCount: carts.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    ProductModel product =
                        findProductById(carts[index].productId, products);
                    String categoryName =
                        getCategoryById(product.categories).name;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 85,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              image: DecorationImage(
                                  image: AssetImage(product.productImage),
                                  fit: BoxFit.cover),
                            ),
                            // child: Image.asset(product.productImage),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.productName,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  categoryName,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$${product.price}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${carts[index].quantity}x",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          "Size: ${carts[index].size}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 70,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Color(0xffEBF2F4),
                            ),
                            child: Image.asset("assets/icons/icon_ballot.png"),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
