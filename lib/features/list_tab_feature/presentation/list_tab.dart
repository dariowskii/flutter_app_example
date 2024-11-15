import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sisal/features/list_tab_feature/data/providers/list_tab_provider/list_tab_provider.dart';
import 'package:sisal/features/list_tab_feature/presentation/rss_feed_item_card.dart';

class ListTab extends ConsumerWidget {
  const ListTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncList = ref.watch(listTabProvider).unwrapPrevious();
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        ref.invalidate(listTabProvider);
      },
      child: switch (asyncList) {
        AsyncData(:final value) => ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: value.items.length,
            itemBuilder: (context, index) {
              final item = value.items[index];
              return RssFeedItemCard(rssFeedItem: item);
            },
          ),
        AsyncError(:final error) => Center(
            child: Text('Error: $error'),
          ),
        _ => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
      },
    );
  }
}
