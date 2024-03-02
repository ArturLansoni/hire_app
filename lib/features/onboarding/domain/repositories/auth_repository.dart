import 'package:hire_app/features/onboarding/domain/cubits/login_cubit.dart';

abstract interface class AuthRepository {
  LoginState getCurrentUser();
  Future<LoginState> signOut();
  Future<LoginState> signIn(String email, String password);
  Future<LoginState> create(String email, String password);
}
