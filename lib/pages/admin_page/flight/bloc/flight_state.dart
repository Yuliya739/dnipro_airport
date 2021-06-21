part of 'flight_bloc.dart';

abstract class FlightState extends Equatable {
  const FlightState();

  @override
  List<Object> get props => [];
}

class FlightDone extends FlightState {}

class FlightInProgress extends FlightState {}

class FlightFailure extends FlightState {
  final Object? error;

  FlightFailure({this.error});

  @override
  List<Object> get props => [error!];
}
