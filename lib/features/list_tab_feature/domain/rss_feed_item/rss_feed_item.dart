import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html_unescape/html_unescape.dart';
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
    final htmlUnscape = HtmlUnescape();

    final title = element.findElements('title').first.firstChild?.value;
    final escapedTitle = htmlUnscape.convert(title ?? '-');

    final link = element.findElements('link').first.firstChild?.value;
    final creator = element.findElements('dc:creator').first.firstChild?.value;
    final pubDate = element.findElements('pubDate').first.firstChild?.value;
    final category = element.findElements('category').first.firstChild?.value;
    final guid = element.findElements('guid').first.firstChild?.value;

    final description =
        element.findElements('description').first.firstChild?.value;
    final escapedDescription = htmlUnscape.convert(description ?? '-');

    final thumbnailUrl =
        element.findElements('media:thumbnail').first.getAttribute('url');

    return RssFeedItem(
      title: escapedTitle,
      link: link,
      creator: creator,
      pubDate: pubDate,
      category: category,
      guid: guid,
      description: escapedDescription,
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
