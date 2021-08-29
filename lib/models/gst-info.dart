import 'dart:convert';

class Welcome {
  final String name;
  final String status;
  final String address;
  final String taxpayertype;
  final String bussinesstype;
  final String dateOfRegistration;
  final String GSTINNumber;
  final String Floor;
  final String StateJurisdiction;
  final String CourtJusritiction;
  Welcome({
    this.name,
    this.status,
    this.address,
    this.taxpayertype,
    this.bussinesstype,
    this.dateOfRegistration,
    this.GSTINNumber,
    this.Floor,
    this.StateJurisdiction,
    this.CourtJusritiction,
  });

  Welcome copyWith({
    String name,
    String status,
    String address,
    String taxpayertype,
    String bussinesstype,
    String dateOfRegistration,
    String GSTINNumber,
    String Floor,
    String StateJurisdiction,
    String CourtJusritiction,
  }) {
    return Welcome(
      name: name ?? this.name,
      status: status ?? this.status,
      address: address ?? this.address,
      taxpayertype: taxpayertype ?? this.taxpayertype,
      bussinesstype: bussinesstype ?? this.bussinesstype,
      dateOfRegistration: dateOfRegistration ?? this.dateOfRegistration,
      GSTINNumber: GSTINNumber ?? this.GSTINNumber,
      Floor: Floor ?? this.Floor,
      StateJurisdiction: StateJurisdiction ?? this.StateJurisdiction,
      CourtJusritiction: CourtJusritiction ?? this.CourtJusritiction,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'status': status,
      'address': address,
      'taxpayertype': taxpayertype,
      'bussinesstype': bussinesstype,
      'date-of-registration': dateOfRegistration,
      'GSTIN-number': GSTINNumber,
      'Floor': Floor,
      'StateJurisdiction': StateJurisdiction,
      'CourtJusritiction': CourtJusritiction,
    };
  }

  factory Welcome.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Welcome(
      name: map['name'],
      status: map['status'],
      address: map['address'],
      taxpayertype: map['taxpayertype'],
      bussinesstype: map['bussinesstype'],
      dateOfRegistration: map['date-of-registration'],
      GSTINNumber: map['GSTIN-number'],
      Floor: map['Floor'],
      StateJurisdiction: map['StateJurisdiction'],
      CourtJusritiction: map['CourtJusritiction'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Welcome.fromJson(String source) =>
      Welcome.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Welcome(name: $name, status: $status, address: $address, taxpayertype: $taxpayertype, bussinesstype: $bussinesstype, dateOfRegistration: $dateOfRegistration, GSTINNumber: $GSTINNumber, Floor: $Floor, StateJurisdiction: $StateJurisdiction, CourtJusritiction: $CourtJusritiction)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Welcome &&
        o.name == name &&
        o.status == status &&
        o.address == address &&
        o.taxpayertype == taxpayertype &&
        o.bussinesstype == bussinesstype &&
        o.dateOfRegistration == dateOfRegistration &&
        o.GSTINNumber == GSTINNumber &&
        o.Floor == Floor &&
        o.StateJurisdiction == StateJurisdiction &&
        o.CourtJusritiction == CourtJusritiction;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        status.hashCode ^
        address.hashCode ^
        taxpayertype.hashCode ^
        bussinesstype.hashCode ^
        dateOfRegistration.hashCode ^
        GSTINNumber.hashCode ^
        Floor.hashCode ^
        StateJurisdiction.hashCode ^
        CourtJusritiction.hashCode;
  }
}
