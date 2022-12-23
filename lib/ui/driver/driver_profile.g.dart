// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, type_annotate_public_apis

part of 'driver_profile.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class _ProfilePictureWidget extends ConsumerWidget {
  const _ProfilePictureWidget(
    this.driver, {
    Key? key,
  }) : super(key: key);

  final Driver driver;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __profilePictureWidget(
        _ref,
        driver,
      );
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Driver>('driver', driver));
  }
}

class _ImageLoadErrorWidget extends StatelessWidget {
  const _ImageLoadErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => __imageLoadErrorWidget(_context);
}

class _ImageEmptyWidget extends StatelessWidget {
  const _ImageEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => __imageEmptyWidget(_context);
}

class _ImageLoadingWidget extends StatelessWidget {
  const _ImageLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => __imageLoadingWidget();
}
