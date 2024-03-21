import 'package:flutter/material.dart';
import 'package:mobile/presentation/feed/feed_page.dart';
import 'package:mobile/presentation/notifications/notification_page.dart';
import 'package:mobile/presentation/profile/profile_page.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
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
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 177, 245, 229),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            controller.animateToPage(currentIndex,
                duration: const Duration(seconds: 1),
                curve: Curves.fastEaseInToSlowEaseOut);
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.logo_dev), label: 'kech'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'bch'),
        ],
      ),
    );
  }
}
