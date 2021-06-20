part of 'plane_bloc.dart';

abstract class PlaneEvent extends Equatable {
  const PlaneEvent();

  @override
  List<Object> get props => [];
}

class PlaneAdd extends PlaneEvent {}
