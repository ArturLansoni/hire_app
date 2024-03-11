import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hire_app/core/infra/auth/auth_adapter.dart';
import 'package:hire_app/core/infra/auth/firebase_auth_impl.dart';
import 'package:hire_app/core/infra/database/database_adapter.dart';
import 'package:hire_app/core/infra/database/firestore_impl.dart';
import 'package:hire_app/features/home/data/datasources/firestore/order_datasource_impl.dart';
import 'package:hire_app/features/home/data/datasources/order_datasource.dart';
import 'package:hire_app/features/home/data/repositories/order_repository_impl.dart';
import 'package:hire_app/features/home/domain/cubits/order_cubit.dart';
import 'package:hire_app/features/home/domain/repositories/order_repository.dart';
import 'package:hire_app/features/onboarding/data/datasources/auth_datasource.dart';
import 'package:hire_app/features/onboarding/data/datasources/firebase/auth_datasource_impl.dart';
import 'package:hire_app/features/onboarding/data/repositories/auth_repository_impl.dart';
import 'package:hire_app/features/onboarding/domain/cubits/auth_cubit.dart';
import 'package:hire_app/features/onboarding/domain/repositories/auth_repository.dart';

final appDI = GetIt.instance;

class AppInjection {
  static void initialize() {
    _infra();
    _datasources();
    _repositories();
    _cubits();
  }

  static void _infra() {
    appDI
      ..registerFactory<DatabaseAdapter>(
        () => FirestoreImpl(FirebaseFirestore.instance),
      )
      ..registerFactory<AuthAdapter>(
        () => FirebaseAuthImpl(FirebaseAuth.instance),
      );
  }

  static void _cubits() {
    appDI
      ..registerLazySingleton<OrderCubit>(
        () => OrderCubit(
          auth: appDI<AuthCubit>(),
          repository: appDI<OrderRepository>(),
        ),
      )
      ..registerLazySingleton<AuthCubit>(
        () => AuthCubit(appDI<AuthRepository>()),
      );
  }

  static void _repositories() {
    appDI
      ..registerFactory<OrderRepository>(
        () => OrderRepositoryImpl(appDI<OrderDataSource>()),
      )
      ..registerFactory<AuthRepository>(
        () => FirebaseAuthRepositoryImpl(appDI<AuthDataSource>()),
      );
  }

  static void _datasources() {
    appDI
      ..registerFactory<OrderDataSource>(
        () => FirestoreOrderDataSourceImpl(appDI<DatabaseAdapter>()),
      )
      ..registerFactory<AuthDataSource>(
        () => FirebaseAuthDataSourceImpl(appDI<AuthAdapter>()),
      );
  }
}
