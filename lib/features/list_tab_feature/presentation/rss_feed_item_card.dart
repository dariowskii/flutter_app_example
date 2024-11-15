import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sisal/features/list_tab_feature/domain/rss_feed_item/rss_feed_item.dart';

class RssFeedItemCard extends StatelessWidget {
  final RssFeedItem rssFeedItem;

  const RssFeedItemCard({
    super.key,
    required this.rssFeedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [
            if (rssFeedItem.thumbnailUrl != null) ...[
              SizedBox(
                width: double.infinity,
                height: 150,
                child: CachedNetworkImage(
                  imageUrl: rssFeedItem.thumbnailUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ],
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rssFeedItem.title ?? '-',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    rssFeedItem.croppedDescription,
                    style: Theme.of(context).textTheme.bodySmall,
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
