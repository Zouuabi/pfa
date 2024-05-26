import 'package:flutter/material.dart';
import 'package:mobile/core/config/image_manager.dart';
import 'package:mobile/data/models/user.dart';
import 'package:mobile/presentation/feed/pages/feed_page.dart';
import 'package:mobile/presentation/messages/pages/messages_page.dart';
import 'package:mobile/presentation/notifications/notification_page.dart';
import 'package:mobile/presentation/profile/pages/profile_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentIndex = 0;
  PageController controller = PageController(initialPage: 0);
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
        children: [
          FeedPage(),
          const NotificationPage(),
          const MessagesPage(),
          const ProfilePage(),
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
            icon: Image.asset(ImageManager.explore),
            title: const Text("Explore"),
            selectedColor: Colors.teal,
          ),

          /// Likes
          SalomonBottomBarItem(
              icon: const Icon(
                Icons.notifications_none_outlined,
                size: 30,
                color: Color.fromARGB(200, 54, 51, 48),
              ),
              title: const Text("Notifications"),
              selectedColor: Colors.teal),

          /// Search
          SalomonBottomBarItem(
            icon: Image.asset(ImageManager.messages),
            title: const Text("Messages"),
            selectedColor: Colors.teal,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Image.asset(ImageManager.person),
            title: const Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
