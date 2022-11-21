class PilotoF1 {
  late String driverId;
  late String permanentNumber;
  late String code;
  late String url;
  late String givenName;
  late String familyName;
  late DateTime dateOfBirth;
  late String nationality;

  PilotoF1({
    required this.driverId,
    required this.permanentNumber,
    required this.code,
    required this.url,
    required this.givenName,
    required this.familyName,
    required this.dateOfBirth,
    required this.nationality,
  });



  factory PilotoF1.fromJson(Map<String, dynamic> json) => PilotoF1(
    driverId: json["driverId"],
    permanentNumber: json["permanentNumber"],
    code: json["code"],
    url: json["url"],
    givenName: json["givenName"],
    familyName: json["familyName"],
    dateOfBirth: DateTime.parse(json["dateOfBirth"]),
    nationality: json["nationality"],
  );

  Map<String, dynamic> toJson() => {
    "driverId": driverId,
    "permanentNumber": permanentNumber,
    "code": code,
    "url": url,
    "givenName": givenName,
    "familyName": familyName,
    "dateOfBirth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "nationality": nationality,
  };
}
