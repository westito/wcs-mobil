// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, type_annotate_public_apis

part of 'driver.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

// ignore_for_file: annotate_overrides, unused_element

mixin _$Driver {
  Driver get _self => this as Driver;

  String toString() => (ClassToString('Driver')
        ..add('driverId', _self.driverId)
        ..add('url', _self.url)
        ..add('permanentNumber', _self.permanentNumber)
        ..add('code', _self.code)
        ..add('givenName', _self.givenName)
        ..add('familyName', _self.familyName)
        ..add('dateOfBirth', _self.dateOfBirth)
        ..add('nationality', _self.nationality))
      .toString();

  Driver copyWith({
    String? driverId,
    String? url,
    String? permanentNumber,
    String? code,
    String? givenName,
    String? familyName,
    DateTime? dateOfBirth,
    Country? nationality,
  }) {
    return Driver(
      driverId: driverId ?? _self.driverId,
      url: url ?? _self.url,
      permanentNumber: permanentNumber ?? _self.permanentNumber,
      code: code ?? _self.code,
      givenName: givenName ?? _self.givenName,
      familyName: familyName ?? _self.familyName,
      dateOfBirth: dateOfBirth ?? _self.dateOfBirth,
      nationality: nationality ?? _self.nationality,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
      driverId: json['driverId'] as String,
      permanentNumber: json['permanentNumber'] as String?,
      code: json['code'] as String?,
      givenName: json['givenName'] as String,
      familyName: json['familyName'] as String,
      url: json['url'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      nationality: _countryFromJson(json['nationality'] as String?),
    );
