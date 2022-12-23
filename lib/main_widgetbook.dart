import 'package:flutter/material.dart';
import 'package:wcs_mobil/application/wcs_mobil_app.dart';
import 'package:wcs_mobil/widgetbook/widgetbook.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSystemOverlay();

  runApp(WidgetbookApp());
}
