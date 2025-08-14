import 'package:movie_app/domain/usecases/logout/logout.dart';
import 'package:movie_app/presentation/providers/repositories/authentication/authentication_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
Logout logout(LogoutRef ref) =>
    Logout(authenticationRepository: ref.watch(authenticationProvider));
