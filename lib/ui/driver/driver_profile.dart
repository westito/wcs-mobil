import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:wcs_mobil/domain/entities/driver.dart';
import 'package:wcs_mobil/domain/repositories/data_repository.dart';
import 'package:wcs_mobil/ui/season/driver_card.dart';
import 'package:wcs_mobil/ui/widgets/skeleton_loader.dart';
import 'package:wcs_mobil/ui/widgets/space.dart';
import 'package:wcs_mobil/utils/web_browser.dart';

part 'driver_profile.g.dart';

final _driverProfilePicture = FutureProvider.autoDispose.family<String, Driver>(
  (ref, driver) => ref.read(DataRepository.provider).getImageUrl(driver.name),
);

class DriverProfile extends ConsumerWidget {
  final Driver driver;

  const DriverProfile({required this.driver});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 180,
              height: 180,
              color: theme.colorScheme.surfaceVariant.withAlpha(40),
              child: _ProfilePictureWidget(driver),
            ),
          ),
          const VSpace(24),
          DriverCard(
            driver: driver,
            showCode: true,
            onTap: null,
            onInfoTap: () => WebBrowser.open(context, url: driver.url),
          ),
        ],
      ),
    );
  }
}

@cwidget
Widget __profilePictureWidget(WidgetRef ref, Driver driver) {
  final picture = ref.watch(_driverProfilePicture(driver));
  return picture.when(
    data: (imageUrl) => Image.network(
      imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (_, child, progress) =>
          progress == null ? child : const _ImageLoadingWidget(),
      errorBuilder: (_, error, ___) => imageUrl.isEmpty
          ? const _ImageEmptyWidget()
          : const _ImageLoadErrorWidget(),
    ),
    error: (_, __) => const _ImageLoadErrorWidget(),
    loading: () => const _ImageLoadingWidget(),
  );
}

@swidget
Widget __imageLoadErrorWidget(BuildContext context) {
  final theme = Theme.of(context);
  return Center(
    child: Icon(Icons.error, size: 48, color: theme.colorScheme.surfaceVariant),
  );
}

@swidget
Widget __imageEmptyWidget(BuildContext context) {
  final theme = Theme.of(context);
  return Center(
    child:
        Icon(Icons.person, size: 128, color: theme.colorScheme.surfaceVariant),
  );
}

@swidget
Widget __imageLoadingWidget() =>
    const SkeletonLoader(child: ColoredBox(color: Colors.white54));
