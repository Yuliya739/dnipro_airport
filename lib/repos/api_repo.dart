import 'package:dnipro_airport/clients/api_client.dart';
import 'package:dnipro_airport/exception/api_exception.dart';
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

  Future<String?> test() async {
    try {
      var data = await _api.test();
      return data;
    } on ApiException catch (exc) {
      print(exc.message);
    }
  }
}
