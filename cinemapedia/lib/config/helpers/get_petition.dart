import 'package:dio/dio.dart';

class GetPetition {
  final _dio = Dio();

  Future<Map<String, dynamic>> getInfo(String idUser) async {
    final response = await _dio.get("https://api.escuelajs.co/api/v1/users/$idUser");
    return response.data;
  }
}