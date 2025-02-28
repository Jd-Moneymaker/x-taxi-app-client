import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    super.uid,
    super.email,
    super.phoneNumber,
    super.password,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
