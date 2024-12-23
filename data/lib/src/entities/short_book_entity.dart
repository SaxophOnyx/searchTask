import 'package:core/core.dart';

part 'short_book_entity.g.dart';

@JsonSerializable()
class ShortBookEntity {
  final String key;
  final String title;

  const ShortBookEntity({
    required this.key,
    required this.title,
  });

  factory ShortBookEntity.fromJson(Map<String, Object?> json) => _$ShortBookEntityFromJson(json);
}
