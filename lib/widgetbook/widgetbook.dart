import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:wcs_mobil/application/app_theme.dart';
import 'package:wcs_mobil/data/mock/mock_data_repository.dart';
import 'package:wcs_mobil/ui/home/season_card.dart';
import 'package:wcs_mobil/ui/season/driver_card.dart';
import 'package:wcs_mobil/ui/season/nationality_ranking.dart';
import 'package:wcs_mobil/ui/widgets/space.dart';

part 'drivers_story.dart';
part 'ranking_story.dart';
part 'seasons_story.dart';

final _driverList = const MockDataRepository().getDriversOfSeason('1995');
final _seasonList = const MockDataRepository().getSeasons();

class WidgetbookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _widgetbookTheme,
      child: Storybook(
        initialStory: 'Drivers',
        plugins: _plugins,
        stories: const [
          ..._seasonStories,
          ..._driverStories,
          ..._rankingStories,
        ],
        wrapperBuilder: (context, child) {
          return MaterialApp(
            theme: appThemeDark,
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            home: Builder(builder: (context) {
              final theme = AppTheme.of(context);
              return Scaffold(
                backgroundColor: theme.colorScheme.surface,
                body: child,
              );
            }),
          );
        },
      ),
    );
  }
}

final _plugins = initializePlugins(
  enableThemeMode: false,
  enableDeviceFrame: false,
  knobsSidePanel: false,
  contentsSidePanel: false,
  enableContents: true,
  enableKnobs: false,
);

final _widgetbookTheme = ThemeData.from(
  colorScheme: const ColorScheme.dark(
    primary: Colors.white,
    secondary: Colors.amber,
    secondaryContainer: Colors.amber,
  ),
);

class _DefaultContainer extends StatelessWidget {
  final Widget child;

  const _DefaultContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: child,
      ),
    );
  }
}
