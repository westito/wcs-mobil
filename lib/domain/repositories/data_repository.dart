import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcs_mobil/domain/entities/driver.dart';
import 'package:wcs_mobil/domain/entities/season.dart';
import 'package:wcs_mobil/utils/provider_override.dart';

abstract class DataRepository {
  static final provider = Provider<DataRepository>(needsOverride);

  FutureOr<List<Season>> getSeasons();
  FutureOr<List<Driver>> getDriversOfSeason(String season);
  FutureOr<String> getImageUrl(String searchTerm);
}
