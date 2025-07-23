import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/misc/extensions/build_context_extension.dart';
import 'package:movie_app/presentation/misc/methods.dart';
import 'package:movie_app/presentation/providers/router/router_provider.dart';
import 'package:movie_app/presentation/providers/user_data/user_data_provider.dart';
import 'package:movie_app/presentation/widgets/flix_text_field.dart';

class RegisterPage extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handleUserDataState(
      AsyncValue next,
      WidgetRef ref,
      BuildContext context,
    ) {
      log('Test test listener');
      if (next is AsyncData) {
        if (next.value != null) {
          ref.read(routerProvider).goNamed('main');
        } else if (next is AsyncError) {
          context.showSnackBar('Registration failed: ${next.error}');
        }
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
                verticalSpace(20),
                FlixTextField(
                  labelText: 'Confirm Password',
                  controller: confirmPasswordController,
                  obscureText: true,
                ),
                verticalSpace(20),
                switch (ref.watch(userDataProvider)) {
                  AsyncLoading() => const CircularProgressIndicator(),
                  AsyncError() || AsyncData() => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (passwordController.text !=
                            confirmPasswordController.text) {
                          context.showSnackBar('Passwords do not match');
                          return;
                        }
                      },
                      child: Text(
                        'Register',
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
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        ref.read(routerProvider).goNamed('login');
                      },
                      child: const Text('Login'),
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
