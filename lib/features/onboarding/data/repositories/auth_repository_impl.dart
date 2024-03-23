import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hire_app/core/utils/async_state.dart';
import 'package:hire_app/core/utils/common_failures.dart';
import 'package:hire_app/features/onboarding/data/datasources/auth_datasource.dart';
import 'package:hire_app/features/onboarding/domain/cubits/auth_cubit.dart';
import 'package:hire_app/features/onboarding/domain/repositories/auth_repository.dart';

class FirebaseAuthRepositoryImpl implements AuthRepository {
  FirebaseAuthRepositoryImpl(this.dataSource);
  final AuthDataSource dataSource;

  @override
  Future<AuthState> signIn(String email, String password) async {
    try {
      await dataSource.signIn(email, password);
      final user = dataSource.getCurrentUser();
      return AuthState(AsyncStatus.success, user: user);
    } on FirebaseAuthException catch (e) {
      return switch (e.code) {
        'invalid-credentials' ||
        'invalid-email' ||
        'wrong-password' =>
          AuthState(AsyncStatus.error, error: InvalidParams()),
        _ => AuthState(AsyncStatus.error, error: Failure()),
      };
    } catch (e) {
      return AuthState(AsyncStatus.error, error: Failure());
    }
  }

  @override
  AuthState getCurrentUser() {
    try {
      final user = dataSource.getCurrentUser();
      return AuthState(AsyncStatus.initial, user: user);
    } catch (_) {
      return const AuthState(AsyncStatus.initial);
    }
  }

  @override
  Future<AuthState> create(String email, String password) async {
    try {
      await dataSource.create(email, password);
      final user = dataSource.getCurrentUser();
      return AuthState(AsyncStatus.success, user: user);
    } catch (_) {
      return const AuthState(AsyncStatus.error);
    }
  }

  @override
  Future<AuthState> signOut() async {
    try {
      await dataSource.signOut();
      return const AuthState(AsyncStatus.success);
    } catch (_) {
      return const AuthState(AsyncStatus.initial);
    }
  }
}
