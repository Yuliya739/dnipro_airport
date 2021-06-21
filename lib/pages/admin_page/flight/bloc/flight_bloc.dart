import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dnipro_airport/models/flight_model.dart';
import 'package:dnipro_airport/repos/api_repo.dart';
import 'package:equatable/equatable.dart';

part 'flight_event.dart';
part 'flight_state.dart';

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  final ApiRepo apiRepo;
  FlightBloc(this.apiRepo) : super(FlightDone());

  @override
  Stream<FlightState> mapEventToState(
    FlightEvent event,
  ) async* {
    if (event is FlightAdd) {
      try {
        yield FlightInProgress();
        await apiRepo.addFlight(event.flight);
        yield FlightDone();
      } catch (exc) {
        yield FlightFailure(error: exc);
      }
    }
  }
}
