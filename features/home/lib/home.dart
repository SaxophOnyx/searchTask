library home;

import 'package:navigation/navigation.dart';
export 'home.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|View,Route')
class HomeRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(
      initial: true,
      page: HomeRoute.page,
      path: RoutePath.home,
    )
  ];
}
