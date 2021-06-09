import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dnipro_airport/models/flight_model.dart';
import 'package:dnipro_airport/repos/api_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiRepo apiRepo;
  SearchBloc({required this.apiRepo}) : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchRequest) {
      yield SearchInProgress();
      yield await _onSearchRequest(event);
    }
  }

  Future<SearchState> _onSearchRequest(SearchRequest event) async {
    try {
      final flights = await apiRepo.search(event.flightTo, event.departDate);
      return SearchSuccess(flights: flights);
    } catch (exc) {
      return SearchFailure(error: exc);
    }
  }
}
