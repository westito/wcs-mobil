import 'package:wcs_mobil/data/remote/rest_api_client.dart';
import 'package:wcs_mobil/domain/entities/driver.dart';
import 'package:wcs_mobil/domain/entities/season.dart';
import 'package:wcs_mobil/domain/repositories/data_repository.dart';
import 'package:wcs_mobil/utils/searchable_list.dart';

class RemoteDataRepository implements DataRepository {
  final RestApiClient _client;

  const RemoteDataRepository(this._client);

  @override
  Future<List<Season>> getSeasons() async {
    final response = await _client.getSeasons(limit: 100);
    return response.seasons.reversed.toList();
  }

  @override
  Future<List<Driver>> getDriversOfSeason(String season) async {
    final response = await _client.getDriversOfSeason(season, limit: 100);
    return SearchableList(response.drivers,
        (driver) => [driver.givenName, driver.familyName, driver.code]);
  }

  @override
  Future<String> getImageUrl(String searchTerm) {
    return _client.googleSearch(searchTerm).then((value) => value.imageUrl);
  }
}
