import 'package:dnipro_airport/models/airline_model.dart';
import 'package:dnipro_airport/models/flight_model.dart';
import 'package:dnipro_airport/models/transplantation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';

class TicketCard extends StatelessWidget {
  final FlightModel flight;
  final AirlineModel airline;
  final TransplantationModel? transplantation;
  final BorderRadius? borderRadius;
  final void Function(String)? onBookPressed;
  TicketCard({
    Key? key,
    required this.flight,
    required this.airline,
    this.transplantation,
    this.borderRadius,
    this.onBookPressed,
  }) : super(key: key) {
    _arrivalTime =
        flight.estimatedTime.add(Duration(minutes: flight.travelTime));
  }

  late final DateTime _arrivalTime;
  final _dateFormat = DateFormat.yMMMMd();
  final _timeFormat = DateFormat.jm();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Colors.black45,
          )
        ],
      ),
      child: Column(
        children: [
          Theme(
            data: ThemeData.dark(),
            child: Builder(builder: (context) {
              return Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(41, 59, 119, 1),
                  borderRadius: borderRadius == null
                      ? null
                      : BorderRadius.only(
                          topLeft: borderRadius!.topLeft,
                          topRight: borderRadius!.bottomRight,
                        ),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 30),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        airline.airlineName,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
          _infoPartBuilder(context),
          Divider(),
          _bottomPartBuilder(context)
        ],
      ),
    );
  }

  Padding _bottomPartBuilder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Spacer(),
          Text(
            'The coast: ',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.black),
          ),
          Text(
            '${flight.coast.toString()} \$',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black),
          ),
          SizedBox(width: 20),
          ElevatedButton(
            onPressed: onBookPressed == null
                ? null
                : () => onBookPressed!(flight.flightId!),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Book now'),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3))),
              backgroundColor:
                  MaterialStateProperty.all(Color.fromRGBO(45, 199, 49, 1)),
            ),
          ),
          SizedBox(width: 30),
        ],
      ),
    );
  }

  Padding _infoPartBuilder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 300, minHeight: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Flight '),
                      TextSpan(
                        text: flight.flightId,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Text(airline.carriageClass),
                Text('Carrier ${airline.airlineName}'),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 300, minHeight: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Departure at '),
                      TextSpan(
                        text: _timeFormat.format(flight.estimatedTime),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Text(_dateFormat.format(flight.estimatedTime)),
                Text('Dnieper DNK'),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500, minHeight: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Travel time '),
                      TextSpan(
                        text:
                            '${Duration(minutes: flight.travelTime).inHours} hours '
                            '${Duration(minutes: flight.travelTime).inMinutes - Duration(minutes: flight.travelTime).inHours * 60} minutes',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 300, minHeight: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Arrival at '),
                      TextSpan(
                        text: _timeFormat.format(_arrivalTime),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Text(_dateFormat.format(_arrivalTime)),
                Text(flight.airportName),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
