import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dnipro_airport/models/plane_model.dart';
import 'package:dnipro_airport/repos/api_repo.dart';
import 'package:equatable/equatable.dart';

part 'plane_list_event.dart';
part 'plane_list_state.dart';

class PlaneListBloc extends Bloc<PlaneListEvent, PlaneListState> {
  final ApiRepo apiRepo;
  PlaneListBloc(this.apiRepo) : super(PlaneListInitial());

  @override
  Stream<PlaneListState> mapEventToState(
    PlaneListEvent event,
  ) async* {
    if (event is PlaneListRequest) {
      try {
        yield PlaneListInProgress();
        final data = await apiRepo.planes();
        yield PlaneListDone(data);
      } catch (exc) {
        yield PlaneListFailure(error: exc);
      }
    }
  }
}
