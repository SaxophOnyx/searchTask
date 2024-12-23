import 'package:core/core.dart';

import '../../domain.dart';

final class DomainDI {
  static void initDependencies(GetIt locator) {
    _initUseCases(locator);
  }

  static void _initUseCases(GetIt locator) {
    locator.registerLazySingleton<SearchBooksUseCase>(
      () => SearchBooksUseCase(bookRepository: appLocator()),
    );
  }
}
