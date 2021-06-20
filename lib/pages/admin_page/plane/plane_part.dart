import 'package:dnipro_airport/models/airline_model.dart';
import 'package:dnipro_airport/pages/admin_page/plane/bloc/airline_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanePart extends StatefulWidget {
  PlanePart();

  @override
  State<PlanePart> createState() => _PlanePartState();
}

class _PlanePartState extends State<PlanePart> {
  final _nameController = TextEditingController();

  final _kolSeatsController = TextEditingController();

  AirlineModel? _airline;

  void _add(BuildContext context) {
    print('_nameController ${_nameController.text}');
    print('_kolSeatsController ${_kolSeatsController.text}');
    print('airline ${_airline?.airlineId} ${_airline?.airlineName}');
  }

  @override
  void didChangeDependencies() {
    BlocProvider.of<AirlineListBloc>(context).add(AirlineListRequest());
    super.didChangeDependencies();
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
              'PLANE',
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
                  child: BlocBuilder<AirlineListBloc, AirlineListState>(
                    builder: (context, state) {
                      return LayoutBuilder(builder: (context, constraints) {
                        return _buildAirlineField(state, constraints);
                      });
                    },
                  ),
                )),
              ],
            ),
            SizedBox(
              width: 500,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _kolSeatsController,
                  decoration: InputDecoration(labelText: 'Number of seats'),
                ),
              ),
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

  Autocomplete<AirlineModel> _buildAirlineField(
      AirlineListState state, BoxConstraints constraints) {
    return Autocomplete<AirlineModel>(
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) =>
          TextFormField(
        decoration: InputDecoration(labelText: 'Airline'),
        controller: controller,
        focusNode: focusNode,
        onFieldSubmitted: (_) => onFieldSubmitted,
      ),
      displayStringForOption: (airline) => airline.airlineName,
      optionsBuilder: (textEditingValue) {
        return state is AirlineListDone
            ? state.airlines.where((element) => element.airlineName
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
                  final AirlineModel option = options.elementAt(index);
                  return InkWell(
                    onTap: () {
                      _airline = option;
                      return onSelected(option);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(option.airlineName),
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
}
