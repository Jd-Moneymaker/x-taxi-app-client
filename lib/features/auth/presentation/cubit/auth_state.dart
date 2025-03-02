import 'package:firebase_auth/firebase_auth.dart';

import '../../data/models/auth_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoggedIn extends AuthState {
  final User firebaseUser;
  AuthLoggedIn(this.firebaseUser);
}

class LogoutInProgress extends AuthState {}

class AuthLoggedOut extends AuthState {}

class AuthLoaded extends AuthState {
  final List<AuthModel> users;
  AuthLoaded(this.users);
}

class AuthSaved extends AuthState {}

class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
}
