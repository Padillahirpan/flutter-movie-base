import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/usecases/login/login.dart';
import 'package:movie_app/presentation/pages/main_page/main_page.dart';
import 'package:movie_app/presentation/providers/router/router_provider.dart';
import 'package:movie_app/presentation/providers/user_data/user_data_provider.dart';
import 'package:movie_app/presentation/providers/usercases/login_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var user = ref.watch(userDataProvider);

    // var isLoading = user.isLoading;
    ref.listen(userDataProvider, (previous, next) {
      if (next is AsyncData) {
        if (next.value != null) {
          ref.read(routerProvider).goNamed('main');
        } else if (next is AsyncError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(next.error.toString())));
        }
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     if (isLoading) const CircularProgressIndicator(),
        //     if (!isLoading) const Text('Please login to continue'),
        //   ],
        // ),
        child: ElevatedButton(
          onPressed: () {
            ref
                .read(userDataProvider.notifier)
                .login(email: 'test2@test.com', password: '123456');

            // Login login = ref.watch(loginProvider);

            // login(
            //   LoginParams(email: "test2@test.com", password: "123456"),
            // ).then((result) {
            //   if (result.isSuccess) {
            //     Navigator.of(context).pushReplacement(
            //       MaterialPageRoute(
            //         builder: (context) => MainPage(user: result.resultValue!),
            //       ),
            //     );
            //   } else {
            //     // Handle login failure
            //     ScaffoldMessenger.of(
            //       context,
            //     ).showSnackBar(SnackBar(content: Text(result.errorMessage!)));
            //   }
            // });
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
