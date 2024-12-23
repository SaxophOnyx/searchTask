part of 'search_bloc.dart';

abstract class SearchEvent {
  const SearchEvent();
}

class UpdateQueryEvent extends SearchEvent {
  final String query;

  UpdateQueryEvent({required this.query});
}

class SearchQueryEvent extends SearchEvent {
  final String query;

  SearchQueryEvent({required this.query});
}

class LoadPageEvent extends SearchEvent {
  final int offset;

  LoadPageEvent({required this.offset});
}

class HandleErrorEvent extends SearchEvent {
  final String message;

  HandleErrorEvent({required this.message});
}
