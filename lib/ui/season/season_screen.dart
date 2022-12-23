import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wcs_mobil/domain/entities/driver.dart';
import 'package:wcs_mobil/domain/repositories/data_repository.dart';
import 'package:wcs_mobil/ui/season/driver_card.dart';
import 'package:wcs_mobil/ui/season/nationality_ranking.dart';
import 'package:wcs_mobil/ui/widgets/async_list_widget.dart';
import 'package:wcs_mobil/utils/web_browser.dart';

part 'season_screen.g.dart';

@riverpod
class _SeasonScreenController extends _$SeasonScreenController {
  List<Driver> drivers = [];

  @override
  FutureOr<List<Driver>> build(String year) async {
    return drivers =
        await ref.read(DataRepository.provider).getDriversOfSeason(year);
  }
}

class SeasonScreen extends ConsumerWidget {
  final String year;

  const SeasonScreen({required this.year});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final driverList = ref.watch(_seasonScreenControllerProvider(year));
    return Scaffold(
      body: AsyncListWidget(
        title: '$year',
        data: driverList,
        searchable: true,
        skeletonItem: const DriverCardSkeleton(),
        onRefresh: () => ref.invalidate(_seasonScreenControllerProvider),
        itemBuilder: (context, driver) => DriverCard(
          driver: driver,
          showCode: false,
          onTap: () => context.push('/season/$year/driver/${driver.driverId}',
              extra: driver),
          onInfoTap: () => WebBrowser.open(context, url: driver.url),
        ),
        footerItemBuilder: (_, items) => NationalityRanking(items),
      ),
    );
  }
}
