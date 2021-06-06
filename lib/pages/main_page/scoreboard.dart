import 'package:dnipro_airport/components/blurred_container.dart';
import 'package:dnipro_airport/models/flight_model.dart';
import 'package:flutter/material.dart';

class Scoreboard extends StatelessWidget {
  final List<FlightModel> data;
  Scoreboard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final _borderRadius = BorderRadius.circular(30.0);

  @override
  Widget build(BuildContext context) {
    return BlurredContainer(
      color: Colors.black38,
      borderRadius: _borderRadius,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Scoreboard',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            DataTable(
              columns: [
                DataColumn(
                    label: Text(
                  'Flight',
                  style: Theme.of(context).textTheme.subtitle1,
                )),
                DataColumn(
                    label: Text(
                  'Time',
                  style: Theme.of(context).textTheme.subtitle1,
                )),
                DataColumn(
                    label: Text(
                  'Destination',
                  style: Theme.of(context).textTheme.subtitle1,
                )),
                // DataColumn(label: Text('Carrier')),
                DataColumn(
                    label: Text(
                  'Terminal',
                  style: Theme.of(context).textTheme.subtitle1,
                )),
                DataColumn(
                    label: Text(
                  'Gate',
                  style: Theme.of(context).textTheme.subtitle1,
                )),
                DataColumn(
                    label: Text(
                  'Remark',
                  style: Theme.of(context).textTheme.subtitle1,
                )),
              ],
              rows: data
                  .map(
                    (e) => DataRow(
                      cells: [
                        DataCell(Text(e.flightId)),
                        DataCell(
                          Text('${e.estimatedTime.hour}:'
                              '${e.estimatedTime.minute}'),
                        ),
                        DataCell(Text(e.direction)),
                        // DataCell(Text(e.airlineId)),
                        DataCell(Text(e.terminal)),
                        DataCell(Text(e.gate)),
                        DataCell(Text(e.remark)),
                      ],
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
