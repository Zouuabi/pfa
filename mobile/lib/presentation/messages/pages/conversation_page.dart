import 'package:flutter/material.dart';
import 'package:mobile/presentation/messages/widgets/message_bubble.dart';
import 'package:mobile/presentation/messages/widgets/write_message.dart';
import 'package:mobile/presentation/shared/profile_picture.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage({super.key});
  static const String route = '/conversation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: const ProfilePicture(),
          title: const Text('User/Group Name'),
          trailing: IconButton(
              onPressed: () {
                // Navigator.of(context).pushNamed(ConversationSettings.route);
              },
              icon: const Icon(Icons.info_outline)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: 50,
                itemBuilder: (context, index) {
                  return MessageBubble();
                },
              ),
            ),
            const WriteMessage(),
          ],
        ),
      ),
    );
  }
}
