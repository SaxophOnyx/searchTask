import 'package:core/core.dart';
import 'package:easy_infinite_pagination/easy_infinite_pagination.dart';
import 'package:flutter/material.dart';

import '../bloc/search_bloc.dart';
import '../widget/widget.dart';

class SearchContent extends StatefulWidget {
  const SearchContent({super.key});

  @override
  State<SearchContent> createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  bool _showScrollButton = false;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final bool shouldShow = _scrollController.offset > 5;
      if (shouldShow != _showScrollButton) {
        setState(() => _showScrollButton = shouldShow);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SearchBloc bloc = context.read();
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, SearchState state) {
        return Scaffold(
          floatingActionButton: Visibility(
            visible: _showScrollButton,
            child: FloatingActionButton(
                child: const Icon(Icons.arrow_upward),
                onPressed: () => _scrollController.animateTo(0,
                    curve: Curves.linear, duration: const Duration(milliseconds: 200))),
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SearchTextField(
                  controller: _searchController,
                  onChanged: (String value) {
                    if (!state.isLoading) {
                      _scrollController.animateTo(0,
                          curve: Curves.linear, duration: const Duration(milliseconds: 200));
                    }
                    bloc.add(UpdateQueryEvent(query: value));
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: <Widget>[
                        SliverToBoxAdapter(
                          child: ListTitleItem(
                            isVisible: state.searchHistoryItems.isNotEmpty,
                            title: LocaleKeys.common_history.tr(),
                          ),
                        ),
                        SliverList.separated(
                          separatorBuilder: (BuildContext context, int index) => const Divider(
                            height: 1,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            final int reversedIndex = state.searchHistoryItems.length - index - 1;
                            return ListItem(
                              title: state.searchHistoryItems[reversedIndex].query,
                              onTap: () => _onHistoryItemTap(bloc: bloc, index: reversedIndex),
                            );
                          },
                          itemCount: state.searchHistoryItems.length < 5
                              ? state.searchHistoryItems.length
                              : 5,
                        ),
                        SliverToBoxAdapter(
                          child: ListTitleItem(
                            isVisible: state.searchItems.isNotEmpty,
                            title: LocaleKeys.common_search_results.tr(),
                          ),
                        ),
                        state.isLoading
                            ? const SliverFillRemaining(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : SliverInfiniteListView.separated(
                                delegate: PaginationDelegate(
                                  fetchDataOnStart: false,
                                  isLoading: state.isLoading,
                                  hasError: state.errorMessage != null,
                                  hasReachedMax: state.listReachedMax,
                                  loadMoreErrorBuilder: (BuildContext context, _) {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(state.errorMessage.toString()),
                                        FilledButton(
                                          onPressed: () => bloc
                                              .add(LoadPageEvent(offset: state.searchItems.length)),
                                          child: Text(LocaleKeys.common_try_again.tr()),
                                        )
                                      ],
                                    );
                                  },
                                  firstPageErrorBuilder: (BuildContext context, _) {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(state.errorMessage.toString()),
                                        FilledButton(
                                          onPressed: () => bloc.add(LoadPageEvent(offset: 0)),
                                          child: Text(LocaleKeys.common_try_again.tr()),
                                        )
                                      ],
                                    );
                                  },
                                  itemCount: state.searchItems.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListItem(
                                      title: '${index + 1}. ${state.searchItems[index].title}',
                                    );
                                  },
                                  onFetchData: () => bloc.add(
                                    LoadPageEvent(offset: state.searchItems.length),
                                  ),
                                ),
                                separatorBuilder: (BuildContext context, int index) =>
                                    const Divider(
                                  height: 1,
                                ),
                              )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _onHistoryItemTap({required SearchBloc bloc, required int index}) {
    if (!bloc.state.isLoading) {
      _scrollController.animateTo(0,
          curve: Curves.linear, duration: const Duration(milliseconds: 200));
    }
    _searchController.text = bloc.state.searchHistoryItems[index].query;
    bloc.add(UpdateQueryEvent(query: bloc.state.searchHistoryItems[index].query));
  }
}
