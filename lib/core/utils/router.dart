import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_app/core/utils/routes.dart';
import 'package:hire_app/features/home/domain/cubits/home_cubit.dart';
import 'package:hire_app/features/home/domain/cubits/order_cubit.dart';
import 'package:hire_app/features/home/domain/entities/company_entity.dart';
import 'package:hire_app/features/home/presentation/pages/home.dart';
import 'package:hire_app/features/home/presentation/pages/order.dart';
import 'package:hire_app/features/onboarding/domain/cubits/auth_cubit.dart';
import 'package:hire_app/features/onboarding/presentation/pages/login.dart';
import 'package:hire_app/features/onboarding/presentation/pages/splash.dart';
import 'package:hire_app/injection.dart';

class AppRouter {
  static const initialRoute = Routes.splash;
  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.splash: (context) => BlocProvider.value(
          value: appDI<AuthCubit>(),
          child: const SplashPage(),
        ),
    Routes.login: (context) => BlocProvider.value(
          value: appDI<AuthCubit>(),
          child: const LoginPage(),
        ),
    Routes.home: (context) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: appDI<AuthCubit>()),
            BlocProvider.value(value: appDI<HomeCubit>()),
          ],
          child: const HomePage(),
        ),
    Routes.order: (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      return BlocProvider.value(
        value: appDI<OrderCubit>(),
        child: OrderPage(company: args!['company'] as CompanyEntity),
      );
    },
  };
}
