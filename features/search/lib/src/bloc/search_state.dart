part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required bool isLoading,
    required String lastQuery,
    required bool listReachedMax,
    required List<SearchItem> searchItems,
    required List<SearchHistoryItem> searchHistoryItems,
    String? errorMessage,
  }) = _SearchState;

  factory SearchState.initial() {
    return const SearchState(
      lastQuery: '',
      isLoading: false,
      listReachedMax: false,
      searchItems: <SearchItem>[],
      searchHistoryItems: <SearchHistoryItem>[],
    );
  }
}
