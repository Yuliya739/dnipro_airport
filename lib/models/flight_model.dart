class FlightModel {
  String flightId;
  DateTime estimatedTime;
  bool isDeparture;
  DateTime? realTime;
  String terminal;
  String gate;
  String remark;
  String airportName;
  String direction;
  String airlineId;

  FlightModel({
    required this.flightId,
    required this.estimatedTime,
    required this.isDeparture,
    this.realTime,
    required this.terminal,
    required this.gate,
    required this.remark,
    required this.airportName,
    required this.direction,
    required this.airlineId,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) {
    return FlightModel(
      flightId: json['flight_id'],
      estimatedTime: DateTime.parse(json['estimated_time']),
      isDeparture: json['is_departure'],
      terminal: json['terminal'],
      gate: json['gate'],
      remark: json['remark'],
      airportName: json['airport_name'],
      direction: json['direction'],
      airlineId: json['airline_id'],
      realTime: DateTime.parse(json['real_time']),
    );
  }
}
