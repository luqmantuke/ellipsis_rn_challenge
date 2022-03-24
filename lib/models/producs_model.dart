import 'dart:convert';

class ProductsModel {
  String productName;
  String productDescription;
  String productImage;
  double price;
  ProductsModel({
    required this.productName,
    required this.productDescription,
    required this.productImage,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productDescription': productDescription,
      'productImage': productImage,
      'price': price,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      productName: map['title'] ?? '',
      productDescription: map['description'] ?? '',
      productImage: map['image'] ??
          'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.fremontgurdwara.org%2Fwp-content%2Fuploads%2F2020%2F06%2Fno-image-icon-2.png&f=1&nofb=1',
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());
}
