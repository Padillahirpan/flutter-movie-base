import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/entities/user.dart';
import 'package:movie_app/domain/usecases/get_logged_in_user/get_logged_in_user.dart';
import 'package:movie_app/domain/usecases/login/login.dart';
import 'package:movie_app/domain/usecases/register/register.dart';
import 'package:movie_app/domain/usecases/register/register_param.dart';
import 'package:movie_app/domain/usecases/top_up/top_up.dart';
import 'package:movie_app/domain/usecases/top_up/top_up_param.dart';
import 'package:movie_app/domain/usecases/upload_profile/upload_profile_picture.dart';
import 'package:movie_app/domain/usecases/upload_profile/upload_profile_picture_param.dart';
import 'package:movie_app/presentation/providers/movie/now_playing_provider.dart';
import 'package:movie_app/presentation/providers/movie/upcoming_provider.dart';
import 'package:movie_app/presentation/providers/transaction_data/transaction_data_provider.dart';
import 'package:movie_app/presentation/providers/usercases/get_logged_in_user_provider.dart';
import 'package:movie_app/presentation/providers/usercases/login_provider.dart';
import 'package:movie_app/presentation/providers/usercases/logout_provider.dart';
import 'package:movie_app/presentation/providers/usercases/register_provider.dart';
import 'package:movie_app/presentation/providers/usercases/top_up_provider.dart';
import 'package:movie_app/presentation/providers/usercases/upload_profile_picture_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_data_provider.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  FutureOr<User?> build() async {
    GetLoggedInUser getLoggedInUser = ref.read(getLoggedInUserProvider);
    var userResult = await getLoggedInUser(null);

    switch (userResult) {
      case Success(value: final user):
        _getMovies();
        return user;
      case Failure(message: _):
        return null;
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();

    Login login = ref.read(loginProvider);

    var result = await login(LoginParams(email: email, password: password));

    switch (result) {
      case Success(value: final user):
        _getMovies();
        state = AsyncData(user);
      case Failure(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
    String? imageUrl,
  }) async {
    state = const AsyncLoading();

    Register register = ref.read(registerProvider);

    var result = await register(
      RegisterParam(
        name: name,
        email: email,
        password: password,
        photoUrl: imageUrl,
      ),
    );

    switch (result) {
      case Success(value: final user):
        _getMovies();
        state = AsyncData(user);
      case Failure(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = AsyncData(null);
    }
  }

  Future<void> refreshUserData() async {
    GetLoggedInUser getLoggedInUser = ref.read(getLoggedInUserProvider);

    var result = await getLoggedInUser(null);
    if (result case Success(value: final user)) {
      state = AsyncData(user);
    }
  }

  Future<void> logout() async {
    var logout = ref.read(logoutProvider);
    var result = await logout(null);

    switch (result) {
      case Success(value: _):
        state = const AsyncData(null);
      case Failure(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = AsyncData(state.valueOrNull);
    }
  }

  Future<void> topUp(int amount) async {
    TopUp topUp = ref.read(topUpProvider);

    String? userId = state.valueOrNull?.uid;

    if (userId != null) {
      var result = await topUp(TopUpParam(amount: amount, userId: userId));

      if (result.isSuccess) {
        refreshUserData();
        ref.read(transactionDataProvider.notifier).refreshTransactiondata();
      }
    }
  }

  Future<void> uploadProfilePicture({
    required User user,
    required File imageFile,
  }) async {
    UploadProfilePicture uploadProfilePicture = ref.read(
      uploadProfilePictureProvider,
    );

    var result = await uploadProfilePicture(
      UploadProfilePictureParam(imageFile: imageFile, user: user),
    );

    if (result case Success(value: final user)) {
      state = AsyncData(user);
    }
  }

  void _getMovies() {
    ref.read(nowPlayingProvider.notifier).getMovies();
    ref.read(upcomingProvider.notifier).getMovies();
  }
}
