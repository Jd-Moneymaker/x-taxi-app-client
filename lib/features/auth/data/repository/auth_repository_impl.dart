import 'dart:developer';
import 'package:x_taxi_app_client/features/auth/data/data_sources/firebase_auth_api.dart';
import 'package:x_taxi_app_client/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthApi _firebaseAuthApi;

  AuthRepositoryImpl(this._firebaseAuthApi);

  @override
  Future<void> emailSignUp<AuthModel>(userData) async {
    try {
      await _firebaseAuthApi.signUpWithEmail(
        userData.email!,
        userData.password!,
      );
    } catch (e) {
      log('Signup error: ${e.toString()}');
      throw AuthException('Failed to complete signup: $e');
    }
  }

  @override
  Future<void> emailLogIn<AuthModel>(userData) async {
    try {
      await _firebaseAuthApi.emailLogIn(
        userData.email!,
        userData.password!,
      );
    } catch (e) {
      log('Signup error: ${e.toString()}');
      throw AuthException('Failed to complete signup: $e');
    }
  }

  @override
  Future<void> logout<AuthEntity>() async {
    try {
      await _firebaseAuthApi.logOut();
    } catch (e) {
      log('Logout error: ${e.toString()}');
      throw AuthException('Failed to log out: $e');
    }
  }
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}
