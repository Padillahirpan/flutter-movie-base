import 'dart:io';

import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<Result<User>> createUser({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
    int balance = 0,
  });

  Future<Result<User>> getUserById({required String uid});

  Future<Result<void>> updateUser({required User user});

  Future<Result<int>> getUserBalance({required String uid});

  Future<Result<void>> updateUserBalance({
    required String uid,
    required int balance,
  });

  Future<Result<User>> uploadProfilePicture({
    required String uid,
    required File imagePath,
  });
}
