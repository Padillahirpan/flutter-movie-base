import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/usecases/login/login.dart';
import 'package:movie_app/presentation/pages/main_page/main_page.dart';
import 'package:movie_app/presentation/providers/usercases/login_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Login login = ref.watch(loginProvider);

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
