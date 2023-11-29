import 'dart:convert';

List<ProductModels> listProductModelsFromJson(String str) =>
    List<ProductModels>.from(
        json.decode(str).map((x) => ProductModels.fromJson(x)));

String listProductModelsToJson(List<ProductModels> data) =>
    json.encode((List<dynamic>.from(data.map((e) => e.toJson()))));

class ProductModels {
  final int? id;
  final String? title, description, image, category;
  final double? price;
  final RatingModels? rating;
  ProductModels(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.category,
      this.price,
      this.rating});

  factory ProductModels.fromJson(Map<String, dynamic> json) => ProductModels(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      category: json['category'],
      rating: json['rating']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'decription': description,
        'image': image,
        'category': category,
        'rating': rating?.toJson()
      };
}

class RatingModels {
  final double? rate;
  final int? cost;

  RatingModels({this.rate, this.cost});

  factory RatingModels.fromJson(Map<String, dynamic> json) =>
      RatingModels(rate: json['rate'], cost: json['cost']);

  Map<String, dynamic> toJson() => {'rate': rate, 'cost': cost};
}
