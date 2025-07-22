import 'package:movie_app/data/repositories/user_repository.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/usecases/get_user_balance/get_user_balance_param.dart';
import 'package:movie_app/domain/usecases/usecases.dart';

class GetUserBalance implements UseCase<Result<int>, GetUserBalanceParam> {
  final UserRepository _userRepository;

  GetUserBalance({required UserRepository userRepository})
    : _userRepository = userRepository;

  @override
  Future<Result<int>> call(GetUserBalanceParam params) async {
    return await _userRepository.getUserBalance(uid: params.userId);
  }
}
