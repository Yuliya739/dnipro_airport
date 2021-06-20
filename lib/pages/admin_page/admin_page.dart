import 'package:dnipro_airport/pages/admin_page/flight/flight_part.dart';
import 'package:flutter/material.dart';

import 'airline/airline_part.dart';
import 'plane/plane_part.dart';

class AdminPage extends StatelessWidget {
  static String get route => '/admin';
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Theme(
        data: ThemeData.light(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AirlinePart(),
                    SizedBox(height: 50),
                    PlanePart(),
                    SizedBox(height: 50),
                    FlightPart(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
