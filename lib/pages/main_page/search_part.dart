import 'package:dnipro_airport/components/search_flight_field.dart';
import 'package:flutter/material.dart';

class SearchPart extends StatelessWidget {
  const SearchPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Find the ticket you want',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'You can find exactly what you need',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500),
                child: SearchFlightField(
                  onSearchTap: (flightTo, date) {
                    print('To $flightTo at ${date.toIso8601String()}');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
