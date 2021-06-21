import 'package:dnipro_airport/models/airline_model.dart';
import 'package:dnipro_airport/models/plane_model.dart';
import 'package:dnipro_airport/pages/admin_page/plane/bloc/airline_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'bloc/plane_list_bloc.dart';

class FlightPart extends StatefulWidget {
  FlightPart();

  @override
  State<FlightPart> createState() => _FlightPartState();
}

class _FlightPartState extends State<FlightPart> {
  bool _hasTrans = false;
  bool _isDeparture = true;
  final _timeController = TextEditingController();
  final _dateController = TextEditingController();
  final _directionController = TextEditingController();
  final _terminalController = TextEditingController();
  final _gateController = TextEditingController();
  final _airportController = TextEditingController();
  final _travelTimeController = TextEditingController();
  final _coastController = TextEditingController();
  final _transTimeController = TextEditingController();
  final _transDateController = TextEditingController();
  final _transGateController = TextEditingController();
  final _transCompanyController = TextEditingController();
  PlaneModel? _plane;

  final _dateFormat = DateFormat('yyyy-MM-dd');

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _isDeparture,
                  onChanged: (value) => setState(() {
                    _isDeparture = !_isDeparture;
                  }),
                ),
                Text('Departure'),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      readOnly: true,
                      onTap: () => showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 399)),
                      ).then(
                        (value) => _dateController.text =
                            value != null ? _dateFormat.format(value) : '',
                      ),
                      controller: _dateController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Date',
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      readOnly: true,
                      onTap: () => showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then(
                        (value) => _timeController.text =
                            value != null ? value.format(context) : '',
                      ),
                      controller: _timeController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Time',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _directionController,
                    decoration: InputDecoration(labelText: 'Direction'),
                  ),
                )),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _terminalController,
                    decoration: InputDecoration(labelText: 'Terminal'),
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
                    controller: _gateController,
                    decoration: InputDecoration(labelText: 'Gate'),
                  ),
                )),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<AirlineListBloc, AirlineListState>(
                    builder: (context, airlineState) {
                      if (airlineState is AirlineListDone) {
                        BlocProvider.of<PlaneListBloc>(context)
                            .add(PlaneListRequest());

                        return BlocBuilder<PlaneListBloc, PlaneListState>(
                          builder: (context, state) {
                            return LayoutBuilder(
                                builder: (context, constraints) {
                              return _buildAirlineField(
                                  state, constraints, airlineState.airlines);
                            });
                          },
                        );
                      }
                      return Container();
                    },
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
                    controller: _airportController,
                    decoration: InputDecoration(labelText: 'Airport name'),
                  ),
                )),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _travelTimeController,
                    decoration:
                        InputDecoration(labelText: 'Travel time in minutes'),
                  ),
                )),
              ],
            ),
            SizedBox(
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _coastController,
                    decoration: InputDecoration(labelText: 'Coast'),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _hasTrans,
                  onChanged: (value) => setState(() {
                    _hasTrans = !_hasTrans;
                  }),
                ),
                Text('Has transfer'),
              ],
            ),
            Visibility(visible: _hasTrans, child: _buildTransfer(context)),
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

  Autocomplete<PlaneModel> _buildAirlineField(PlaneListState state,
      BoxConstraints constraints, List<AirlineModel> airlines) {
    return Autocomplete<PlaneModel>(
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) =>
          TextFormField(
        decoration: InputDecoration(labelText: 'Plane'),
        controller: controller,
        focusNode: focusNode,
        onFieldSubmitted: (_) => onFieldSubmitted,
      ),
      displayStringForOption: (plane) => plane.planeName,
      optionsBuilder: (textEditingValue) {
        return state is PlaneListDone
            ? state.planes.where((element) => element.planeName
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase()))
            : List.empty();
      },
      optionsViewBuilder: (context, onSelected, options) => Align(
        alignment: Alignment.topLeft,
        child: Material(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(4.0)),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 500),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    color: Colors.black45,
                    blurRadius: 10,
                  )
                ],
              ),
              height: 52.0 * options.length,
              width: constraints.biggest.width,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: options.length,
                shrinkWrap: false,
                itemBuilder: (BuildContext context, int index) {
                  final PlaneModel option = options.elementAt(index);
                  return InkWell(
                    onTap: () {
                      _plane = option;
                      return onSelected(option);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(option.planeName),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTransfer(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  readOnly: true,
                  onTap: () => showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 399)),
                  ).then(
                    (value) => _transDateController.text =
                        value != null ? _dateFormat.format(value) : '',
                  ),
                  controller: _transDateController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Date',
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  readOnly: true,
                  onTap: () => showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then(
                    (value) => _transTimeController.text =
                        value != null ? value.format(context) : '',
                  ),
                  controller: _transTimeController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Time',
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _transGateController,
                decoration: InputDecoration(labelText: 'Gate'),
              ),
            )),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _transCompanyController,
                decoration: InputDecoration(labelText: 'Company'),
              ),
            )),
          ],
        ),
      ],
    );
  }
}
