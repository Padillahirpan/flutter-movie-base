import 'package:movie_app/data/repositories/authentication.dart';
import 'package:movie_app/data/repositories/user_repository.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/entities/user.dart';
import 'package:movie_app/domain/usecases/usecases.dart';

part 'login_params.dart';

class Login implements UseCase<Result<User>, LoginParams> {
  final AuthenticationRepository auth;
  final UserRepository userRepository;

  Login({required this.auth, required this.userRepository});

  @override
  Future<Result<User>> call(LoginParams params) async {
    var idResult = await auth.login(
      email: params.email,
      password: params.password,
    );

    if (idResult is Success) {
      var userId = idResult.resultValue;
      var userResult = await userRepository.getUserById(uid: userId!);

      return switch (userResult) {
        Success(value: final user) => Result.success(user),
        Failure(:final message) => Result.failure(message),
      };
    } else {
      return Result.failure(idResult.errorMessage!);
    }
  }
}
