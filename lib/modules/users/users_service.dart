import 'package:dio/dio.dart';

class UsersService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "http://192.168.1.101:8000"));

  Future<List<dynamic>> getUsers() async {
    final response = await _dio.get("/users");
    return response.data;
  }

  Future<Map<String, dynamic>> createUser(String name, String email) async {
    final response = await _dio.post(
      "/users",
      data: {"name": name, "email": email},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> updateUser(
    int id,
    String name,
    String email,
  ) async {
    final response = await _dio.put(
      "/users/$id",
      data: {"name": name, "email": email},
    );
    return response.data;
  }

  Future<void> deleteUser(int id) async {
    await _dio.delete("/users/$id");
  }
}
