import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
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
      return const AuthState(AuthStatus.success);
    } on FirebaseAuthException catch (e) {
      return switch (e.code) {
        'invalid-credentials' ||
        'invalid-email' ||
        'wrong-password' =>
          AuthState(AuthStatus.error, error: InvalidParams()),
        _ => AuthState(AuthStatus.error, error: Failure()),
      };
    } catch (e) {
      return AuthState(AuthStatus.error, error: Failure());
    }
  }

  @override
  AuthState getCurrentUser() {
    try {
      final user = dataSource.getCurrentUser();
      return AuthState(AuthStatus.initial, user: user);
    } catch (_) {
      return const AuthState(AuthStatus.initial);
    }
  }

  @override
  Future<AuthState> create(String email, String password) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<AuthState> signOut() async {
    try {
      await dataSource.signOut();
      return const AuthState(AuthStatus.success);
    } catch (_) {
      return const AuthState(AuthStatus.initial);
    }
  }
}
