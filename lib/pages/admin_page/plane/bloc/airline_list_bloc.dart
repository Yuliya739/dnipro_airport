import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dnipro_airport/models/airline_model.dart';
import 'package:dnipro_airport/repos/api_repo.dart';
import 'package:equatable/equatable.dart';

part 'airline_list_event.dart';
part 'airline_list_state.dart';

class AirlineListBloc extends Bloc<AirlineListEvent, AirlineListState> {
  final ApiRepo apiRepo;
  AirlineListBloc(this.apiRepo) : super(AirlineListInitial());

  @override
  Stream<AirlineListState> mapEventToState(
    AirlineListEvent event,
  ) async* {
    if (event is AirlineListRequest) {
      try {
        yield AirlineListInProgress();
        final data = await apiRepo.airlines();
        yield AirlineListDone(data);
      } catch (exc) {
        yield AirlineListFailure(error: exc);
      }
    }
  }
}
