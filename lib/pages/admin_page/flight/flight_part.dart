import 'package:flutter/material.dart';

class FlightPart extends StatelessWidget {
  FlightPart();

  void _add(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'FLIGHT',
              style: Theme.of(context).textTheme.headline3,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () => _add(context),
                child: Text('ADD'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
