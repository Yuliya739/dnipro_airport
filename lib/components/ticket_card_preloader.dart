import 'package:dnipro_airport/models/airline_model.dart';
import 'package:dnipro_airport/models/flight_model.dart';
import 'package:dnipro_airport/models/transplantation_model.dart';
import 'package:dnipro_airport/repos/api_repo.dart';
import 'package:flutter/material.dart';

class TicketCardPreloader extends StatelessWidget {
  final FlightModel flight;
  final Widget Function(
      BuildContext, FlightModel, AirlineModel, TransplantationModel?) builder;
  final Widget Function(BuildContext)? loadBuilder;
  final Widget Function(BuildContext, Object?)? errorBuilder;
  const TicketCardPreloader({
    Key? key,
    required this.flight,
    required this.builder,
    this.loadBuilder,
    this.errorBuilder,
  }) : super(key: key);

  Future<List> _loadData(BuildContext context) async {
    final airline = ApiRepo.of(context).airlineByPlane(flight.planeId);
    final transplantation =
        ApiRepo.of(context).transplantation(flight.flightId!);

    return await Future.wait([airline, transplantation]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _loadData(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return builder(context, flight, snapshot.data![0], snapshot.data![1]);
        }
        if (snapshot.hasError) {
          return errorBuilder != null
              ? errorBuilder!(context, snapshot.error)
              : Container();
        }

        return loadBuilder != null ? loadBuilder!(context) : Container();
      },
    );
  }
}
