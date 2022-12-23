import 'package:json_annotation/json_annotation.dart';
import 'package:mek_data_class/mek_data_class.dart';

part 'season.g.dart';

@DataClass()
@JsonSerializable(createToJson: false)
class Season with _$Season {
  @JsonKey(name: 'season')
  final String year;
  final String url;

  const Season({
    required this.year,
    required this.url,
  });

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
}
