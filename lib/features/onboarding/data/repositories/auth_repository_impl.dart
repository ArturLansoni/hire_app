import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hire_app/core/utils/common_failures.dart';
import 'package:hire_app/features/onboarding/data/datasources/auth_datasource.dart';
import 'package:hire_app/features/onboarding/domain/cubits/login_cubit.dart';
import 'package:hire_app/features/onboarding/domain/repositories/auth_repository.dart';

class FirebaseAuthRepositoryImpl implements AuthRepository {
  FirebaseAuthRepositoryImpl(this.dataSource);
  final AuthDataSource dataSource;

  @override
  Future<LoginState> signIn(String email, String password) async {
    try {
      await dataSource.signIn(email, password);
      return LoginSuccess();
    } on FirebaseAuthException catch (e) {
      return switch (e.code) {
        'invalid-credentials' ||
        'invalid-email' ||
        'wrong-password' =>
          LoginError(InvalidParams()),
        _ => LoginError(Failure()),
      };
    } catch (e) {
      return LoginError(Failure());
    }
  }

  @override
  LoginState getCurrentUser() {
    try {
      final user = dataSource.getCurrentUser();
      return LoginSuccess(user: user);
    } catch (_) {
      return LoginInitial();
    }
  }

  @override
  Future<LoginState> create(String email, String password) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<LoginState> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
