// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, type_annotate_public_apis

part of 'seasons_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonsDto _$SeasonsDtoFromJson(Map<String, dynamic> json) => SeasonsDto(
      seasons: (json['Seasons'] as List<dynamic>)
          .map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
