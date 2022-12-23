import 'package:flutter/material.dart';
import 'package:wcs_mobil/application/app_theme.dart';
import 'package:wcs_mobil/domain/entities/season.dart';
import 'package:wcs_mobil/ui/widgets/space.dart';

class SeasonCard extends StatelessWidget {
  final Season season;
  final VoidCallback onTap;
  final VoidCallback onInfoTap;

  SeasonCard({
    required this.season,
    required this.onTap,
    required this.onInfoTap,
  }) : super(key: ValueKey(season.year));

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${season.year}',
                style: Theme.of(context).textTheme.headline3,
              ),
              const VSpace(8),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: onInfoTap,
                  style: AppTheme.of(context).filledButtonStyle,
                  child: const Text('Info'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeasonCardSkeleton extends StatelessWidget {
  const SeasonCardSkeleton({Key? key}) : super(key: key);

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
                    '0000',
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
