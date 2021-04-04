import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'init_event.dart';
part 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  InitBloc() : super(InitInitial());

  @override
  Stream<InitState> mapEventToState(
    InitEvent event,
  ) async* {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
