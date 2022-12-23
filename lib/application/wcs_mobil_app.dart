import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wcs_mobil/application/app_theme.dart';
import 'package:wcs_mobil/domain/entities/driver.dart';
import 'package:wcs_mobil/ui/driver/driver_screen.dart';
import 'package:wcs_mobil/ui/home/home_screen.dart';
import 'package:wcs_mobil/ui/season/season_screen.dart';

class WCSMobilApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.read(_routerProvider),
      theme: appThemeDark,
    );
  }
}

final _routerProvider = Provider((ref) {
  return GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/season/:year',
        builder: (context, state) => SeasonScreen(year: state.params['year']!),
      ),
      GoRoute(
        path: '/season/:year/driver/:name',
        builder: (context, state) =>
            DriverScreen(driver: state.extra! as Driver),
      ),
    ],
  );
});

Future<void> initSystemOverlay() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
}
