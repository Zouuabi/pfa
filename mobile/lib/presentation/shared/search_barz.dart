import 'package:flutter/material.dart';
import 'package:mobile/presentation/messages/pages/messages_page.dart';

class SearchBarz extends StatelessWidget {
  const SearchBarz({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAnchor.bar(
          dividerColor: Colors.teal,
          suggestionsBuilder: (_, __) {
            return const [
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
            ];
          }),
    );
  }
}
