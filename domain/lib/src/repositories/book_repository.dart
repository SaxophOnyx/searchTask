import '../../domain.dart';

abstract interface class BookRepository {
  Future<List<SearchItem>> searchBooks({required String query, required int offset});
}
