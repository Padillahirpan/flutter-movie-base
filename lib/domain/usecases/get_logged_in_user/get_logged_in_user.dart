import 'package:movie_app/data/repositories/authentication.dart';
import 'package:movie_app/data/repositories/user_repository.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/entities/user.dart';
import 'package:movie_app/domain/usecases/usecases.dart';

class GetLoggedInUser implements UseCase<Result<User>, void> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  GetLoggedInUser({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  }) : _authenticationRepository = authenticationRepository,
       _userRepository = userRepository;

  @override
  Future<Result<User>> call(void params) async {
    String? loggedId = _authenticationRepository.getLoggedInUserId();
    if (loggedId == null) {
      return Result.failure('No user is logged in');
    }
    var userResult = await _userRepository.getUserById(uid: loggedId);
    if (userResult.isFailure) {
      return Result.failure(userResult.errorMessage!);
    }
    return Result.success(userResult.resultValue!);
  }
}
