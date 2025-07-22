import 'package:movie_app/data/repositories/authentication.dart';
import 'package:movie_app/domain/entities/result.dart';

class DummyAuthentication implements AuthenticationRepository {
  @override
  String? getLoggedInUserId() {
    // TODO: implement getLoggedInUserId
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 3));
    // return const Success(
    //   'ID_1234567890',
    // ); // Simulating a successful login with a dummy user ID
    return const Failure("Login failed. Please try again.");
  }

  @override
  Future<Result<void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> register({
    required String email,
    required String password,
  }) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
