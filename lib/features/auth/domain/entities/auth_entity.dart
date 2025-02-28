import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? uid;
  final String? email;
  final String? phoneNumber;
  final String? password;

  const AuthEntity({
    this.uid,
    this.email,
    this.phoneNumber,
    this.password,
  });

  @override
  List<Object?> get props => [
        uid,
        email,
        phoneNumber,
        password,
      ];
}
