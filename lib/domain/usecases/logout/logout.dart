import 'package:movie_app/data/repositories/authentication.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/usecases/usecases.dart';

class Logout implements UseCase<Result<void>, void> {
  final AuthenticationRepository _authenticationRepository;

  Logout({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository;

  @override
  Future<Result<void>> call(void params) {
    return _authenticationRepository.logout();
  }
}
