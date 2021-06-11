import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dnipro_airport/repos/api_repo.dart';
import 'package:equatable/equatable.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final ApiRepo apiRepo;
  OrderBloc({required this.apiRepo}) : super(OrderInitial());

  @override
  Stream<OrderState> mapEventToState(
    OrderEvent event,
  ) async* {
    if (event is OrderRequest) {
      yield OrderInProgress();
      yield await _onRequstEvent(event);
    }
  }

  Future<OrderState> _onRequstEvent(OrderRequest event) async {
    try {
      final data = await apiRepo.order(
        flightId: event.flightId,
        lastName: event.lastName,
        firstName: event.firstName,
        dateOfBirth: event.dateOfBirth,
        numPassport: event.numPassport,
        email: event.email,
        validUntil: event.validUntil,
      );
      return OrderSuccess(data);
    } catch (exc) {
      return OrderFailure(error: exc);
    }
  }
}
