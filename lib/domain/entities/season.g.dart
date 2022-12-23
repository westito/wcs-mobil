// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, type_annotate_public_apis

part of 'season.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

// ignore_for_file: annotate_overrides, unused_element

mixin _$Season {
  Season get _self => this as Season;

  String toString() => (ClassToString('Season')
        ..add('year', _self.year)
        ..add('url', _self.url))
      .toString();

  Season copyWith({
    String? year,
    String? url,
  }) {
    return Season(
      year: year ?? _self.year,
      url: url ?? _self.url,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Season _$SeasonFromJson(Map<String, dynamic> json) => Season(
      year: json['season'] as String,
      url: json['url'] as String,
    );
