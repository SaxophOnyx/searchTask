import 'package:core/core.dart';

class SearchHistoryItem extends Equatable{
  final String query;

  const SearchHistoryItem({
    required this.query,
  });

  @override
  List<Object?> get props => <Object?>[query];
}
