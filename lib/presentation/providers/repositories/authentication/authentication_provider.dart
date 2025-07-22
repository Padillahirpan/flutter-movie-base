import 'package:movie_app/data/firebase/firebase_authentication.dart';
import 'package:movie_app/data/repositories/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
AuthenticationRepository authentication(AuthenticationRef ref) =>
    FirebaseAuthentication();
