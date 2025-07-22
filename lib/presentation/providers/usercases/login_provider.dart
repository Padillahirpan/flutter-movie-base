import 'package:movie_app/domain/usecases/login/login.dart';
import 'package:movie_app/presentation/providers/repositories/authentication/authentication_provider.dart';
import 'package:movie_app/presentation/providers/repositories/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
Login login(LoginRef ref) => Login(
  auth: ref.watch(authenticationProvider),
  userRepository: ref.watch(userRepositoryProvider),
);
