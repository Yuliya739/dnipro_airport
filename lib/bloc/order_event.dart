part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class OrderRequest extends OrderEvent {
  final String flightId;
  final String lastName;
  final String firstName;
  final DateTime dateOfBirth;
  final String numPassport;
  final String email;
  final DateTime validUntil;

  OrderRequest({
    required this.flightId,
    required this.lastName,
    required this.firstName,
    required this.dateOfBirth,
    required this.numPassport,
    required this.email,
    required this.validUntil,
  });

  @override
  List<Object> get props => [
        flightId,
        lastName,
        firstName,
        dateOfBirth,
        numPassport,
        email,
        validUntil,
      ];
}
