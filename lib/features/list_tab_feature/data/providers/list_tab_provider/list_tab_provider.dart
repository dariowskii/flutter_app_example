import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sisal/features/list_tab_feature/data/list_tab_repository/list_tab_repository.dart';
import 'package:sisal/features/list_tab_feature/domain/rss_feed_item/rss_feed_item.dart';
import 'package:xml/xml.dart';

part 'list_tab_provider.freezed.dart';
part 'list_tab_provider.g.dart';

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
