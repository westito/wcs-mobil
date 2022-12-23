import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wcs_mobil/domain/entities/season.dart';
import 'package:wcs_mobil/domain/repositories/data_repository.dart';
import 'package:wcs_mobil/ui/home/season_card.dart';
import 'package:wcs_mobil/ui/widgets/async_list_widget.dart';
import 'package:wcs_mobil/utils/web_browser.dart';

final _seasonListProvider = FutureProvider<List<Season>>(
    (ref) => ref.watch(DataRepository.provider).getSeasons());

class HomeScreen extends ConsumerWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seasonList = ref.watch(_seasonListProvider);
    return Scaffold(
      body: AsyncListWidget(
        title: 'Seasons',
        data: seasonList,
        searchable: false,
        skeletonItem: const SeasonCardSkeleton(),
        onRefresh: () => ref.invalidate(_seasonListProvider),
        itemBuilder: (context, season) => SeasonCard(
          season: season,
          onTap: () => context.push('/season/${season.year}'),
          onInfoTap: () => WebBrowser.open(context, url: season.url),
        ),
      ),
    );
  }
}
