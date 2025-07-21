import 'dart:io';

import 'package:movie_app/data/repositories/user_repository.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/entities/user.dart';

class DummyUser implements UserRepository {
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
    await Future.delayed(const Duration(seconds: 3));
    return Result.success(
      User(uid: uid, email: 'dummy@dummy.com', name: 'Dummy Ass'),
    );
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
