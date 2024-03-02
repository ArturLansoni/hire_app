import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_app/core/utils/routes.dart';
import 'package:hire_app/features/home/presentation/pages/home.dart';
import 'package:hire_app/features/onboarding/domain/cubits/login_cubit.dart';
import 'package:hire_app/features/onboarding/presentation/pages/login.dart';
import 'package:hire_app/features/onboarding/presentation/pages/splash.dart';
import 'package:hire_app/injection.dart';

class AppRouter {
  static const initialRoute = Routes.splash;
  static final routes = {
    Routes.splash: (context) => BlocProvider.value(
          value: appDI<LoginCubit>(),
          child: const SplashPage(),
        ),
    Routes.login: (context) => BlocProvider.value(
          value: appDI<LoginCubit>(),
          child: const LoginPage(),
        ),
    Routes.home: (context) => const HomePage(),
  };
}
