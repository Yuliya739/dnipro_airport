class AirlineModel {
  String airlineId;
  String airlineName;
  String country;
  String iso31661Alpha2;
  String iso31661Alpha3;
  String iata;
  String icao;
  String carriageClass;
  String callCenter;

  AirlineModel({
    required this.airlineId,
    required this.airlineName,
    required this.country,
    required this.iso31661Alpha2,
    required this.iso31661Alpha3,
    required this.iata,
    required this.icao,
    required this.carriageClass,
    required this.callCenter,
  });

  factory AirlineModel.fromJson(Map<String, dynamic> json) {
    return AirlineModel(
      airlineId: json['airline_id'],
      airlineName: json['airline_name'],
      country: json['country'],
      iso31661Alpha2: json['iso31661_alpha2'],
      iso31661Alpha3: json['iso31661_alpha3'],
      iata: json['iata'],
      icao: json['icao'],
      carriageClass: json['carriage_class'],
      callCenter: json['call_center'],
    );
  }
}
