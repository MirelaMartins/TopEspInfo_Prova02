import 'package:dio/dio.dart';

class Api {
  final _dio = Dio(BaseOptions(baseUrl: 'http://localhost:4000/api'));

  Future<String?> create(String email, String name, String password) async {
    try {
      final body = {'_id': email, 'name': name, 'password': password};
      final response = await _dio.post('/user/create', data: body);
      return response.data;
    } catch (error) {
      return null;
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      final body = {'_id': email, 'password': password};
      final response = await _dio.post('/user/login', data: body);

      return response.data;
    } catch (error) {
      return null;
    }
  }
}
