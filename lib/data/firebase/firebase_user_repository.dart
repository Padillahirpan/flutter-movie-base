import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/data/repositories/user_repository.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/entities/user.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseFirestore _firestore;

  FirebaseUserRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<User>> createUser({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
    int balance = 0,
  }) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Result<int>> getUserBalance({required String uid}) {
    // TODO: implement getUserBalance
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> getUserById({required String uid}) async {
    DocumentReference<Map<String, dynamic>> userDoc = _firestore.doc(
      'users/$uid',
    );

    DocumentSnapshot<Map<String, dynamic>> snapshot = await userDoc.get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data()!;
      User user = User(
        uid: uid,
        email: data['email'] as String,
        name: data['name'] as String,
        photoUrl: data['photoUrl'] as String?,
        balance: data['balance'] as int? ?? 0,
      );
      return Result.success(User.fromJson(snapshot.data()!));
    } else {
      return Result.failure('User not found');
    }
  }

  @override
  Future<Result<void>> updateUser({required User user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> updateUserBalance({
    required String uid,
    required int balance,
  }) {
    // TODO: implement updateUserBalance
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> uploadProfilePicture({
    required String uid,
    required File imagePath,
  }) {
    // TODO: implement uploadProfilePicture
    throw UnimplementedError();
  }
}
