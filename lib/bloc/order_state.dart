part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderInProgress extends OrderState {}

class OrderFailure extends OrderState {
  final Object? error;

  OrderFailure({this.error});

  @override
  List<Object> get props => [error!];
}

class OrderSuccess extends OrderState {
  final String orderId;

  OrderSuccess(this.orderId);

  @override
  List<Object> get props => [orderId];
}
