import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/misc/extensions/build_context_extension.dart';
import 'package:movie_app/presentation/providers/router/router_provider.dart';
import 'package:movie_app/presentation/providers/user_data/user_data_provider.dart';
import 'package:movie_app/presentation/widgets/bottom_nav_bar.dart';
import 'package:movie_app/presentation/widgets/bottom_nav_bar_item.dart';

import '../profile/profile_page.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final PageController pageController = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      if (previous != null && next is AsyncData && next.value == null) {
        ref.read(routerProvider).goNamed('login');
      } else if (next is AsyncError) {
        context.showSnackBar(next.error.toString());
      }
    });

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(), // Disable swipe
            onPageChanged: (index) => setState(() {
              selectedIndex = index;
            }),
            children: const [
              Center(child: Text('Home Page')),
              Center(child: Text('Search Page')),
              ProfilePage(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        items: [
          BottomNavBarItem(
            index: 0,
            isSelected: selectedIndex == 0,
            label: 'Home',
            icon: Icons.home,
          ),
          BottomNavBarItem(
            index: 1,
            isSelected: selectedIndex == 1,
            label: 'Search',
            icon: Icons.search,
          ),
          BottomNavBarItem(
            index: 2,
            isSelected: selectedIndex == 2,
            label: 'Profile',
            icon: Icons.person,
          ),
        ],
        onTap: (index) {
          // Handle navigation
          selectedIndex = index;
          pageController.animateToPage(
            selectedIndex,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOutSine,
          );
        },
        selectedIndex: selectedIndex,
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
