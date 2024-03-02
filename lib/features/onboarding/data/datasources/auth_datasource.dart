import 'package:hire_app/features/onboarding/domain/entities/user_entity.dart';

abstract interface class AuthDataSource {
  UserEntity? getCurrentUser();
  Future<void> signOut();
  Future<void> signIn(String email, String password);
  Future<void> create(String email, String password);
}
