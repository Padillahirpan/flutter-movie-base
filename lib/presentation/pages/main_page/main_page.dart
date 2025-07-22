import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/entities/user.dart';
import 'package:movie_app/presentation/providers/user_data/user_data_provider.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    var data = ref.watch(userDataProvider);

    var isLoading = data.isLoading;

    var user_data = ref
        .watch(userDataProvider)
        .when(
          data: (data) => data,
          error: (error, stackTrace) => '',
          loading: () => 'Loading',
        );
    // return Scaffold(
    //   appBar: AppBar(title: const Text('Main Page')),
    //   body: Center(child: Text('Welcome to the Main Page! ${user_data}')),
    // );
    if (isLoading) Text('Sabar ini sedang loading kok :)');

    return Scaffold(
      appBar: AppBar(title: const Text('Main Page')),
      body: Center(
        child: Column(
          children: [
            const CardExample(),
            ElevatedButton(
              onPressed: () {
                ref.read(userDataProvider.notifier).logout();
              },
              child: const Text('Logout'),
            ),
            Text(
              'Welcome to the Main Page! ${user_data}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('Test 123456'),
              subtitle: Text("Music by Test 123456. Test test test..."),
            ),
          ],
        ),
      ),
    );
  }
}
