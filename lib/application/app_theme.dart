import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final _appThemeDark = AppTheme.create(
  const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFABC7FF),
    onPrimary: Color(0xFF002F66),
    primaryContainer: Color(0xFF04458E),
    onPrimaryContainer: Color(0xFFD7E2FF),
    secondary: Color(0xFFBEC6DC),
    onSecondary: Color(0xFF283041),
    secondaryContainer: Color(0xFF3E4759),
    onSecondaryContainer: Color(0xFFDAE2F9),
    tertiary: Color(0xFFFFB3B1),
    onTertiary: Color(0xFF680012),
    tertiaryContainer: Color(0xFF8B1623),
    onTertiaryContainer: Color(0xFFFFDAD8),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1A1B1F),
    onBackground: Color(0xFFE3E2E6),
    surface: Color(0xFF1A1B1F),
    onSurface: Color(0xFFE3E2E6),
    surfaceVariant: Color(0xFF44474E),
    onSurfaceVariant: Color(0xFFC4C6D0),
    outline: Color(0xFF8E9099),
    onInverseSurface: Color(0xFF1A1B1F),
    inverseSurface: Color(0xFFE3E2E6),
    inversePrimary: Color(0xFF2C5DA7),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFABC7FF),
  ),
);

ThemeData get appThemeDark =>
    _appThemeDark.themeData.copyWith(extensions: [_appThemeDark]);

class AppTheme extends ThemeExtension<AppTheme> {
  final ColorScheme colorScheme;
  final ThemeData themeData;

  final ButtonStyle filledButtonStyle;

  const AppTheme._({
    required this.colorScheme,
    required this.themeData,
    required this.filledButtonStyle,
  });

  factory AppTheme.create(ColorScheme colorScheme) {
    return AppTheme._(
      colorScheme: colorScheme,
      themeData: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        brightness: Brightness.dark,
        appBarTheme:
            const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
        scaffoldBackgroundColor: colorScheme.background,
      ),
      filledButtonStyle: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.onSecondary,
      ),
    );
  }

  @override
  ThemeExtension<AppTheme> copyWith() => this;

  @override
  ThemeExtension<AppTheme> lerp(ThemeExtension<AppTheme>? other, double t) =>
      this;

  static AppTheme of(BuildContext context) =>
      Theme.of(context).extension<AppTheme>()!;
}
