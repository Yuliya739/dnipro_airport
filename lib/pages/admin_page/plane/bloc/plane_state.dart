part of 'plane_bloc.dart';

abstract class PlaneState extends Equatable {
  const PlaneState();
  
  @override
  List<Object> get props => [];
}

class PlaneInitial extends PlaneState {}
