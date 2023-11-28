
// To parse this JSON data, do
//
//     final listProductModels = listProductModelsFromJson(jsonString);

import 'dart:convert';

ListProductModels listProductModelsFromJson(String str) => ListProductModels.fromJson(json.decode(str));

String listProductModelsToJson(ListProductModels data) => json.encode(data.toJson());

class ListProductModels {
    final List<Product>? products;
    final int? total;
    final int? skip;
    final int? limit;

    ListProductModels({
        this.products,
        this.total,
        this.skip,
        this.limit,
    });

    factory ListProductModels.fromJson(Map<String, dynamic> json) => ListProductModels(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Product {
    final int? id;
    final String? title;
    final String? description;
    final int? price;
    final double? discountPercentage;
    final double? rating;
    final int? stock;
    final String? brand;
    final String? category;
    final String? thumbnail;
    final List<String>? images;

    Product({
        this.id,
        this.title,
        this.description,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.brand,
        this.category,
        this.thumbnail,
        this.images,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"].toDouble(),
        rating: json["rating"].toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images": List<dynamic>.from(images!.map((x) => x)),
    };
}
