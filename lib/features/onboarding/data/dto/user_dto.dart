import 'package:firebase_auth/firebase_auth.dart';
import 'package:hire_app/features/onboarding/domain/entities/user_entity.dart';

extension UserDTO on UserEntity {
  static UserEntity fromFirebase(User firebaseUser) => UserEntity(
        id: firebaseUser.uid,
        email: firebaseUser.email!,
        name: firebaseUser.displayName,
      );
}
