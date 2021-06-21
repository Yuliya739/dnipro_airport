import 'package:dio/dio.dart';
import 'package:dnipro_airport/exception/api_exception.dart';

class ApiClient {
  final _dio = Dio();

  ApiClient() {
    _dio.options
      ..baseUrl = _apiRoute
      ..connectTimeout = 5000
      ..receiveTimeout = 5000
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      };
  }

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

  Future<String> order({
    required String flightId,
    required String lastName,
    required String firstName,
    required DateTime dateOfBirth,
    required String numPassport,
    required String email,
    required DateTime validUntil,
  }) async {
    final response = await _dio.post(
      '$_apiRoute/orders',
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
      data: {
        'flight_id': flightId,
        'last_name': lastName,
        'first_name': firstName,
        'date_of_birthday': dateOfBirth.toIso8601String(),
        'num_passport': numPassport,
        'email': email,
        'valid_until': validUntil.toIso8601String(),
      },
    );

    if (response.statusCode == 200) {
      return response.data!;
    }

    throw ApiException('Error while proceeding order');
  }

  Future<String> addAirline({
    required String name,
    required String country,
    required String iso2,
    required String iso3,
    required String iata,
    required String icao,
    required String carriageClass,
    required String callCenter,
  }) async {
    final response = await _dio.post(
      '$_apiRoute/airline',
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
      data: {
        'airline_name': name,
        'country': country,
        'iso31661_alpha2': iso2,
        'iso31661_alpha3': iso3,
        'iata': iata,
        'icao': icao,
        'carriage_class': carriageClass,
        'call_center': callCenter,
      },
    );

    if (response.statusCode == 200) {
      return response.data!;
    }

    throw ApiException('Error while proceeding order');
  }

  Future<List> airlines() async {
    final response = await _dio.get('$_apiRoute/airline');

    if (response.statusCode == 200) {
      return response.data;
    }

    throw ApiException('Error');
  }

  Future<String> addPlane({
    required String name,
    required int kolSeats,
    required String airlineId,
  }) async {
    final response = await _dio.post(
      '$_apiRoute/plane',
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
      data: {
        'airline_id': airlineId,
        'plane_name': name,
        'kol_seats': kolSeats,
      },
    );

    if (response.statusCode == 200) {
      return response.data!;
    }

    throw ApiException('Error');
  }

  Future<List> planes() async {
    final response = await _dio.get('$_apiRoute/plane');

    if (response.statusCode == 200) {
      return response.data;
    }

    throw ApiException('Error');
  }
}
