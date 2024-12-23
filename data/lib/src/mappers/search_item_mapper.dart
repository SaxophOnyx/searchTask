import 'package:domain/domain.dart';

import '../../data.dart';

abstract class SearchItemMapper {
  static List<SearchItem> fromBookEntity(SearchBookResponseEntity entity) {
    return entity.docs
        .map(
          (ShortBookEntity shortBookEntity) => SearchItem(
            id: shortBookEntity.key,
            title: shortBookEntity.title,
          ),
        )
        .toList();
  }

}
