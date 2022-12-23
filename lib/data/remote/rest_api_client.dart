import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wcs_mobil/data/dto/drivers_dto.dart';
import 'package:wcs_mobil/data/dto/google_dto.dart';
import 'package:wcs_mobil/data/dto/seasons_dto.dart';

part 'rest_api_client.g.dart';

@RestApi()
abstract class RestApiClient {
  factory RestApiClient(Dio dio, {String baseUrl}) = _RestApiClient;

  @GET('/seasons.json')
  Future<SeasonsDto> getSeasons({@Query('limit') int limit = 100});

  @GET('/{season}/drivers.json')
  Future<DriversDto> getDriversOfSeason(
    @Path('season') String season, {
    @Query('limit') int limit = 100,
  });

  @GET('https://www.googleapis.com/customsearch/v1'
      '?key=AIzaSyADx9HTfg1vEtKt2KllxBhwpjB5qUvO52k'
      '&cx=000213537299717655806:fsqehiydnxg'
      '&q={searchTerms}')
  Future<GoogleDto> googleSearch(@Path('searchTerms') String searchTerm);
}
