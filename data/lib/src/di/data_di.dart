import 'package:core/core.dart';
import 'package:domain/domain.dart';
import '../../data.dart';

final class DataDI {
  static void initDependencies(GetIt locator) {
    _initApi(locator);
    _initRepositories(locator);
  }

  static void _initApi(GetIt locator) {
    locator.registerLazySingleton<DioConfig>(
      () => DioConfig(
        appConfig: locator<AppConfig>(),
      ),
    );
    locator.registerLazySingleton<ApiProvider>(
      () => ApiProvider(
        dio: locator<DioConfig>().dio,
        listResultField: ApiConstants.listResponseField,
      ),
    );
  }

  static void _initRepositories(GetIt locator) {
    locator.registerLazySingleton<BookRepository>(
      () => BookRepositoryImpl(
        apiProvider: appLocator(),
      ),
    );
  }
}
