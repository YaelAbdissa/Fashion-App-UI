// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/services.dart';

import 'product_model.dart';

class CartModel {
  String productId;
  String size;
  String sizeInDim;
  int quantity;
  double price;
  CartModel({
    required this.productId,
    required this.size,
    required this.sizeInDim,
    required this.quantity,
    required this.price,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productId: json["productId"],
      size: json["size"],
      sizeInDim: json["sizeInDim"],
      quantity: json["quantity"],
      price: json["price"],
    );
  }
}

Future<List<CartModel>> loadCart() async {
  final data = await rootBundle.loadString('assets/json/carts.json');
  final List<dynamic> jsonList = json.decode(data);
  return jsonList.map((e) => CartModel.fromJson(e)).toList();
}

double calculateTotalPrice(List<CartModel> cart, List<ProductModel> products) {
  double total = 0;

  for (var item in cart) {
    final product = products.firstWhere(
      (p) => p.productId == item.productId,
      orElse: () => throw Exception('Product not found: ${item.productId}'),
    );

    total += product.price * item.quantity;
  }

  return total;
}
