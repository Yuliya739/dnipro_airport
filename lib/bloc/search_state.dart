part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchInProgress extends SearchState {}

class SearchFailure extends SearchState {
  final Object? error;

  SearchFailure({this.error});

  @override
  List<Object> get props => [error!];
}

class SearchSuccess extends SearchState {
  final List<FlightModel> flights;

  SearchSuccess({required this.flights});

  @override
  List<Object> get props => [flights];
}
