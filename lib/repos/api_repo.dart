import 'package:dnipro_airport/clients/api_client.dart';
import 'package:dnipro_airport/exception/api_exception.dart';
import 'package:dnipro_airport/models/flight_model.dart';
import 'package:flutter/material.dart';

class ApiRepo extends InheritedWidget {
  final _api = ApiClient();
  ApiRepo({Key? key, required this.child}) : super(key: key, child: child);

  final Widget child;

  static ApiRepo of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ApiRepo>()!;
  }

  @override
  bool updateShouldNotify(ApiRepo oldWidget) {
    return true;
  }

  Future<List<FlightModel>?> departuresToday() async {
    try {
      var data = await _api.departuresToday();
      return data.map((e) => FlightModel.fromJson(e)).toList();
    } on ApiException catch (exc) {
      print(exc.message);
    }
  }
}
