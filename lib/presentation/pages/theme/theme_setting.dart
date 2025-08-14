import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/providers/theme/theme_provider.dart';

class ThemeSettingPage extends ConsumerWidget {
  const ThemeSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeNotifierProvider.notifier);
    final currentTheme = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Theme Settings')),
      body: Column(
        children: [
          ListTile(
            title: const Text('Light Mode'),
            leading: Radio<ThemeMode>(
              value: ThemeMode.light,
              groupValue: currentTheme,
              onChanged: (value) {
                if (value != null) {
                  themeNotifier.setThemeMode(value);
                }
              },
            ),
          ),
          ListTile(
            title: const Text('Dark Mode'),
            leading: Radio<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: currentTheme,
              onChanged: (value) {
                if (value != null) {
                  themeNotifier.setThemeMode(value);
                }
              },
            ),
          ),
          ListTile(
            title: const Text('System Default'),
            leading: Radio<ThemeMode>(
              value: ThemeMode.system,
              groupValue: currentTheme,
              onChanged: (value) {
                if (value != null) {
                  themeNotifier.setThemeMode(value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
