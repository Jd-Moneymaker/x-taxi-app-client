import 'package:x_taxi_app_client/features/auth/domain/entities/auth_entity.dart';
import 'package:x_taxi_app_client/features/auth/domain/repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<void> signup(String email, String password, String phoneNumber) async {
    final userData = AuthEntity(
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
    await _authRepository.emailSignUp(userData);
  }

  Future<void> login(String email, String password) async {
    final userData = AuthEntity(
      email: email,
      password: password,
    );
    await _authRepository.emailLogIn(userData);
  }

  Future<void> logout() async {
    await _authRepository.logout();
  }
}
