import 'package:flutter/material.dart';
import 'package:movie_app/data/dummies/dummy_authentication.dart';
import 'package:movie_app/data/dummies/dummy_user.dart';
import 'package:movie_app/data/firebase/firebase_authentication.dart';
import 'package:movie_app/data/firebase/firebase_user_repository.dart';
import 'package:movie_app/domain/usecases/login/login.dart';
import 'package:movie_app/presentation/pages/main_page/main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Login login = Login(
              auth: FirebaseAuthentication(),
              userRepository: FirebaseUserRepository(),
            );

            login(
              LoginParams(email: "test2@test.com", password: "123456"),
            ).then((result) {
              if (result.isSuccess) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MainPage(user: result.resultValue!),
                  ),
                );
              } else {
                // Handle login failure
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(result.errorMessage!)));
              }
            });
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
