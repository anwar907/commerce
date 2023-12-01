// To parse this JSON data, do
//
//     final cartModels = cartModelsFromJson(jsonString);

import 'dart:convert';

List<CartModels> cartModelsFromJson(String str) =>
    List<CartModels>.from(json.decode(str).map((x) => CartModels.fromJson(x)));

String cartModelsToJson(List<CartModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModels {
  final int? id;
  final int? userId;
  final DateTime? date;
  final List<Product>? products;
  final int? v;

  CartModels({
    this.id,
    this.userId,
    this.date,
    this.products,
    this.v,
  });

  factory CartModels.fromJson(Map<String, dynamic> json) => CartModels(
        id: json["id"],
        userId: json["userId"],
        date: DateTime.parse(json["date"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date?.toIso8601String(),
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "__v": v,
      };
}

class Product {
  final int? productId;
  final int? quantity;

  Product({
    this.productId,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}
