import 'package:core/core.dart';
import 'package:domain/domain.dart';
import '../model/search_history_item.dart';

part 'search_bloc.freezed.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchBooksUseCase _searchBooksUseCase;
  final List<SearchHistoryItem> _searchHistory = <SearchHistoryItem>[];

  SearchBloc({
    required SearchBooksUseCase searchBooksUseCase,
  })  : _searchBooksUseCase = searchBooksUseCase,
        super(SearchState.initial()) {
    on<LoadPageEvent>(_onLoadPageEvent);
    on<HandleErrorEvent>(_handleError);
    on<UpdateQueryEvent>(_onUpdateQuery);
    on<SearchQueryEvent>(
      _onSearchQuery,
      transformer: BlocUtils.searchTransformer(),
    );
  }

  Future<void> _onLoadPageEvent(
    LoadPageEvent event,
    Emitter<SearchState> emit,
  ) async {
    final List<SearchItem> res = await _searchBooksUseCase.execute(
      SearchBooksPayload(
        offset: event.offset,
        query: state.lastQuery,
      ),
    );
    final List<SearchItem> newList = state.searchItems + res;
    emit(
      state.copyWith(
        listReachedMax: res.isEmpty,
        searchItems: newList,
        errorMessage: null,
        isLoading: false,
      ),
    );
  }

  Future<void> _onUpdateQuery(
    UpdateQueryEvent event,
    Emitter<SearchState> emit,
  ) async {
    add(SearchQueryEvent(query: event.query));
    emit(state.copyWith(
      searchHistoryItems: _searchHistory
          .where((SearchHistoryItem item) =>
              item.query.toLowerCase() != event.query.toLowerCase() &&
              item.query.toLowerCase().contains(event.query.toLowerCase()))
          .toList(),
    ));
  }

  Future<void> _handleError(
    HandleErrorEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: false,
      errorMessage: event.message,
    ));
  }

  Future<void> _onSearchQuery(
    SearchQueryEvent event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(state.copyWith(
        searchItems: <SearchItem>[],
        searchHistoryItems: _searchHistory,
      ));
      return;
    }
    emit(state.copyWith(isLoading: true));
    final List<SearchItem> res = await _searchBooksUseCase.execute(
      SearchBooksPayload(offset: 0, query: event.query),
    );
    _searchHistory.addNew(SearchHistoryItem(query: event.query.trim()));
    emit(
      state.copyWith(
        isLoading: false,
        searchItems: res,
        errorMessage: null,
        listReachedMax: false,
        lastQuery: event.query,
      ),
    );
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(HandleErrorEvent(message: LocaleKeys.common_error_message.tr()));
    super.onError(error, stackTrace);
  }
}
