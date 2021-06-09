part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchRequest extends SearchEvent {
  final String flightTo;
  final DateTime departDate;

  SearchRequest({required this.flightTo, required this.departDate});

  @override
  List<Object> get props => [flightTo, departDate];
}
