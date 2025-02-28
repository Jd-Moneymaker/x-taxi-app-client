import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthApi {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  FirebaseAuthApi({
    FirebaseAuth? auth,
    FirebaseFirestore? firestore,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  Future signUpWithEmail(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    }
  }

  Future<void> saveUserData(Map<String, dynamic> userData) async {
    try {
      await _firestore.collection('users').doc(userData['uid']).set(userData);
    } catch (e) {
      throw FirebaseException(
        plugin: 'firestore',
        message: 'Failed to save user data: $e',
      );
    }
  }

  // ! Email sign-in
  Future<void> emailLogIn(String email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception("Error during email sign-in: $e");
    }
  }
  // ! Email sign-in

  // ! Log out
  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception("Error during logout: $e");
    }
  }
  // ! Log out

  AuthException _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return AuthException('Please enter a stronger password');
      case 'email-already-in-use':
        return AuthException('An account already exists with this email');
      default:
        return AuthException('Authentication failed: ${e.message}');
    }
  }
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}
