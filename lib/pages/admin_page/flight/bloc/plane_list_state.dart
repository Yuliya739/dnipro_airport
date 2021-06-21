part of 'plane_list_bloc.dart';

abstract class PlaneListState extends Equatable {
  const PlaneListState();

  @override
  List<Object> get props => [];
}

class PlaneListInitial extends PlaneListState {}

class PlaneListInProgress extends PlaneListState {}

class PlaneListFailure extends PlaneListState {
  final Object? error;

  PlaneListFailure({this.error});

  @override
  List<Object> get props => [error!];
}

class PlaneListDone extends PlaneListState {
  final List<PlaneModel> planes;

  PlaneListDone(this.planes);

  @override
  List<Object> get props => [planes];
}
