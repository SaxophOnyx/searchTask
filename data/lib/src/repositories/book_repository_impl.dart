import 'package:domain/domain.dart';

import '../../data.dart';
import '../providers/shared/api/http/request/http_method.dart';

class BookRepositoryImpl implements BookRepository {
  final ApiProvider _apiProvider;

  BookRepositoryImpl({
    required ApiProvider apiProvider,
  }) : _apiProvider = apiProvider;

  @override
  Future<List<SearchItem>> searchBooks({required String query, required int offset}) async {
    final SearchBookResponseEntity result = await _apiProvider.object(
      request: ApiRequest(
        method: HttpMethod.get,
        url: ApiConstants.searchBooksPath,
        params: <String, dynamic>{
          'q': query,
          'sort': 'title',
          'offset': offset,
          'fields': 'key,title',
          'limit': ApiConstants.searchLimit,
        },
      ),
      parser: SearchBookResponseEntity.fromJson,
    );
    return SearchItemMapper.fromBookEntity(result);
  }
}
