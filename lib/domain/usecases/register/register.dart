import 'package:movie_app/data/repositories/authentication.dart';
import 'package:movie_app/data/repositories/user_repository.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/entities/user.dart';
import 'package:movie_app/domain/usecases/register/register_param.dart';
import 'package:movie_app/domain/usecases/usecases.dart';

class Register implements UseCase<Result<User>, RegisterParam> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  Register({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  }) : _authenticationRepository = authenticationRepository,
       _userRepository = userRepository;

  @override
  Future<Result<User>> call(RegisterParam params) async {
    var uidResult = await _authenticationRepository.register(
      email: params.email,
      password: params.password,
    );

    if (uidResult.isFailure) {
      return Result.failure(uidResult.errorMessage!);
    }

    var userResult = await _userRepository.createUser(
      uid: uidResult.resultValue!,
      email: params.email,
      name: params.name,
      photoUrl: params.photoUrl,
    );

    if (userResult.isFailure) {
      return Result.failure(userResult.errorMessage!);
    }
    return Result.success(userResult.resultValue!);
  }
}
