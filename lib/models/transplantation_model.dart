class TransplantationModel {
  String transplantationId;
  DateTime transplantationTime;
  String gate;
  String companyTransfer;
  String flightId;

  TransplantationModel({
    required this.transplantationId,
    required this.transplantationTime,
    required this.gate,
    required this.companyTransfer,
    required this.flightId,
  });

  factory TransplantationModel.fromJson(Map<String, dynamic> json) {
    return TransplantationModel(
      transplantationId: json['transplantation_id'],
      transplantationTime: DateTime.parse(json['transplantation_time']),
      gate: json['gate'],
      companyTransfer: json['company_transfer'],
      flightId: json['flight_id'],
    );
  }
}
