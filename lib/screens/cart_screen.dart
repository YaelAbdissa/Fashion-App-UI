import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../models/cart_model.dart';
import '../utils/constants.dart';

import '../widgets/core_widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Future<List<Object>> myFuture;

  double deliveryfee = 0.59;

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
    final size = MediaQuery.of(context).size;
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

        double subTotalPrice = calculateTotalPrice(carts, products);
        double totalPrice = subTotalPrice + deliveryfee;

        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 15),
                    child: Text(
                      "Cart",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    margin: EdgeInsets.only(right: 20, top: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29),
                      border: Border.all(
                        color: Color(0xffEBF2F4),
                      ),
                    ),
                    child: Text(
                      "${carts.length} Items",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.59,
                // color: Colors.deepPurpleAccent,
                child: ListView.builder(
                  itemCount: carts.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    ProductModel product =
                        findProductById(carts[index].productId, products);
                    return NewProductWidget(
                      product: product,
                      cart: carts[index],
                    );
                  },
                ),
              ),
              Column(
                children: [
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // SizedBox(
                  //   height: 25,
                  // ),
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
                          title: "\$$deliveryfee",
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
                          title: "\$$subTotalPrice",
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
                          title: "\$$totalPrice",
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
      },
    );
  }
}

class NewProductWidget extends StatefulWidget {
  final ProductModel product;
  final CartModel cart;
  const NewProductWidget({
    super.key,
    required this.product,
    required this.cart,
  });

  @override
  State<NewProductWidget> createState() => _NewProductWidgetState();
}

class _NewProductWidgetState extends State<NewProductWidget> {
  bool isExpanded = false;
  bool isSizeExpanded = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.787,
      margin: const EdgeInsets.only(top: 40, right: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: size.height * 0.465,
            width: size.width * 0.787,
            decoration: BoxDecoration(
              color: Color(0xffFFE7E7),
              borderRadius: BorderRadius.circular(29),
            ),
            padding: EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                // print("Deleted");
              },
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
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
            top: isExpanded ? -50 : 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: productCartWidget(
                product: widget.product,
                cart: widget.cart,
                size: size,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget productCartWidget({
    required ProductModel product,
    required CartModel cart,
    required size,
  }) {
    String categoryName = getCategoryById(product.categories).name;
    return Container(
      height: size.height * 0.465,
      width: size.width * 0.787,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        image: DecorationImage(
          image: AssetImage(product.productImage),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidget(
                      title: product.productName,
                      style: productTitleTextStyle,
                    ),
                    TitleWidget(
                      title: categoryName,
                      style: productSubTitleTextStyle,
                    ),
                  ],
                ),
                Spacer(),
                FrostedEffectWidget(
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                  height: 50,
                  child: priceDisplayWidget(price: product.price.toString()),
                ),
              ],
            ),
          ),
          if (!isSizeExpanded)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FrostedEffectWidget(
                    height: 50,
                    padding: EdgeInsets.only(left: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Size ${cart.size}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
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
                  FrostedEffectWidget(
                      height: 50,
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
                            cart.quantity.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          if (isSizeExpanded)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FrostedEffectWidget(
                    height: 40,
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
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: product.size.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: index == 0 ? 20 : 4,
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
                )
              ],
            )
        ],
      ),
    );
  }
}
