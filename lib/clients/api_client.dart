import 'package:dio/dio.dart';
import 'package:dnipro_airport/exception/api_exception.dart';

class ApiClient {
  final _dio = Dio();

  static const _apiRoute = 'http://localhost:5000';

  Future<List> departuresToday() async {
    // var response = await _dio.get(
    //   '$_apiRoute/maintenance/version',
    // );

    final response = await _dio.get('$_apiRoute/departure/today');
    if (response.statusCode == 200) {
      return response.data;
    }
    throw ApiException('Error while trying test api');
  }
}
