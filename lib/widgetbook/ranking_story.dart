part of 'widgetbook.dart';

const _rankingStories = [
  Story(name: 'Ranking', builder: _rankings),
];

Widget _rankings(BuildContext context) {
  return _DefaultContainer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NationalityRanking([
          _driverList[0],
          _driverList[1],
          _driverList[2],
          _driverList[3],
          _driverList[4],
          _driverList[5],
        ]),
      ].spaceBetween(height: 16),
    ),
  );
}
