import 'package:dio/dio.dart';
import 'package:flutter_lab_ac/models/products.dart';


class DioClient {
  final _dio = Dio(BaseOptions(baseUrl: "https://dummyjson.com"));

  Future<ProductsModel?> getProducts() async {
    final res = await _dio.get("/products");
    if (res.statusCode == 200) {
      return ProductsModel.fromJson(res.data);
    }
    return null;
  }

  Future<ProductsModel?> searchProduct(String text) async {
    final res = await _dio.get("/products/search?q=$text");
    if (res.statusCode == 200) {
      return ProductsModel.fromJson(res.data);
    }
    return null;
  }
}
