// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/services.dart';

class ProductModel {
  String productId;
  String productName;
  String categories;
  double price;
  String productDescription;
  String productImage;
  List<Map<String, String>> size;
  ProductModel({
    required this.productId,
    required this.productName,
    required this.categories,
    required this.price,
    required this.productDescription,
    required this.productImage,
    required this.size,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json["productId"],
      productName: json['productName'],
      categories: json["categories"],
      price: json['price'],
      productDescription: json['productDescription'],
      productImage: json['productImage'],
      size: (json['size'] as List).map((e) {
        return Map<String, String>.from(e);
      }).toList(),
    );
  }
}

Future<List<ProductModel>> loadProducts() async {
  final String response =
      await rootBundle.loadString('assets/json/products.json');
  final data = json.decode(response) as List<dynamic>;
  return data.map((item) => ProductModel.fromJson(item)).toList();
}

class ProductCategory {
  final String id;
  final String name;
  final String iconPath; // optional: could use Flutter icon instead

  const ProductCategory({
    required this.id,
    required this.name,
    required this.iconPath,
  });
}

ProductCategory getCategoryById(String id) {
  return productCategories.firstWhere(
    (cat) => cat.id == id,
    orElse: () => productCategories.first,
  );
}

List<ProductCategory> productCategories = [
  ProductCategory(
    id: 'all',
    name: 'All',
    iconPath: 'assets/icons/all.png',
  ),
  ProductCategory(
    id: 'hoodie',
    name: 'Hoodie',
    iconPath: 'assets/icons/hoodie.png',
  ),
  ProductCategory(
    id: 'sweater',
    name: 'Sweater',
    iconPath: 'assets/icons/sweater.png',
  ),
  ProductCategory(
    id: 'tshirt',
    name: 'T-Shirt',
    iconPath: 'assets/icons/tshirt.png',
  ),
  ProductCategory(
    id: 'hat',
    name: 'Hat',
    iconPath: 'assets/icons/hat.png',
  ),
  ProductCategory(
    id: 'jacket',
    name: 'Jacket',
    iconPath: 'assets/icons/jacket.png',
  ),
];

ProductModel findProductById(String id, List<ProductModel> products) {
  try {
    return products.firstWhere((product) => product.productId == id);
  } catch (e) {
    return ProductModel(
      productId: "p003",
      productName: "Graphic T-Shirt,",
      categories: "tshirt",
      price: 800.00,
      productDescription:
          "Soft cotton t-shirt featuring a trendy graphic design",
      productImage: "assets/images/image3.png",
      size: [
        {"size": "S", "dimension": "36-38 inches"},
        {"size": "M", "dimension": "39-41 inches"},
        {"size": "L", "dimension": "42-44 inches"},
        {"size": "XL", "dimension": "45-47 inches"},
      ],
    ); // if not found
  }
}

List<ProductModel> getProoductsByCategory(
    String category, List<ProductModel> products) {
  return products.where((product) => product.categories == category).toList();
}
