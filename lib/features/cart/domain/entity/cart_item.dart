import 'package:equatable/equatable.dart';
import 'package:task_products/features/cart/data/response/cart_response.dart';

class CartData extends Equatable {
  final List<CartItem> items;

  const CartData({this.items = const []});

  @override
  List<Object?> get props => [items];

  // coptWith
  CartData copyWith({List<CartItem>? items}) {
    return CartData(items: items ?? this.items);
  }

  //fromJson
  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
