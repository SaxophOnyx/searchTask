library search;

import 'package:navigation/navigation.dart';
export 'search.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|View,Route')
class SearchRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(
      initial: true,
      page: SearchRoute.page,
      path: RoutePath.home,
    )
  ];
}
