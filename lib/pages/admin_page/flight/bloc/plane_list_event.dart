part of 'plane_list_bloc.dart';

abstract class PlaneListEvent extends Equatable {
  const PlaneListEvent();

  @override
  List<Object> get props => [];
}

class PlaneListRequest extends PlaneListEvent {}
