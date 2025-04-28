import 'package:dio/dio.dart';
import 'package:task_products/features/home/domain/entity/product.dart';

extension ProductMapper on Response {
  Products toProductHome() {
    if (this.data == null) {
      return Products(products: []);
    } else {
      // response of data return list of products without key
      List<Product> products = List.from(data.map((e) => Product.fromJson(e)));
      return Products(products: products);
    }
  }
}
