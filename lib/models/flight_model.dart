import 'package:dnipro_airport/models/transplantation_model.dart';

class FlightModel {
  String? flightId;
  DateTime estimatedTime;
  bool isDeparture;
  DateTime? realTime;
  String terminal;
  String gate;
  String remark;
  String airportName;
  String direction;
  String planeId;
  int travelTime;
  double coast;
  TransplantationModel? transfer;

  FlightModel({
    this.flightId,
    required this.estimatedTime,
    required this.isDeparture,
    this.realTime,
    required this.terminal,
    required this.gate,
    required this.remark,
    required this.airportName,
    required this.direction,
    required this.planeId,
    required this.travelTime,
    required this.coast,
    this.transfer,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) {
    final realTime = json['real_time'];
    return FlightModel(
      flightId: json['flight_id'],
      estimatedTime: DateTime.parse(json['estimated_time']),
      isDeparture: json['is_departure'],
      terminal: json['terminal'],
      gate: json['gate'],
      remark: json['remark'],
      airportName: json['airport_name'],
      direction: json['direction'],
      planeId: json['plane_id'],
      realTime: realTime == null ? null : DateTime.parse(json['real_time']),
      travelTime: json['travel_time'],
      coast: json['coast'],
    );
  }
}
