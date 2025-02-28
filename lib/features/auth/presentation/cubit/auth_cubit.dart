// lib/cubits/auth/auth_cubit.dart
import 'dart:async';
import 'dart:developer';

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
  })  : _auth = FirebaseAuth.instance,
        _authUseCase = authUseCase,
        super(AuthInitial());

  // ? check logged in state. used in splashscreen to check user auth status

  void checkAuthStatus() {
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        log('user logged in');
        emit(AuthLoggedIn(user));
      } else {
        log('user not logged in');
        emit(AuthLoggedOut());
      }
    });
  }

  // Sign up method / save user details
  Future<void> emailSignUp(
    String email,
    password,
    phoneNumber,
  ) async {
    emit(AuthLoading());
    try {
      emit(AuthLoading());
      await _authUseCase.signup(email, password, phoneNumber);
      emit(AuthLoaded());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
  // Sign up method / save user details

  // Log in method
  Future<void> emailLogIn(
    String email,
    password,
  ) async {
    emit(AuthLoading());
    try {
      await _authUseCase.login(email, password);
      // log('user logged in');
      emit(AuthLoggedIn(_auth.currentUser!));
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }
  // Log in method

  Future<void> logOut() async {
    emit(LogoutInProgress());
    try {
      await _authUseCase.logout();
      log('user logged out');
      emit(AuthLoggedOut());
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }
}
