import 'package:flutter/material.dart';
import 'package:mobile/presentation/messages/pages/conversation_page.dart';
import 'package:mobile/presentation/shared/profile_picture.dart';
import 'package:mobile/presentation/shared/search_barz.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({
    super.key,
  });
  static const String route = '/messages';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 20,
            itemBuilder: (_, index) {
              if (index == 0) {
                return const SearchBarz();
              }
              return const ConversationItem();
            }));
  }
}

class ConversationItem extends StatelessWidget {
  const ConversationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const ProfilePicture(),
      title: const Text('User/Group Name'),
      subtitle: const Text('Sent 5h ago'),
      onTap: () {
        Navigator.of(context).pushNamed(ConversationPage.route);
      },
    );
  }
}
