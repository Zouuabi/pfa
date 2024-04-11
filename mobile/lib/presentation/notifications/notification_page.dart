import 'package:flutter/material.dart';
import 'package:mobile/presentation/shared/profile_picture.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isLoading = false;
  List<String> notifications = [];

  void fetchNotifications() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        notifications = [
          'notification 1',
          'notification 2',
          'notification 3',
          'notification 4',
          'notification 5',
          'notification 6',
          'notification 7',
          'notification 8',
          'notification 1',
          'notification 2',
          'notification 3',
          'notification 4',
          'notification 5',
          'notification 6',
          'notification 7',
          'notification 8',
        ];
      });
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    notifications[index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('This is the notification content'),
                  trailing: const Text('1 min ago '),
                );
              },
            ),
          );
  }
}
