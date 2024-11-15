import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sisal/features/list_tab_feature/data/list_tab_repository/list_tab_repository.dart';
import 'package:xml/xml.dart';

part 'list_tab_provider.freezed.dart';
part 'list_tab_provider.g.dart';

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

@freezed
class ListItemWrapper with _$ListItemWrapper {
  const factory ListItemWrapper({
    required List<RssFeedItem> items,
  }) = _ListItemWrapper;
}

@riverpod
class ListTab extends _$ListTab {
  @override
  FutureOr<ListItemWrapper> build() async => fetch();

  FutureOr<ListItemWrapper> fetch() async {
    final rss = await ref.read(rssProvider.future);
    final parsedXml = XmlDocument.parse(rss);

    final items =
        parsedXml.findAllElements('item').map(RssFeedItem.fromXml).toList();

    return ListItemWrapper(items: items);
  }
}
