import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcs_mobil/application/wcs_mobil_app.dart';
import 'package:wcs_mobil/data/remote/remote_datasource.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSystemOverlay();

  const apiUrl = String.fromEnvironment('API_URL',
      defaultValue: 'https://ergast.com/api/f1');

  runApp(
    ProviderScope(
      overrides: [
        RemoteDatasource.create(apiUrl),
      ],
      child: WCSMobilApp(),
    ),
  );
}
