import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcs_mobil/data/mock/mock_data_repository.dart';
import 'package:wcs_mobil/domain/repositories/data_repository.dart';

mixin MockDatasource {
  static Override create() =>
      DataRepository.provider.overrideWithValue(const MockDataRepository());
}
