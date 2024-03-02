import 'package:flutter/material.dart';
import 'package:hire_app/core/config/app_configuration.dart';
import 'package:hire_app/core/config/flavor.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/theme.dart';
import 'package:hire_app/core/utils/router.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) {
        if (AppConfiguration.flavor != Flavor.prod) {
          final flavor = AppConfiguration.flavor.name.toUpperCase();
          return '${AppLocalizations.of(context)!.appTitle} - $flavor';
        }
        return AppLocalizations.of(context)!.appTitle;
      },
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
    );
  }
}
