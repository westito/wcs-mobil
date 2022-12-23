import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLoader extends StatelessWidget {
  final Widget child;

  const SkeletonLoader({required this.child});

  @override
  Widget build(BuildContext context) {
    final baseColor =
        Theme.of(context).colorScheme.surfaceVariant.withAlpha(40);
    final highlightColor =
        Theme.of(context).colorScheme.surfaceVariant.withAlpha(80);

    return Shimmer(
      period: const Duration(milliseconds: 1000),
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            baseColor,
            baseColor,
            highlightColor,
            baseColor,
            baseColor
          ],
          stops: const <double>[
            0.0,
            0.35,
            0.5,
            0.65,
            1.0
          ]),
      child: child,
    );
  }
}

class SkeletonListLoader extends StatelessWidget {
  final Widget child;

  const SkeletonListLoader({required this.child});

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, __) => child,
        itemCount: 5,
      ),
    );
  }
}
