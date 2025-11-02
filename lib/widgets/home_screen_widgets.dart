import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/product_model.dart';
import '../utils/constants.dart';
import 'core_widgets.dart';

Widget priceDisplayWidget({required String price}) {
  return Center(
    child: Text(
      "\$$price",
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget iconDisplayWidget({required IconData iconData}) {
  return IconButton(
    onPressed: () {},
    icon: Icon(
      iconData,
      color: Colors.white.withValues(alpha: 0.5),
    ),
  );
}

Widget collaborationWidget({required size}) {
  return Stack(
    children: [
      Container(
        margin: const EdgeInsets.all(14.0),
        height: size.height * 0.32,
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
          child: MasonryGridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2, // number of columns
            // mainAxisSpacing: 8,
            // crossAxisSpacing: 8,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                height: (index % 2 == 0)
                    ? size.height * 0.270
                    : size.height * 0.059, // variable height
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage('assets/images/image${index + 1}.png'),
                      fit: BoxFit.cover,
                      alignment: index == 1
                          ? Alignment.bottomCenter
                          : index == 3
                              ? Alignment.topCenter
                              : Alignment.center),
                ),
              );
            },
          ),
        ),
      ),
      Positioned(
        top: 45,
        left: 30,
        child: TitleWidget(
          title: "Elegance x Zuma",
          style: productTitleTextStyle,
        ),
      )
    ],
  );
}

Widget extraTshirtWidget({
  required int index,
  required ProductModel product,
  bool isSelected = false,
}) {
  return Container(
    // margin: EdgeInsets.all(isSelected ? 4 : 0),
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(product.productImage),
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 10, bottom: 26, top: 26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget(
                    title: product.productName,
                    style: productTitleTextStyle,
                  ),
                  TitleWidget(
                    title: getCategoryById(product.categories).name,
                    style: productSubTitleTextStyle,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FrostedEffectWidget(
                      height: 40,
                      padding:
                          EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                      child:
                          priceDisplayWidget(price: product.price.toString()),
                    ),
                    SizedBox(width: 6),
                    FrostedEffectWidget(
                      height: 40,
                      width: 40,
                      child: iconDisplayWidget(iconData: Icons.favorite),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        if (isSelected)
          Positioned(
            bottom: -10,
            right: 0,
            left: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/icons/icon_check.png",
                // width: 30,
                // height: 30,
              ),
            ),
          )
      ],
    ),
  );
}
