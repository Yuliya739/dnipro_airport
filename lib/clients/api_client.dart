import 'package:dio/dio.dart';
import 'package:dnipro_airport/exception/api_exception.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final _dio = Dio();

  final _apiRoute = 'https://api.wheelkeep.bike';

  Future<String?> test() async {
    var response = await _dio.post('$_apiRoute/version');
    if (response.statusCode == 201) {
      return response.data;
    }
    throw ApiException('Error while trying test api');
  }
}
