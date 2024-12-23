import 'package:auto_route/auto_route.dart';
import 'package:search/search.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        ...SearchRouter().routes,
      ];
}