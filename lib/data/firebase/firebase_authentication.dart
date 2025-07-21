import 'package:movie_app/data/repositories/authentication.dart';
import 'package:movie_app/domain/entities/result.dart';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class FirebaseAuthentication implements AuthenticationRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  FirebaseAuthentication({firebase_auth.FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  @override
  String? getLoggedInUserId() {
    final user = _firebaseAuth.currentUser;
    return user?.uid;
  }

  @override
  Future<Result<String>> login({
    required String email,
    required String password,
  }) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Result.success(userCredential.user?.uid ?? '');
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Result.failure(e.message ?? 'Login failed');
    }
  }

  @override
  Future<Result<void>> logout() async {
    await _firebaseAuth.signOut();
    if (_firebaseAuth.currentUser != null) {
      return Result.failure('Logout failed: User still logged in');
    } else {
      return Result.success(null);
    }
  }

  @override
  Future<Result<String>> register({
    required String email,
    required String password,
  }) async {
    try {
      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Result.success(userCredential.user!.uid);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Future.value(Result.failure('Registration failed: ${e.message}'));
    }
  }
}
