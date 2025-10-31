class ProductModel {
  String productName;
  ProductCategories categories;
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
      categories: ProductCategories.values.firstWhere(
        (e) => e.name == json['categories'],
      ),
      price: json['price'],
      productDescription: json['productDescription'],
      productImage: json['productImage'],
    );
  }
}

enum ProductCategories {
  hoodie,
  sweater,
  tshirt,
  hat,
  jacket,
}
