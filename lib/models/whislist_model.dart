// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/services.dart';

class WhislistModel {
  String productId;
  String id;
  String dateAdded;
  String note;
  int priority;
  bool isPurchased;

  WhislistModel({
    required this.productId,
    required this.id,
    required this.dateAdded,
    required this.note,
    required this.priority,
    required this.isPurchased,
  });

  factory WhislistModel.fromJson(Map<String, dynamic> json) {
    return WhislistModel(
        productId: json["productId"],
        id: json["id"],
        dateAdded: json["dateAdded"],
        isPurchased: json["isPurchased"],
        note: json["note"] ?? "",
        priority: json["priority"]);
  }
}

Future<List<WhislistModel>> loadWhisList() async {
  final data = await rootBundle.loadString('assets/json/whislist.json');
  final List<dynamic> jsonList = json.decode(data);
  return jsonList.map((e) => WhislistModel.fromJson(e)).toList();
}
