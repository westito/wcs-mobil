// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, type_annotate_public_apis

part of 'drivers_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriversDto _$DriversDtoFromJson(Map<String, dynamic> json) => DriversDto(
      drivers: (json['Drivers'] as List<dynamic>)
          .map((e) => Driver.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
