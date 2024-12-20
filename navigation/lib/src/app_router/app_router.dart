import 'package:auto_route/auto_route.dart';
import 'package:home/home.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        ...HomeRouter().routes,
      ];
}