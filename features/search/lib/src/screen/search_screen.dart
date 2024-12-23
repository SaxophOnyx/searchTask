import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/search_bloc.dart';
import 'search_content.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (BuildContext context) => SearchBloc(
        searchBooksUseCase: appLocator(),
      ),
      child: const SearchContent(),
    );
  }
}
