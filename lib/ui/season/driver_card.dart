import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:wcs_mobil/domain/entities/driver.dart';
import 'package:wcs_mobil/ui/widgets/space.dart';

part 'driver_card.g.dart';

class DriverCard extends StatelessWidget {
  final Driver driver;
  final bool showCode;
  final VoidCallback? onTap;
  final VoidCallback onInfoTap;

  DriverCard({
    required this.driver,
    required this.showCode,
    required this.onTap,
    required this.onInfoTap,
  }) : super(key: ValueKey(driver.driverId));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Hero(
      tag: 'driver_${driver.driverId}',
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.only(bottom: 12),
        child: InkWell(
          onTap: onTap,
          child: IntrinsicHeight(
            child: Row(
              children: [
                /// Permanent Number Indicator
                Container(
                  width: 42,
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(top: 6),
                  color: theme.colorScheme.secondaryContainer,
                  child: Text(
                    '${driver.permanentNumber ?? ''}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      /// Info List
                      _DriverCardInfoList(driver, showCode),

                      /// Info Button
                      Container(
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.only(
                            top: 48, right: 12, bottom: 12),
                        child: OutlinedButton(
                          onPressed: onInfoTap,
                          child: const Text('Info'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

@swidget
Widget __driverCardInfoList(
    BuildContext context, Driver driver, bool showCode) {
  final theme = Theme.of(context);
  return Padding(
    padding: const EdgeInsets.only(left: 14, top: 6, right: 12, bottom: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                '${driver.name}',
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: theme.textTheme.headline5,
              ),
            ),
            Text(
              '  ${driver.nationality?.flagEmoji ?? ''}',
              style: theme.textTheme.headline5,
            ),
          ],
        ),
        Text(
          '${driver.dateOfBirthFormatted}',
          style: theme.textTheme.subtitle1
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const Spacer(),
        if (showCode)
          Text(
            '${driver.code}',
            style: theme.textTheme.headline5
                ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
      ],
    ),
  );
}

class DriverCardSkeleton extends StatelessWidget {
  const DriverCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white54,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                ColoredBox(
                  color: Colors.white,
                  child: Text(
                    '9999',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                const Spacer(),
              ],
            ),
            const VSpace(8),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Info'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
