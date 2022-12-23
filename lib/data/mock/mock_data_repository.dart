import 'package:country/country.dart';
import 'package:wcs_mobil/domain/entities/driver.dart';
import 'package:wcs_mobil/domain/entities/season.dart';
import 'package:wcs_mobil/domain/repositories/data_repository.dart';

class MockDataRepository implements DataRepository {
  const MockDataRepository();

  @override
  List<Season> getSeasons() {
    return const [
      Season(
          year: '1995',
          url: 'https://en.wikipedia.org/wiki/1995_Formula_One_season'),
      Season(
          year: '1996',
          url: 'https://en.wikipedia.org/wiki/1996_Formula_One_season'),
      Season(
          year: '1997',
          url: 'https://en.wikipedia.org/wiki/1997_Formula_One_season'),
      Season(
          year: '2001',
          url: 'https://en.wikipedia.org/wiki/2001_Formula_One_season'),
      Season(
          year: '2002',
          url: 'https://en.wikipedia.org/wiki/2002_Formula_One_season'),
      Season(
          year: '2003',
          url: 'https://en.wikipedia.org/wiki/2003_Formula_One_season'),
    ];
  }

  @override
  List<Driver> getDriversOfSeason(String season) {
    return [
      Driver(
        code: 'HAM',
        familyName: 'Hamilton',
        givenName: 'Lewis',
        permanentNumber: '44',
        url: 'https://en.wikipedia.org/wiki/Lewis_Hamilton',
        nationality: Countries.usa,
        dateOfBirth: DateTime.parse('1991-11-11'),
        driverId: 'hamilton',
      ),
      Driver(
        code: 'RAI',
        familyName: 'Räikkönen',
        givenName: 'Kimi',
        permanentNumber: '7',
        url: 'https://en.wikipedia.org/wiki/Kimi_R%C3%A4ikk%C3%B6nen',
        nationality: Countries.fin,
        dateOfBirth: DateTime.parse('1979-10-17'),
        driverId: 'raikkonen',
      ),
      Driver(
        code: 'BOT',
        familyName: 'Bottas',
        givenName: 'Valtteri',
        permanentNumber: '77',
        url: 'https://en.wikipedia.org/wiki/Valtteri_Bottas',
        nationality: Countries.fin,
        dateOfBirth: DateTime.parse('1989-08-28'),
        driverId: 'bottas',
      ),
      Driver(
        code: 'VER',
        familyName: 'Verstappen',
        givenName: 'Max',
        permanentNumber: '33',
        url: 'https://en.wikipedia.org/wiki/Max_Verstappen',
        nationality: Countries.bes,
        dateOfBirth: DateTime.parse('1997-09-30'),
        driverId: 'verstappen',
      ),
      Driver(
        code: 'PER',
        familyName: 'Perez',
        givenName: 'Sergio',
        permanentNumber: '11',
        url: 'https://en.wikipedia.org/wiki/Sergio_P%C3%A9rez',
        nationality: Countries.mex,
        dateOfBirth: DateTime.parse('1990-01-26'),
        driverId: 'perez',
      ),
      Driver(
        code: 'NOR',
        familyName: 'Norris',
        givenName: 'Lando',
        permanentNumber: '4',
        url: 'https://en.wikipedia.org/wiki/Lando_Norris',
        nationality: null,
        dateOfBirth: DateTime.parse('1999-11-13'),
        driverId: 'norris',
      ),
    ];
  }

  @override
  String getImageUrl(String searchTerm) {
    switch (searchTerm) {
      case 'Lewis Hamilton':
        return 'https://cdn-6.motorsport.com/images/mgl/0mb95oa2/s800/'
            'lewis-hamilton-mercedes-1.jpg';
      case 'Kimi Räikkönen':
        return 'https://cdn-2.motorsport.com/images/mgl/2jXOj4g6/s800/'
            'kimi-raikkonen-alfa-romeo-raci-1.jpg';
      case 'Valtteri Bottas':
        return 'https://upload.wikimedia.org/wikipedia/commons/thumb'
            '/3/3e/Valtteri_Bottas_2019_Malaysia_2.jpg'
            '/220px-Valtteri_Bottas_2019_Malaysia_2.jpg';
      case 'Max Verstappen':
        return 'https://cdn-2.motorsport.com/images/mgl/63vAdQEY/s800/'
            'valtteri-bottas-alfa-romeo-1.jpg';
      case 'Sergio Perez':
        return 'https://cdn-1.motorsport.com/images/mgl/0a9neZP0/s8/'
            'sergio-perez-red-bull-racing-1.jpg';
      default:
        return '';
    }
  }
}
