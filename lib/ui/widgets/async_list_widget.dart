import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcs_mobil/ui/widgets/load_error_widget.dart';
import 'package:wcs_mobil/ui/widgets/refresh_container.dart';
import 'package:wcs_mobil/ui/widgets/skeleton_loader.dart';
import 'package:wcs_mobil/utils/searchable_list.dart';

typedef AsyncListWidgetItemBuilder<T> = Widget Function(
    BuildContext context, T value);

typedef AsyncListFooterItemBuilder<T> = Widget Function(
    BuildContext context, List<T> items);

class AsyncListWidget<T> extends StatefulWidget {
  final String title;
  final AsyncValue<List<T>> data;
  final bool searchable;
  final Widget skeletonItem;
  final VoidCallback onRefresh;
  final AsyncListWidgetItemBuilder<T> itemBuilder;
  final AsyncListFooterItemBuilder<T>? footerItemBuilder;

  const AsyncListWidget({
    required this.title,
    required this.data,
    required this.searchable,
    required this.skeletonItem,
    required this.onRefresh,
    required this.itemBuilder,
    this.footerItemBuilder,
  });

  @override
  State<AsyncListWidget<T>> createState() => _AsyncListWidgetState<T>();
}

class _AsyncListWidgetState<T> extends State<AsyncListWidget<T>> {
  bool searchMode = false;
  String searchPhrase = '';

  bool setSearchMode(bool value) {
    if (widget.searchable && searchMode != value) {
      setState(() {
        searchMode = value;
        searchPhrase = '';
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async => setSearchMode(false),
      child: RefreshContainer(
        onRefresh: () {
          setSearchMode(false);
          widget.onRefresh();
        },
        child: CustomScrollView(
          physics: widget.data.isLoading
              ? const NeverScrollableScrollPhysics()
              : const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            /// App Bar
            if (widget.data.hasValue && searchMode)
              _buildSearchModeAppBar(theme)
            else
              _buildNormalAppBar(theme),

            /// Sliver List
            SliverPadding(
              padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
              sliver: widget.data.when(
                skipLoadingOnRefresh: false,

                /// Data
                data: (seasons) {
                  final filtered = searchMode && searchPhrase.isNotEmpty
                      ? (seasons as SearchableList<T>)
                          .filter(searchPhrase.toLowerCase())
                      : seasons;
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          widget.itemBuilder(context, filtered[index]),
                      childCount: filtered.length,
                    ),
                  );
                },

                /// Loading
                loading: () => SliverToBoxAdapter(
                  child: SkeletonListLoader(child: widget.skeletonItem),
                ),

                /// Error
                error: (error, stackTrace) => SliverFillRemaining(
                  hasScrollBody: false,
                  child: LoadErrorWidget(error, stackTrace,
                      onRetry: widget.onRefresh),
                ),
              ),
            ),

            /// Footer
            if (!searchMode &&
                widget.footerItemBuilder != null &&
                widget.data.hasValue)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                  child: widget.footerItemBuilder!(
                      context, widget.data.requireValue),
                ),
              )
          ],
        ),
      ),
    );
  }

  /// Search Mode App Bar
  Widget _buildSearchModeAppBar(ThemeData theme) {
    return SliverAppBar(
      pinned: true,
      forceElevated: true,
      actions: [
        IconButton(
          onPressed: () => setSearchMode(false),
          icon: const Icon(Icons.search),
        ),
      ],
      title: TextField(
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
        ),
        style: theme.textTheme.bodyText1,
        textInputAction: TextInputAction.search,
        onSubmitted: (_) => setSearchMode(false),
        onChanged: (value) => setState(() => searchPhrase = value),
      ),
    );
  }

  /// Normal App Bar
  Widget _buildNormalAppBar(ThemeData theme) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 100,
      collapsedHeight: 56,
      actions: [
        if (widget.searchable)
          IconButton(
            onPressed: () => setSearchMode(true),
            icon: const Icon(Icons.search),
          ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.only(bottom: 10),
        title: Text('${widget.title}', style: theme.textTheme.headline4),
      ),
    );
  }
}
