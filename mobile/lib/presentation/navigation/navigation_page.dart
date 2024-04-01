import 'package:flutter/material.dart';
import 'package:mobile/presentation/feed/feed_page.dart';
import 'package:mobile/presentation/notifications/notification_page.dart';
import 'package:mobile/presentation/profile/pages/profile_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentIndex = 3;
  PageController controller = PageController(initialPage: 3);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: const [
          FeedPage(),
          NotificationPage(),
          ProfilePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
          controller.animateToPage(currentIndex,
              duration: const Duration(seconds: 1),
              curve: Curves.fastEaseInToSlowEaseOut);
        }),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Explore"),
            selectedColor: Colors.teal,
          ),

          /// Likes
          SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_border),
              title: const Text("Likes"),
              selectedColor: Colors.teal),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.message_outlined),
            title: const Text("Messages"),
            selectedColor: Colors.teal,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
