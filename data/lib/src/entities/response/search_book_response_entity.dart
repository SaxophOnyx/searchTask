import 'package:core/core.dart';

import '../short_book_entity.dart';

part 'search_book_response_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SearchBookResponseEntity {
  final List<ShortBookEntity> docs;

  const SearchBookResponseEntity({
    required this.docs,
  });

  factory SearchBookResponseEntity.fromJson(Map<String, Object?> json) =>
      _$SearchBookResponseEntityFromJson(json);
}
