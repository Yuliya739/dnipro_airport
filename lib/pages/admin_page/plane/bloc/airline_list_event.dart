part of 'airline_list_bloc.dart';

abstract class AirlineListEvent extends Equatable {
  const AirlineListEvent();

  @override
  List<Object> get props => [];
}

class AirlineListRequest extends AirlineListEvent {}
