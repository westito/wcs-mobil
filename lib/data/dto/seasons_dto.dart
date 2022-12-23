import 'package:json_annotation/json_annotation.dart';
import 'package:wcs_mobil/domain/entities/season.dart';
import 'package:wcs_mobil/utils/json_map.dart';

part 'seasons_dto.g.dart';

@JsonSerializable(createToJson: false)
class SeasonsDto {
  @JsonKey(name: 'Seasons')
  final List<Season> seasons;

  SeasonsDto({required this.seasons});

  factory SeasonsDto.fromJson(Map<String, dynamic> json) =>
      // ignore: avoid_dynamic_calls
      _$SeasonsDtoFromJson(json['MRData']['SeasonTable'] as JSON);
}
