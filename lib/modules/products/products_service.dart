import 'package:dio/dio.dart';

class ProductsService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "http://192.168.1.101:8000"));

  Future<List<dynamic>> getProducts() async {
    final response = await _dio.get("/products");
    return response.data;
  }

  Future<Map<String, dynamic>> createProduct(String name, double price) async {
    final response = await _dio.post(
      "/products",
      data: {"name": name, "price": price},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> updateProduct(
    int id,
    String name,
    double price,
  ) async {
    final response = await _dio.put(
      "/products/$id",
      data: {"name": name, "price": price},
    );
    return response.data;
  }

  Future<void> deleteProduct(int id) async {
    await _dio.delete("/products/$id");
  }
}
