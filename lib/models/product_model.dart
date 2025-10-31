import 'dart:convert';

import 'package:flutter/services.dart';

class ProductModel {
  String productName;
  String categories;
  String price;
  String productDescription;
  String productImage;
  ProductModel({
    required this.productName,
    required this.categories,
    required this.price,
    required this.productDescription,
    required this.productImage,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'],
      categories: json["categories"],
      price: json['price'],
      productDescription: json['productDescription'],
      productImage: json['productImage'],
    );
  }
}

Future<List<ProductModel>> loadProducts() async {
  final String response = await rootBundle.loadString('assets/products.json');
  final data = json.decode(response) as List<dynamic>;
  print("data $data");
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
