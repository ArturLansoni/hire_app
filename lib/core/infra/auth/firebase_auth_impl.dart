import 'package:firebase_auth/firebase_auth.dart';
import 'package:hire_app/core/infra/auth/auth_adapter.dart';

class FirebaseAuthImpl implements AuthAdapter {
  FirebaseAuthImpl(this._firebaseAuth);
  final FirebaseAuth _firebaseAuth;

  @override
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> createUser({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
