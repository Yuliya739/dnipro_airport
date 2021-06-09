import 'package:dio/dio.dart';
import 'package:dnipro_airport/exception/api_exception.dart';

class ApiClient {
  final _dio = Dio();

  static const _apiRoute = 'http://localhost:5000';

  Future<List> departuresToday() async {
    final response = await _dio.get('$_apiRoute/departure/today');
    if (response.statusCode == 200) {
      return response.data;
    }
    throw ApiException(
        "Error while receiving data from server about today's departures");
  }

  Future<List> search(String destination, DateTime date) async {
    final response = await _dio.get(
      '$_apiRoute/flight/search',
      queryParameters: {
        'date': date.toIso8601String(),
        'destination': destination,
      },
    );

    if (response.statusCode == 200) {
      return response.data;
    }

    throw ApiException(
        'Error while searching data at server about destinations '
        '$destination at ${date.toIso8601String()}');
  }

  Future<Map<String, dynamic>> airlineByPlane(String planeId) async {
    final response = await _dio.get(
      '$_apiRoute/airline',
      queryParameters: {'plane_id': planeId},
    );

    if (response.statusCode == 200) {
      return response.data;
    }

    throw ApiException('Error while searching data at server about airline '
        'by planeId = $planeId');
  }

  Future<Map<String, dynamic>?> transplantation(String flightId) async {
    final response = await _dio.get(
      '$_apiRoute/trans',
      queryParameters: {'flight_id': flightId},
    );

    if (response.statusCode == 201) {
      return null;
    }

    if (response.statusCode == 200) {
      return response.data;
    }

    throw ApiException('Error while searching data at server about'
        ' transplantation by flightId = $flightId');
  }
}
