part of 'airline_bloc.dart';

abstract class AirlineState extends Equatable {
  const AirlineState();

  @override
  List<Object> get props => [];
}

class AirlineInitial extends AirlineState {}

class AirlineInProgress extends AirlineState {}

class AirlineFailure extends AirlineState {
  final Object? error;

  AirlineFailure({this.error});

  @override
  List<Object> get props => [error!];
}

class AirlineDone extends AirlineState {}
