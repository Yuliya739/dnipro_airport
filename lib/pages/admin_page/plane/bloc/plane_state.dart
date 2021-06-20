part of 'plane_bloc.dart';

abstract class PlaneState extends Equatable {
  const PlaneState();

  @override
  List<Object> get props => [];
}

class PlaneInitial extends PlaneState {}

class PlaneInProgress extends PlaneState {}

class PlaneFailure extends PlaneState {
  final Object? error;

  PlaneFailure({this.error});

  @override
  List<Object> get props => [error!];
}

class PlaneDone extends PlaneState {}
