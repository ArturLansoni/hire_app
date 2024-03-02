import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hire_app/core/infra/auth/auth_adapter.dart';
import 'package:hire_app/core/infra/auth/firebase_auth_impl.dart';
import 'package:hire_app/features/onboarding/data/datasources/auth_datasource.dart';
import 'package:hire_app/features/onboarding/data/datasources/firebase/auth_datasource_impl.dart';
import 'package:hire_app/features/onboarding/data/repositories/auth_repository_impl.dart';
import 'package:hire_app/features/onboarding/domain/cubits/auth_cubit.dart';
import 'package:hire_app/features/onboarding/domain/repositories/auth_repository.dart';

final appDI = GetIt.instance;

class AppInjection {
  static void initialize() {
    appDI
      ..registerFactory<AuthAdapter>(
        () => FirebaseAuthImpl(FirebaseAuth.instance),
      )
      ..registerFactory<AuthDataSource>(
        () => FirebaseAuthDataSourceImpl(appDI<AuthAdapter>()),
      )
      ..registerFactory<AuthRepository>(
        () => FirebaseAuthRepositoryImpl(appDI<AuthDataSource>()),
      )
      ..registerLazySingleton<AuthCubit>(
        () => AuthCubit(appDI<AuthRepository>()),
      );
  }
}
