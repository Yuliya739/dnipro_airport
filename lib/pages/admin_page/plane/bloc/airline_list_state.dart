part of 'airline_list_bloc.dart';

abstract class AirlineListState extends Equatable {
  const AirlineListState();

  @override
  List<Object> get props => [];
}

class AirlineListInitial extends AirlineListState {}

class AirlineListInProgress extends AirlineListState {}

class AirlineListDone extends AirlineListState {
  final List<AirlineModel> airlines;

  AirlineListDone(this.airlines);

  @override
  List<Object> get props => [airlines];
}

class AirlineListFailure extends AirlineListState {
  final Object? error;

  AirlineListFailure({this.error});

  @override
  List<Object> get props => [error!];
}
