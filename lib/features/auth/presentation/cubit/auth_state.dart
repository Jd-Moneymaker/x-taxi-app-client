import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoggedIn extends AuthState {
  final User firebaseUser;
  const AuthLoggedIn(this.firebaseUser);
}

class LogoutInProgress extends AuthState {}

class AuthLoggedOut extends AuthState {}

class AuthLoaded extends AuthState {
  final String message;
  const AuthLoaded({this.message = 'Course added successfully!'});

  @override
  List<Object?> get props => [message];
}

class AuthSaved extends AuthState {}

class AuthError extends AuthState {
  final String error;
  const AuthError(this.error);
}
