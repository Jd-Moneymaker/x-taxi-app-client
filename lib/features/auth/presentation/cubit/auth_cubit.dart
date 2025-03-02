// lib/cubits/auth/auth_cubit.dart
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_taxi_app_client/features/auth/domain/usecases/auth_usecase.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth;
  final AuthUseCase _authUseCase;

  AuthCubit({
    required FirebaseAuth auth,
    required AuthUseCase authUseCase,
  })  : _auth = auth,
        _authUseCase = authUseCase,
        super(AuthInitial());

  // ! check logged in state. used in splashscreen to check user auth status
  void checkAuthStatus() {
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        emit(AuthLoggedIn(user));
      } else {
        emit(AuthLoggedOut());
      }
    });
  }
  // ! check logged in state. used in splashscreen to check user auth status

  // ! Sign up method / save user details
  Future<void> emailSignUp(
    String email,
    String password,
    String phoneNumber,
  ) async {
    emit(AuthLoading());
    try {
      await _authUseCase.signup(email, password, phoneNumber);
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        emit(AuthLoggedIn(currentUser));
      } else {
        emit(AuthError('Sign up successful but user is null'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
  // ! Sign up method / save user details

  // ! Log in method
  Future<void> emailLogIn(
    String email,
    password,
  ) async {
    emit(AuthLoading());
    try {
      await _authUseCase.login(email, password);
      emit(AuthLoggedIn(_auth.currentUser!));
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }
  // ! Log in method

  // ! logout method
  Future<void> logOut() async {
    emit(LogoutInProgress());
    try {
      await _authUseCase.logout();
      emit(AuthLoggedOut());
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }
  // ! logout method
}
