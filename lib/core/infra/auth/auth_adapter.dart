import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthAdapter {
  User? getCurrentUser();
  Future<void> signOut();
  Future<void> signIn({
    required String email,
    required String password,
  });
  Future<void> createUser({
    required String email,
    required String password,
  });
}
