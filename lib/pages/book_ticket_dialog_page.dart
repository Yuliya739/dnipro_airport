import 'package:dnipro_airport/bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BookTicketDialogPage extends StatelessWidget {
  final String flightId;

  BookTicketDialogPage({
    Key? key,
    required this.flightId,
  }) : super(key: key);

  final _emailTextEditingController = TextEditingController();
  final _lastNameTextEditingController = TextEditingController();
  final _firstNameTextEditingController = TextEditingController();
  final _dateOfBirthTextEditingController = TextEditingController();
  final _passNumTextEditingController = TextEditingController();
  final _passDateTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _dateFormat = DateFormat.yMMMMd();

  static const List<String> _sexOptions = <String>[
    'Male',
    'Female',
  ];

  String? _validateField(String? text) {
    if (text == null || text.isEmpty) {
      return 'Please enter the value';
    }
    return null;
  }

  void _onBookPressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<OrderBloc>(context).add(OrderRequest(
        flightId: flightId,
        lastName: _lastNameTextEditingController.text,
        firstName: _firstNameTextEditingController.text,
        dateOfBirth: _dateFormat.parse(_dateOfBirthTextEditingController.text),
        numPassport: _passNumTextEditingController.text,
        email: _emailTextEditingController.text,
        validUntil: _dateFormat.parse(_passDateTextEditingController.text),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Material(
        child: _contentBuilder(context),
      ),
    );
  }

  Widget _contentBuilder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Reservation',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 20),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: Row(
                children: [
                  Flexible(
                    child: _firstColumnBuilder(context),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    child: _secondColumnBuilder(context),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: Align(
                alignment: Alignment.centerRight,
                child: BlocBuilder<OrderBloc, OrderState>(
                  builder: (context, state) {
                    if (state is OrderSuccess ||
                        state is OrderInitial ||
                        state is OrderInProgress) {
                      return ElevatedButton(
                        onPressed:
                            state is OrderSuccess || state is OrderInitial
                                ? () => _onBookPressed(context)
                                : null,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Book now'),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(45, 199, 49, 1)),
                        ),
                      );
                    }
                    if (state is OrderInProgress) {
                      return CircularProgressIndicator();
                    }
                    if (state is OrderFailure) {
                      return Text(state.error.toString());
                    }
                    return Text('Error');
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column _firstColumnBuilder(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sex'),
        LayoutBuilder(builder: (context, constraints) {
          return Autocomplete<String>(
            initialValue:
                TextEditingValue(text: BookTicketDialogPage._sexOptions.first),
            optionsBuilder: (textEditingValue) {
              return BookTicketDialogPage._sexOptions;
            },
            optionsViewBuilder: (context, onSelected, options) => Align(
              alignment: Alignment.topLeft,
              child: Material(
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(4.0)),
                ),
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
                      final String option = options.elementAt(index);
                      return InkWell(
                        onTap: () => onSelected(option),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(option),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        }),
        SizedBox(height: 20),
        TextFormField(
          validator: _validateField,
          controller: _lastNameTextEditingController,
          decoration: InputDecoration(labelText: 'Last name'),
        ),
        SizedBox(height: 20),
        TextFormField(
          validator: _validateField,
          controller: _firstNameTextEditingController,
          decoration: InputDecoration(labelText: 'First name'),
        ),
        SizedBox(height: 20),
        DateFormField(
          validator: _validateField,
          controller: _dateOfBirthTextEditingController,
          label: 'Date of birth',
        ),
      ],
    );
  }

  Column _secondColumnBuilder(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        TextFormField(
          validator: _validateField,
          controller: _emailTextEditingController,
          decoration: InputDecoration(labelText: 'E-mail'),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              'Document',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        TextFormField(
          validator: _validateField,
          controller: _passNumTextEditingController,
          decoration: InputDecoration(labelText: 'Passport number'),
        ),
        SizedBox(height: 20),
        DateFormField(
          validator: _validateField,
          controller: _passDateTextEditingController,
          label: 'Expiry date',
        ),
      ],
    );
  }
}

class DateFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? Function(String?)? validator;
  DateFormField({Key? key, this.controller, this.label, this.validator})
      : super(key: key);

  final _dateFormat = DateFormat.yMMMMd();

  void _onTap(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: -365 * 20)),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    ).then(
      (value) =>
          controller?.text = value != null ? _dateFormat.format(value) : '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(labelText: label),
      onTap: () => _onTap(context),
    );
  }
}
