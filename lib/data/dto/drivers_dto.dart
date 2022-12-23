import 'package:json_annotation/json_annotation.dart';
import 'package:wcs_mobil/domain/entities/driver.dart';
import 'package:wcs_mobil/utils/json_map.dart';

part 'drivers_dto.g.dart';

@JsonSerializable(createToJson: false)
class DriversDto {
  @JsonKey(name: 'Drivers')
  final List<Driver> drivers;

  DriversDto({required this.drivers});

  factory DriversDto.fromJson(Map<String, dynamic> json) =>
      // ignore: avoid_dynamic_calls
      _$DriversDtoFromJson(json['MRData']['DriverTable'] as JSON);
}
