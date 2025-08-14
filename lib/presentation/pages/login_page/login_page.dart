import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/misc/extensions/build_context_extension.dart';
import 'package:movie_app/presentation/misc/methods.dart';
import 'package:movie_app/presentation/providers/router/router_provider.dart';
import 'package:movie_app/presentation/providers/user_data/user_data_provider.dart';
import 'package:movie_app/presentation/widgets/flix_text_field.dart';

class LoginPage extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handleUserDataState(
      AsyncValue next,
      WidgetRef ref,
      BuildContext context,
    ) {
      log('Test test listener: $next');
      if (next is AsyncData) {
        if (next.value != null) {
          ref.read(routerProvider).goNamed('main');
        } else if (next is AsyncError) {
          context.showSnackBar('Login failed: ${next.error}');
        }
      } else if (next is AsyncError) {
        context.showSnackBar('Login failed: ${next.error}');
      }
    }

    ref.listen(userDataProvider, (previous, next) {
      handleUserDataState(next, ref, context);
    });

    return Scaffold(
      body: ListView(
        children: [
          verticalSpace(100),
          Center(child: Image.asset('assets/videoboxd-logo.png', width: 200)),
          verticalSpace(100),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8.0,
            ),
            child: Column(
              children: [
                FlixTextField(labelText: 'Email', controller: emailController),
                verticalSpace(20),
                FlixTextField(
                  labelText: 'Password',
                  controller: passwordController,
                  obscureText: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'forgot password',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                verticalSpace(20),
                switch (ref.watch(userDataProvider)) {
                  AsyncLoading() => const CircularProgressIndicator(),
                  AsyncError() || AsyncData() => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await ref
                            .read(userDataProvider.notifier)
                            .login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  _ => const CircularProgressIndicator(),
                },
                verticalSpace(15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        ref.read(routerProvider).pushNamed('register');
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
