import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/airline_bloc.dart';

class AirlinePart extends StatelessWidget {
  AirlinePart();
  final _nameController = TextEditingController();
  final _countryController = TextEditingController();
  final _iso2Controller = TextEditingController();
  final _iso3Controller = TextEditingController();
  final _iataController = TextEditingController();
  final _icaoController = TextEditingController();
  final _classController = TextEditingController();
  final _callCenterController = TextEditingController();

  void _add(BuildContext context) {
    print('_nameController ${_nameController.text}');
    print('_countryController ${_countryController.text}');
    print('_iso2Controller ${_iso2Controller.text}');
    print('_iso3Controller ${_iso3Controller.text}');
    print('_iataController ${_iataController.text}');
    print('_icaoController ${_icaoController.text}');
    print('_classController ${_classController.text}');
    print('_callCenterController ${_callCenterController.text}');

    BlocProvider.of<AirlineBloc>(context).add(AirlineAdd(
      name: _nameController.text,
      country: _countryController.text,
      iso2: _iso2Controller.text,
      iso3: _iso3Controller.text,
      iata: _iataController.text,
      icao: _icaoController.text,
      carriageClass: _classController.text,
      callCenter: _callCenterController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'AIRLINE',
              style: Theme.of(context).textTheme.headline3,
            ),
            Row(
              children: [
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                )),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _countryController,
                    decoration: InputDecoration(labelText: 'Country'),
                  ),
                )),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _iso2Controller,
                    decoration: InputDecoration(labelText: 'ISO31661 alpha2'),
                  ),
                )),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _iso3Controller,
                    decoration: InputDecoration(labelText: 'ISO31661 alpha3'),
                  ),
                )),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _iataController,
                    decoration: InputDecoration(labelText: 'IATA'),
                  ),
                )),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _icaoController,
                    decoration: InputDecoration(labelText: 'ICAO'),
                  ),
                )),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _classController,
                    decoration: InputDecoration(labelText: 'Carriage class'),
                  ),
                )),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _callCenterController,
                    decoration: InputDecoration(labelText: 'Call center'),
                  ),
                )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<AirlineBloc, AirlineState>(
                builder: (context, state) {
                  if (state is AirlineDone) {
                    return ElevatedButton(
                      onPressed: () => _add(context),
                      child: Text('ADD'),
                    );
                  }
                  if (state is AirlineInProgress) {
                    return ElevatedButton(
                      onPressed: null,
                      child: Text('ADD'),
                    );
                  }
                  if (state is AirlineFailure) {
                    return Text(state.error.toString());
                  }
                  return Text('Unknown state $state');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
