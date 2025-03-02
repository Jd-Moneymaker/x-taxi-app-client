import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  AuthRepository(FirebaseAuth auth);

  Future<void> emailSignUp<AuthEntity>(userData);

  Future<void> emailLogIn<AuthEntity>(userData);

  Future<void> logout<AuthEntity>();
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}
