part of 'airline_bloc.dart';

abstract class AirlineEvent extends Equatable {
  const AirlineEvent();

  @override
  List<Object> get props => [];
}

class AirlineAdd extends AirlineEvent {
  final String name;
  final String country;
  final String iso2;
  final String iso3;
  final String iata;
  final String icao;
  final String carriageClass;
  final String callCenter;

  AirlineAdd({
    required this.name,
    required this.country,
    required this.iso2,
    required this.iso3,
    required this.iata,
    required this.icao,
    required this.carriageClass,
    required this.callCenter,
  });

  @override
  List<Object> get props => [
        name,
        country,
        iso2,
        iso3,
        iata,
        icao,
        callCenter,
        carriageClass,
      ];
}
