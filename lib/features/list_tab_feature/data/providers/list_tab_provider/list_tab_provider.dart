// Rss Item
// <item>
//   <title>Dodo e il sogno che si realizza: convocato nel Brasile. Volato d&amp;#x27;urgenza in Sudamerica</title>
//   <link>https://www.gazzetta.it/Calcio/Serie-A/Fiorentina/15-11-2024/dodo-brasile-convocazione-qualificazioni-mondiali.shtml</link>
//   <dc:creator>Ilaria Masini</dc:creator>
//   <pubDate>Fri, 15 Nov 2024 16:52:29 +0100</pubDate>
//   <category>Calcio/Serie A/Fiorentina</category>
//   <guid isPermaLink="true">https://www.gazzetta.it/Calcio/Serie-A/Fiorentina/15-11-2024/dodo-brasile-convocazione-qualificazioni-mondiali.shtml</guid>
//   <description>Il terzino viola è stato scelto dal ct Dorival Junior per sostituire lo squalificato Vanderson. Punterà a debuttare con i verdeoro nel match di qualificazione al Mondiale contro l&#x27;Uruguay</description>
//   <media:thumbnail url="https://dimages2.gazzettaobjects.it/files/image_640_384/uploads/2024/11/15/67376c9d3c31c.jpeg"></media:thumbnail>
// </item>

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_tab_provider.freezed.dart';
part 'list_tab_provider.g.dart';

@freezed
class RssFeedItem with _$RssFeedItem {
  const factory RssFeedItem({
    required String title,
    required String link,
    required String creator,
    required String pubDate,
    required String category,
    required String guid,
    required String description,
    required String thumbnailUrl,
  }) = _RssFeedItem;

  // TODO: add factory from xml
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
  FutureOr<ListItemWrapper> build() async {
    // TODO: implement build
    return const ListItemWrapper(items: []);
  }
}
