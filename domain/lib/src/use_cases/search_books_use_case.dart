import '../../domain.dart';
import 'use_case.dart';

class SearchBooksUseCase extends FutureUseCase<SearchBooksPayload, List<SearchItem>> {
  final BookRepository _bookRepository;

  SearchBooksUseCase({
    required BookRepository bookRepository,
  }) : _bookRepository = bookRepository;

  @override
  Future<List<SearchItem>> execute(SearchBooksPayload input) async {
    return _bookRepository.searchBooks(
      offset: input.offset,
      query: input.query,
    );
  }
}

class SearchBooksPayload {
  final int offset;
  final String query;

  const SearchBooksPayload({required this.offset, required this.query});
}
