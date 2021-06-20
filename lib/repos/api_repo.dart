import 'package:dnipro_airport/clients/api_client.dart';
import 'package:dnipro_airport/models/airline_model.dart';
import 'package:dnipro_airport/models/flight_model.dart';
import 'package:dnipro_airport/models/plane_model.dart';
import 'package:dnipro_airport/models/transplantation_model.dart';
import 'package:flutter/material.dart';

class ApiRepo extends InheritedWidget {
  final _api = ApiClient();
  ApiRepo({Key? key, required this.child}) : super(key: key, child: child);

  final Widget child;

  static ApiRepo of(BuildContext context) {
    final repo = context.dependOnInheritedWidgetOfExactType<ApiRepo>();
    assert(repo != null, 'No ApiRepo found in context');
    return repo!;
  }

  @override
  bool updateShouldNotify(ApiRepo oldWidget) {
    return false;
  }

  Future<List<FlightModel>> departuresToday() async {
    var data = await _api.departuresToday();
    return data.map((e) => FlightModel.fromJson(e)).toList();
  }

  Future<List<FlightModel>> search(String destination, DateTime date) async {
    final data = await _api.search(destination, date);
    return data.map((e) => FlightModel.fromJson(e)).toList();
  }

  Future<AirlineModel> airlineByPlane(String planeId) async {
    final data = await _api.airlineByPlane(planeId);
    return AirlineModel.fromJson(data);
  }

  Future<TransplantationModel?> transplantation(String flightId) async {
    final data = await _api.transplantation(flightId);
    if (data == null) {
      return null;
    }
    return TransplantationModel.fromJson(data);
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
    final data = await _api.order(
      flightId: flightId,
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      numPassport: numPassport,
      email: email,
      validUntil: validUntil,
    );
    return data;
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
    final data = await _api.addAirline(
      name: name,
      country: country,
      iso2: iso2,
      iso3: iso3,
      iata: iata,
      icao: icao,
      carriageClass: carriageClass,
      callCenter: callCenter,
    );
    return data;
  }

  Future<List<AirlineModel>> airlines() async {
    final data = await _api.airlines();
    return data.map((e) => AirlineModel.fromJson(e)).toList();
  }

  Future<String> addPlane(PlaneModel plane) async {
    final data = await _api.addPlane(
        name: plane.planeName,
        kolSeats: plane.kolSeats,
        airlineId: plane.airlineId);

    return data;
  }
}
