import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/pages/profile/profile_item.dart';
import 'package:movie_app/presentation/pages/profile/user_info.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: userAsyncValue.when(
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
                        // Handle email tap
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
                      'Contact Us',
                      onTap: () {
                        // Handle contact us tap
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

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    Color? valueColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600], size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: valueColor ?? Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
