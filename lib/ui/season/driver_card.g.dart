// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, type_annotate_public_apis

part of 'driver_card.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class _DriverCardInfoList extends StatelessWidget {
  const _DriverCardInfoList(
    this.driver,
    this.showCode, {
    Key? key,
  }) : super(key: key);

  final Driver driver;

  final bool showCode;

  @override
  Widget build(BuildContext _context) => __driverCardInfoList(
        _context,
        driver,
        showCode,
      );
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Driver>('driver', driver));
    properties.add(DiagnosticsProperty<bool>('showCode', showCode));
  }
}
