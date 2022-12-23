part of 'widgetbook.dart';

const _seasonStories = [
  Story(name: 'Seasons', builder: _season),
];

Widget _season(BuildContext context) {
  return _DefaultContainer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final season in _seasonList)
          SeasonCard(season: season, onTap: () {}, onInfoTap: () {}),
      ].spaceBetween(height: 16),
    ),
  );
}
