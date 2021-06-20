import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dnipro_airport/repos/api_repo.dart';
import 'package:equatable/equatable.dart';

part 'airline_event.dart';
part 'airline_state.dart';

class AirlineBloc extends Bloc<AirlineEvent, AirlineState> {
  final ApiRepo apiRepo;
  AirlineBloc(this.apiRepo) : super(AirlineDone());

  @override
  Stream<AirlineState> mapEventToState(
    AirlineEvent event,
  ) async* {
    if (event is AirlineAdd) {
      yield AirlineInProgress();
      try {
        await apiRepo.addAirline(
          name: event.name,
          country: event.country,
          iso2: event.iso2,
          iso3: event.iso3,
          iata: event.iata,
          icao: event.icao,
          carriageClass: event.carriageClass,
          callCenter: event.callCenter,
        );
        yield AirlineDone();
      } catch (exc) {
        yield AirlineFailure(error: exc);
      }
    }
  }
}
