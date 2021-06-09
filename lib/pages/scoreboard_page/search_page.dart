import 'package:dnipro_airport/bloc/search_bloc.dart';
import 'package:dnipro_airport/components/search_flight_field.dart';
import 'package:dnipro_airport/components/ticket_card.dart';
import 'package:dnipro_airport/components/ticket_card_preloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  static String get route => '/scoreboard';
  final String? flightTo;
  final DateTime? departDate;
  const SearchPage({
    Key? key,
    this.departDate,
    this.flightTo,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    if (widget.departDate != null && widget.flightTo != null) {
      BlocProvider.of<SearchBloc>(context).add(SearchRequest(
          flightTo: widget.flightTo!, departDate: widget.departDate!));
    }
    super.initState();
  }

  void _onSearchTap(BuildContext context, String direction, DateTime date) {
    BlocProvider.of<SearchBloc>(context)
        .add(SearchRequest(flightTo: direction, departDate: date));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 97, 97, 97),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                    height: 80,
                  ),
                ),
              ),
              SizedBox(height: 100),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 700),
                child: SearchFlightField(
                  onSearchTap: (direction, date) =>
                      _onSearchTap(context, direction, date),
                  flightTo: widget.flightTo,
                  date: widget.departDate,
                ),
              ),
              _ResultsList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResultsList extends StatelessWidget {
  final void Function(String flightId)? onTicketTap;
  const _ResultsList({Key? key, this.onTicketTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchFailure) {
          Text(state.toString());
        }
        if (state is SearchInProgress) {
          return LinearProgressIndicator();
        }
        if (state is SearchSuccess) {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1000),
              child: Column(
                children: state.flights
                    .map((flight) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TicketCardPreloader(
                            flight: flight,
                            builder:
                                (context, flight, airline, transplantation) {
                              return TicketCard(
                                flight: flight,
                                airline: airline,
                                transplantation: transplantation,
                                borderRadius: BorderRadius.circular(30.0),
                              );
                            },
                            errorBuilder: (context, error) =>
                                Text(error.toString()),
                            loadBuilder: (context) => LinearProgressIndicator(),
                          ),
                        ))
                    .toList(),
              ),
            ),
          );
        }
        return Text('Unknown SearchBloc state $state');
      },
    );
  }
}
