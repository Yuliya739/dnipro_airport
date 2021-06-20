import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'plane_event.dart';
part 'plane_state.dart';

class PlaneBloc extends Bloc<PlaneEvent, PlaneState> {
  PlaneBloc() : super(PlaneInitial());

  @override
  Stream<PlaneState> mapEventToState(
    PlaneEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
