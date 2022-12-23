import 'package:flutter/material.dart';
import 'package:wcs_mobil/domain/entities/driver.dart';
import 'package:wcs_mobil/ui/driver/driver_profile.dart';

class DriverScreen extends StatelessWidget {
  final Driver driver;

  const DriverScreen({required this.driver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DriverProfile(driver: driver),
    );
  }
}
