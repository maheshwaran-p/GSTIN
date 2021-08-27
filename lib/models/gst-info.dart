import 'dart:convert';

import 'package:equatable/equatable.dart';

class Welcome extends Equatable {
  final String name;
  final String status;
  final String address;
  final String taxpayertype;
  final String bussinesstype;
  final String dateOfRegistration;
  final String GSTINNumber;
  Welcome({
    this.name,
    this.status,
    this.address,
    this.taxpayertype,
    this.bussinesstype,
    this.dateOfRegistration,
    this.GSTINNumber,
  });

  Welcome copyWith({
    String name,
    String status,
    String address,
    String taxpayertype,
    String bussinesstype,
    String dateOfRegistration,
    String GSTINNumber,
  }) {
    return Welcome(
      name: name ?? this.name,
      status: status ?? this.status,
      address: address ?? this.address,
      taxpayertype: taxpayertype ?? this.taxpayertype,
      bussinesstype: bussinesstype ?? this.bussinesstype,
      dateOfRegistration: dateOfRegistration ?? this.dateOfRegistration,
      GSTINNumber: GSTINNumber ?? this.GSTINNumber,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory Welcome.fromJson(String source) =>
      Welcome.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Welcome(name: $name, status: $status, address: $address, taxpayertype: $taxpayertype, bussinesstype: $bussinesstype, dateOfRegistration: $dateOfRegistration, GSTINNumber: $GSTINNumber)';
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
        o.GSTINNumber == GSTINNumber;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        status.hashCode ^
        address.hashCode ^
        taxpayertype.hashCode ^
        bussinesstype.hashCode ^
        dateOfRegistration.hashCode ^
        GSTINNumber.hashCode;
  }

  @override
  List<Object> get props => [GSTINNumber];
}
