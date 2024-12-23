import 'package:core/core.dart';

class SearchItem extends Equatable {
  final String id;
  final String title;

  const SearchItem({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => <Object?>[id, title];
}
