import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_app/core/config/app_configuration.dart';
import 'package:hire_app/core/config/flavor.dart';
import 'package:hire_app/core/infra/auth/firebase_auth_impl.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/theme.dart';
import 'package:hire_app/core/utils/routes.dart';
import 'package:hire_app/features/home/presentation/pages/home.dart';
import 'package:hire_app/features/onboarding/data/datasources/firebase/auth_datasource_impl.dart';
import 'package:hire_app/features/onboarding/data/repositories/auth_repository_impl.dart';
import 'package:hire_app/features/onboarding/domain/cubits/login_cubit.dart';
import 'package:hire_app/features/onboarding/presentation/pages/login.dart';
import 'package:hire_app/features/onboarding/presentation/pages/splash.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final firebase = FirebaseAuthImpl(FirebaseAuth.instance);
    final dataSource = FirebaseAuthDataSourceImpl(firebase);
    final repository = FirebaseAuthRepositoryImpl(dataSource);
    final cubit = LoginCubit(repository);

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
      initialRoute: Router.initialRoute,
      routes: {
        Routes.splash: (context) => BlocProvider.value(
              value: cubit,
              child: const SplashPage(),
            ),
        Routes.login: (context) => BlocProvider.value(
              value: cubit,
              child: const LoginPage(),
            ),
        Routes.home: (context) => const HomePage(),
      },
    );
  }
}

class Router {
  static const initialRoute = Routes.splash;
  static final routes = {
    Routes.splash: (context) => const SplashPage(),
    Routes.login: (context) => const LoginPage(),
    Routes.home: (context) => const HomePage(),
  };
}
