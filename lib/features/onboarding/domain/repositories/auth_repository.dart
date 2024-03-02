import 'package:hire_app/features/onboarding/domain/cubits/auth_cubit.dart';

abstract interface class AuthRepository {
  AuthState getCurrentUser();
  Future<AuthState> signOut();
  Future<AuthState> signIn(String email, String password);
  Future<AuthState> create(String email, String password);
}
