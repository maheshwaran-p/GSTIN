import 'dart:convert';

class Welcome {
  final String name;
  final String status;
  final String address;
  final String taxpayertype;
  final String bussinesstype;
  final String dateOfRegistration;
  Welcome({
    this.name,
    this.status,
    this.address,
    this.taxpayertype,
    this.bussinesstype,
    this.dateOfRegistration,
  });

  Welcome copyWith({
    String name,
    String status,
    String address,
    String taxpayertype,
    String bussinesstype,
    String dateOfRegistration,
  }) {
    return Welcome(
      name: name ?? this.name,
      status: status ?? this.status,
      address: address ?? this.address,
      taxpayertype: taxpayertype ?? this.taxpayertype,
      bussinesstype: bussinesstype ?? this.bussinesstype,
      dateOfRegistration: dateOfRegistration ?? this.dateOfRegistration,
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
    };
  }

  factory Welcome.fromMap(Map<String, dynamic> map) {
    return Welcome(
      name: map['name'],
      status: map['status'],
      address: map['address'],
      taxpayertype: map['taxpayertype'],
      bussinesstype: map['bussinesstype'],
      dateOfRegistration: map['date-of-registration'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Welcome.fromJson(String source) =>
      Welcome.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Welcome(name: $name, status: $status, address: $address, taxpayertype: $taxpayertype, bussinesstype: $bussinesstype, dateOfRegistration: $dateOfRegistration)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Welcome &&
        other.name == name &&
        other.status == status &&
        other.address == address &&
        other.taxpayertype == taxpayertype &&
        other.bussinesstype == bussinesstype &&
        other.dateOfRegistration == dateOfRegistration;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        status.hashCode ^
        address.hashCode ^
        taxpayertype.hashCode ^
        bussinesstype.hashCode ^
        dateOfRegistration.hashCode;
  }
}
