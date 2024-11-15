import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xml/xml.dart';

part 'rss_feed_item.freezed.dart';

@freezed
class RssFeedItem with _$RssFeedItem {
  const RssFeedItem._();

  const factory RssFeedItem({
    String? title,
    String? link,
    String? creator,
    String? pubDate,
    String? category,
    String? guid,
    String? description,
    String? thumbnailUrl,
  }) = _RssFeedItem;

  factory RssFeedItem.fromXml(XmlElement element) {
    final title = element.findElements('title').first.value;
    final link = element.findElements('link').first.value;
    final creator = element.findElements('dc:creator').first.value;
    final pubDate = element.findElements('pubDate').first.value;
    final category = element.findElements('category').first.value;
    final guid = element.findElements('guid').first.value;
    final description = element.findElements('description').first.value;
    final thumbnailUrl =
        element.findElements('media:thumbnail').first.getAttribute('url');

    return RssFeedItem(
      title: title,
      link: link,
      creator: creator,
      pubDate: pubDate,
      category: category,
      guid: guid,
      description: description,
      thumbnailUrl: thumbnailUrl,
    );
  }

  String get croppedDescription {
    const maxLength = 50;
    if (description == null) return '...';

    return description!.length > maxLength
        ? '${description!.substring(0, maxLength)}...'
        : description!;
  }
}
