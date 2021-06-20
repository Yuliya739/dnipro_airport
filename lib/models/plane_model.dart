class PlaneModel {
  String? planeId;
  String planeName;
  int kolSeats;
  String airlineId;

  PlaneModel({
    this.planeId,
    required this.airlineId,
    required this.kolSeats,
    required this.planeName,
  });

  factory PlaneModel.fromJson(Map<String, dynamic> json) {
    return PlaneModel(
      planeId: json['plane_id'],
      airlineId: json['airline_id'],
      kolSeats: json['kol_seats'],
      planeName: json['plane_name'],
    );
  }
}
