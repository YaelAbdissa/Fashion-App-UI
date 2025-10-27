import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../utils/constants.dart';
import 'forstes_effect_widget.dart';
import 'product_title_widget.dart';

Widget priceDisplayWidget({required String price}) {
  return Container(
    height: 50,
    padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.17),
      borderRadius: BorderRadius.circular(26),
      border: Border.all(
        width: 1,
        color: Colors.white.withValues(alpha: 0.17),
      ),
    ),
    child: Center(
      child: Text(
        "\$$price",
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.7),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget iconDisplayWidget({required IconData iconData}) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.17),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          width: 1,
          color: Colors.white.withValues(alpha: 0.17),
        )),
    child: IconButton(
      onPressed: () {},
      icon: Icon(
        iconData,
        color: Colors.white.withValues(alpha: 0.5),
      ),
    ),
  );
}

Widget collaborationWidget() {
  return Stack(
    children: [
      Container(
        margin: const EdgeInsets.all(14.0),
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.brown,
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
                height: (index % 2 == 0) ? 230 : 50, // variable height
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

Container extraTshirtWidget(int index) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 26),
    height: 260,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fitHeight,
        image: AssetImage('assets/images/image${index + 1}.png'),
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FrostedEffectWidget(
              child: priceDisplayWidget(price: "299"),
            ),
            SizedBox(width: 6),
            FrostedEffectWidget(
              child: iconDisplayWidget(iconData: Icons.favorite),
            ),
          ],
        )
      ],
    ),
  );
}
