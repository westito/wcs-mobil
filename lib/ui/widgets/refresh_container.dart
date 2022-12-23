import 'package:flutter/material.dart';

class RefreshContainer extends StatelessWidget {
  final VoidCallback onRefresh;
  final Widget child;

  const RefreshContainer({
    required this.onRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: child is ScrollView
          ? child
          : CustomScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              slivers: <Widget>[
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: child),
                ),
              ],
            ),
    );
  }
}
