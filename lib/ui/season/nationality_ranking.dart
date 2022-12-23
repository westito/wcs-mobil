import 'package:collection/collection.dart';
import 'package:country/country.dart';
import 'package:flutter/material.dart';
import 'package:wcs_mobil/domain/entities/driver.dart';

class NationalityRanking extends StatelessWidget {
  final List<MapEntry<Country, int>> ranking;

  NationalityRanking(List<Driver> drivers)
      : ranking = drivers
            .where((e) => e.nationality != null)
            .groupFoldBy<Country, int>(
                (e) => e.nationality!, (sum, value) => (sum ?? 0) + 1)
            .entries
            .sortedBy<num>((e) => -e.value);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 42, vertical: 12),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 16),
        child: Column(
          children: [
            for (final entry in ranking)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${entry.key.flagEmoji}  ${entry.key.nationality}',
                        style: theme.textTheme.headline6,
                      ),
                    ),
                    Text(
                      '${entry.value}',
                      style: theme.textTheme.headline5,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
