import 'package:movie_app/data/repositories/user_repository.dart';
import 'package:movie_app/domain/entities/result.dart';
import 'package:movie_app/domain/entities/user.dart';
import 'package:movie_app/domain/usecases/upload_profile/upload_profile_picture_param.dart';
import 'package:movie_app/domain/usecases/usecases.dart';

class UploadProfilePicture
    implements UseCase<Result<User>, UploadProfilePictureParam> {
  final UserRepository _userRepository;

  UploadProfilePicture({required UserRepository userRepository})
    : _userRepository = userRepository;

  @override
  Future<Result<User>> call(UploadProfilePictureParam params) async {
    return _userRepository.uploadProfilePicture(
      user: params.user,
      imageFile: params.imageFile,
    );
  }
}
