part of 'flight_bloc.dart';

abstract class FlightEvent extends Equatable {
  const FlightEvent();

  @override
  List<Object> get props => [];
}

class FlightAdd extends FlightEvent {
  final FlightModel flight;

  FlightAdd(this.flight);

  @override
  List<Object> get props => [flight];
}
