import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'error_handler/constants/snack_align.dart';
import 'error_handler/widget/app_error_handler_provider.dart';
import 'error_handler/widget/connection_lost_wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  _setupDI(Flavor.prod);
  runApp(const App());
}

void _setupDI(Flavor flavor) {
  appLocator.pushNewScope(
    scopeName: unauthScope,
    init: (_) {
      AppDI.initDependencies(appLocator, flavor);
      DataDI.initDependencies(appLocator);
      DomainDI.initDependencies(appLocator);
      NavigationDI.initDependencies(appLocator);
    },
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = appLocator<AppRouter>();

    return EasyLocalization(
      path: AppLocalization.langFolderPath,
      supportedLocales: AppLocalization.supportedLocales,
      fallbackLocale: AppLocalization.fallbackLocale,
      child: Builder(
        builder: (BuildContext context) {
          return AppErrorHandlerProvider(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter.config(),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: FlexThemeData.light(scheme: FlexScheme.blue),
              darkTheme: FlexThemeData.dark(scheme: FlexScheme.blue),
              builder: (BuildContext context, Widget? child) {
                return ConnectionLostWrapper(
                  padding: const EdgeInsets.all(10),
                  align: SnackAlign.bottom,
                  child: child!,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
