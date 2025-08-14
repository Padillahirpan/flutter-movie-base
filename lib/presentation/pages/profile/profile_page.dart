import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/pages/profile/profile_item.dart';
import 'package:movie_app/presentation/pages/profile/user_info.dart';
import 'package:movie_app/presentation/providers/router/router_provider.dart';
import '../../providers/user_data/user_data_provider.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final userAsyncValue = ref.watch(userDataProvider);

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color(0xff550080),
            Color(0xff001980),
            Colors.transparent,
            Colors.transparent,
          ],
          center: Alignment.topRight,
          radius: 2.0, // Increase this value to spread the gradient more
          stops: [
            0.1,
            0.3,
            0.7,
            1.0,
          ], // Optional: control color transition points
        ),
      ),
      child: userAsyncValue.when(
        data: (user) {
          if (user == null) {
            return const Center(child: Text('No user data available'));
          }

          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    ...userInfo(ref),
                    const Divider(height: 32),
                    profileItem(
                      'Update Profile',
                      onTap: () {
                        // Handle name tap
                      },
                    ),
                    const SizedBox(height: 18),
                    profileItem(
                      'My Wallet',
                      onTap: () {
                        ref.read(routerProvider).pushNamed('wallet');
                      },
                    ),
                    const SizedBox(height: 18),
                    profileItem(
                      'Change Password',
                      onTap: () {
                        // Handle balance tap
                      },
                    ),
                    const SizedBox(height: 18),
                    profileItem(
                      'Change Language',
                      onTap: () {
                        // Handle language tap
                      },
                    ),
                    const Divider(height: 32),
                    const SizedBox(height: 18),
                    profileItem(
                      'Theme',
                      onTap: () {
                        ref.read(routerProvider).pushNamed('theme-setting');
                      },
                    ),
                    const SizedBox(height: 18),
                    profileItem(
                      'Privacy Policy',
                      onTap: () {
                        // Handle privacy policy tap
                      },
                    ),
                    const SizedBox(height: 18),
                    profileItem(
                      'Terms and Conditions',
                      onTap: () {
                        // Handle terms and conditions tap
                      },
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Version 0.0.1',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 52),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          ref.read(userDataProvider.notifier).logout();
                        },
                        child: const Text('Logout'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
