import 'package:hive/hive.dart';
part 'cart_response.g.dart';

@HiveType(typeId: 0)
class CartItem extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  double price;

  @HiveField(3)
  int quantity;

  @HiveField(4)
  String image;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.image,
  });

  // copyWith
  CartItem copyWith({
    String? id,
    String? title,
    double? price,
    int? quantity,
    String? image,
  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json['id'],
    title: json['title'],
    price: json['price'],
    quantity: json['quantity'],
    image: json['image'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'quantity': quantity,
    'image': image,
  };

  @override
  String toString() {
    return 'CartItem{id: $id, title: $title, price: $price, quantity: $quantity, image: $image}';
  }
}
