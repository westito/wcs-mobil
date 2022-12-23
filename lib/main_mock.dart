import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcs_mobil/application/wcs_mobil_app.dart';
import 'package:wcs_mobil/data/mock/mock_datasource.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSystemOverlay();

  runApp(
    ProviderScope(
      overrides: [
        MockDatasource.create(),
      ],
      child: WCSMobilApp(),
    ),
  );
}
