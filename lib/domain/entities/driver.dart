import 'package:collection/collection.dart';
import 'package:country/country.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mek_data_class/mek_data_class.dart';

part 'driver.g.dart';

@DataClass()
@JsonSerializable(createToJson: false)
class Driver with _$Driver {
  final String driverId;
  final String url;
  final String? permanentNumber;
  final String? code;
  final String givenName;
  final String familyName;
  final DateTime dateOfBirth;
  @JsonKey(fromJson: _countryFromJson)
  final Country? nationality;

  final String name;
  @DataField(updatable: false)
  final String dateOfBirthFormatted;

  Driver({
    required this.driverId,
    required this.permanentNumber,
    required this.code,
    required this.givenName,
    required this.familyName,
    required this.url,
    required this.dateOfBirth,
    required this.nationality,
  })  : name = '$givenName $familyName',
        dateOfBirthFormatted = _birthDateFormat.format(dateOfBirth);

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);
}

Country? _countryFromJson(String? json) =>
    Countries.values.firstWhereOrNull((country) => country.nationality == json);

final _birthDateFormat = DateFormat.yMd();
