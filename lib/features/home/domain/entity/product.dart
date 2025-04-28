/*
{
    "id": 1,
    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    "price": 109.95,
    "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "rating": {
      "rate": 3.9,
      "count": 120
    }
  },
*/

import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  final double rate;
  final int count;

  const Rating({this.rate = 0.0, this.count = 0});

  copyWith({double? rate, int? count}) {
    return Rating(rate: rate ?? this.rate, count: count ?? this.count);
  }

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate:
          json['rate'] != null
              ? (double.tryParse(json["rate"].toString()) ?? 0.0)
              : 0.0,
      count: json['count'] ?? 0,
    );
  }

  @override
  List<Object?> get props => [rate, count];
}

class Product extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  const Product({
    this.id = 0,
    this.title = "",
    this.price = 0.0,
    this.description = "",
    this.category = "",
    this.image = "",
    this.rating = const Rating(),
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      price:
          json['price'] != null
              ? (double.tryParse(json["price"].toString()) ?? 0.0)
              : 0.0,
      description: json['description'] ?? "",
      category: json['category'] ?? "",
      image: json['image'] ?? "",
      rating: Rating.fromJson(json['rating'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    price,
    description,
    category,
    image,
    rating,
  ];
}

class Products extends Equatable {
  final List<Product> products;

  const Products({this.products = const <Product>[]});

  factory Products.fromJson(List<dynamic> json) {
    return Products(products: json.map((e) => Product.fromJson(e)).toList());
  }

  @override
  List<Object?> get props => [products];

  Products copyWith({List<Product>? products}) {
    return Products(products: products ?? this.products);
  }
}
