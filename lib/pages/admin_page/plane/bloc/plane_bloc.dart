import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dnipro_airport/models/plane_model.dart';
import 'package:dnipro_airport/repos/api_repo.dart';
import 'package:equatable/equatable.dart';

part 'plane_event.dart';
part 'plane_state.dart';

class PlaneBloc extends Bloc<PlaneEvent, PlaneState> {
  final ApiRepo apiRepo;
  PlaneBloc(this.apiRepo) : super(PlaneDone());

  @override
  Stream<PlaneState> mapEventToState(
    PlaneEvent event,
  ) async* {
    if (event is PlaneAdd) {
      yield PlaneInProgress();
      try {
        await apiRepo.addPlane(event.plane);
        yield PlaneDone();
      } catch (exc) {
        yield PlaneFailure(error: exc);
      }
    }
  }
}
