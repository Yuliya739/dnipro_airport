import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchFlightField extends StatelessWidget {
  final Function(String, DateTime) onSearchTap;

  SearchFlightField({
    Key? key,
    required this.onSearchTap,
    String? flightTo,
    DateTime? date,
  }) : super(key: key) {
    _flightToTextController = TextEditingController(text: flightTo);
    _departOnTextController = TextEditingController(
        text: date == null ? null : _dateFormat.format(date));
  }
  late final _flightToTextController;
  late final _departOnTextController;
  final _dateFormat = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext _) {
    return Theme(
      data: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark().copyWith(
        secondary: Colors.grey[400],
        primary: Colors.grey[400],
      )),
      child: Builder(builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 71, 87, 139),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  // fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      controller: _flightToTextController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'FLIGHT TO',
                      ),
                    ),
                  ),
                ),
                Flexible(
                  // fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      readOnly: true,
                      onTap: () => showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 399)),
                      ).then(
                        (value) => _departOnTextController.text =
                            value != null ? _dateFormat.format(value) : '',
                      ),
                      controller: _departOnTextController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'DEPART ON',
                      ),
                    ),
                  ),
                ),
                TextButton(
                  child: Text('SEARCH'),
                  onPressed: () {
                    final flightTo = _flightToTextController.text;
                    final departOn = _departOnTextController.text;
                    if (flightTo.isNotEmpty && departOn.isNotEmpty) {
                      onSearchTap(
                        flightTo,
                        DateTime.parse(departOn),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
