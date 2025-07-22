import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:movie_app/data/repositories/user_repository.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/entities/user.dart';
import 'package:path/path.dart';

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
  }) async {
    CollectionReference<Map<String, dynamic>> usersCollection = _firestore
        .collection('users');

    await usersCollection.doc(uid).set({
      'uid': uid,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'balance': balance,
    });

    DocumentSnapshot<Map<String, dynamic>> result = await usersCollection
        .doc(uid)
        .get();
    // Check if the user document was created successfully
    if (result.exists) {
      return Result.success(User.fromJson(result.data()!));
    } else {
      return Result.failure(
        'User creation failed: User not found after creation',
      );
    }
  }

  @override
  Future<Result<int>> getUserBalance({required String uid}) async {
    DocumentReference<Map<String, dynamic>> userDoc = _firestore.doc(
      'users/$uid',
    );

    DocumentSnapshot<Map<String, dynamic>> snapshot = await userDoc.get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data()!;
      int balance = data['balance'] as int? ?? 0;
      return Result.success(balance);
    } else {
      return Result.failure('User not found');
    }
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
  Future<Result<User>> updateUser({required User user}) async {
    try {
      DocumentReference<Map<String, dynamic>> userDoc = _firestore.doc(
        'users/${user.uid}',
      );

      await userDoc.update(user.toJson());

      DocumentSnapshot<Map<String, dynamic>> snapshot = await userDoc.get();

      if (snapshot.exists) {
        User updatedUser = User.fromJson(snapshot.data()!);
        if (updatedUser == user) {
          return Result.success(updatedUser);
        } else {
          return Result.failure('User update failed: Data mismatch');
        }
      } else {
        return Result.failure('User update failed: User not found');
      }
    } on FirebaseException catch (e) {
      return Result.failure(e.message ?? 'User update failed');
    }
  }

  @override
  Future<Result<User>> updateUserBalance({
    required String uid,
    required int balance,
  }) async {
    DocumentReference<Map<String, dynamic>> userDoc = _firestore.doc(
      'users/$uid',
    );
    DocumentSnapshot<Map<String, dynamic>> snapshot = await userDoc.get();

    if (!snapshot.exists) {
      return Result.failure('User not found');
    }

    // Update the user's balance
    await userDoc.update({'balance': balance});

    DocumentSnapshot<Map<String, dynamic>> updatedResult = await userDoc.get();

    if (!updatedResult.exists) {
      return Result.failure('Failed to update user balance: User not found');
    }

    // Check if the balance was updated correctly
    User updatedUser = User.fromJson(updatedResult.data()!);
    if (updatedUser.balance != balance) {
      return Result.failure('Failed to update user balance: Data mismatch');
    }

    return Result.success(updatedUser);
  }

  @override
  Future<Result<User>> uploadProfilePicture({
    required User user,
    required File imageFile,
  }) async {
    String filename = basename(imageFile.path);
    Reference reference = FirebaseStorage.instance.ref().child(filename);

    try {
      await reference.putFile(imageFile);

      String downloadUrl = await reference.getDownloadURL();
      var updateResult = await updateUser(
        user: user.copyWith(photoUrl: downloadUrl),
      );
      if (updateResult.isSuccess) {
        return Result.success(updateResult.resultValue!);
      } else {
        return Result.failure('Failed to update user with new profile picture');
      }
    } catch (e) {
      return Result.failure(
        'Failed to upload profile picture: ${e.toString()}',
      );
    }
  }
}
