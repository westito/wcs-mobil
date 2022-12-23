part of 'widgetbook.dart';

const _driverStories = [
  Story(name: 'Drivers', builder: _drivers),
];

Widget _drivers(BuildContext context) {
  return _DefaultContainer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DriverCard(
          driver: _driverList[0],
          showCode: false,
          onTap: () {},
          onInfoTap: () {},
        ),
        DriverCard(
          driver: _driverList[1],
          showCode: true,
          onTap: () {},
          onInfoTap: () {},
        ),
        DriverCard(
          driver: _driverList[2].copyWith(familyName: 'With Very Long Name'),
          showCode: true,
          onTap: () {},
          onInfoTap: () {},
        ),
        DriverCard(
          driver: _driverList[5].copyWith(familyName: 'No Country'),
          showCode: true,
          onTap: () {},
          onInfoTap: () {},
        ),
      ].spaceBetween(height: 16),
    ),
  );
}
