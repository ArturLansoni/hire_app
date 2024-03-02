import 'dart:async';
import 'package:hire_app/core/infra/auth/auth_adapter.dart';
import 'package:hire_app/features/onboarding/data/datasources/auth_datasource.dart';
import 'package:hire_app/features/onboarding/data/dto/user_dto.dart';
import 'package:hire_app/features/onboarding/domain/entities/user_entity.dart';

class FirebaseAuthDataSourceImpl implements AuthDataSource {
  FirebaseAuthDataSourceImpl(this.authAdapter);
  final AuthAdapter authAdapter;

  @override
  UserEntity? getCurrentUser() {
    final user = authAdapter.getCurrentUser();
    if (user == null) {
      return null;
    }
    return UserDTO.fromFirebase(user);
  }

  @override
  Future<void> signIn(String email, String password) async {
    await authAdapter.signIn(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await authAdapter.signOut();
  }

  @override
  Future<void> create(String email, String password) async {
    await authAdapter.createUser(email: email, password: password);
  }
}
