import 'package:flutter/material.dart';
import 'package:mobile/data/models/projectz.dart';
import 'package:mobile/presentation/messages/pages/conversation_page.dart';
import 'package:mobile/presentation/shared/profile_picture.dart';
import 'package:mobile/presentation/shared/search_barz.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({
    super.key,
  });
  static const String route = '/messages';

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  List<Projectz> data = [
    Projectz(
      id: 1,
      ownerName: 'Othmen',
      ownerPhoto:
          'https://scontent.ftun8-1.fna.fbcdn.net/v/t39.30808-6/275185387_156696223403908_4950402848171890081_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_ohc=ovVjBIq4lOQQ7kNvgGxMxgh&_nc_ht=scontent.ftun8-1.fna&oh=00_AYAlizpiJSzXhN0By69vjM_ICTZe9g3bqQZCxuw7RWZbug&oe=66599616',
      title: 'Team Bey Web Version',
      intro: 'Team Bey web version Project using React',
      description: 'This is a detailed description ',
      keywords: ['keyword1', 'keyword2'],
      createdAt: '2 days ago',
      members: ['member1', 'member2'],
      roomId: 'room1',
      likes: 998,
      popularity: 0.8,
    ),
    Projectz(
      id: 2,
      ownerName: 'Sarra',
      ownerPhoto:
          'https://scontent.ftun8-1.fna.fbcdn.net/v/t39.30808-6/318155242_1163346024556694_3943461047928511917_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_ohc=1lu6bbDytq4Q7kNvgHgxqx8&_nc_ht=scontent.ftun8-1.fna&oh=00_AYD-_GwZ4CD0z5aTu9uhabgCiB8eg2QZMQo44kLhc7OzDQ&oe=66599706',
      title: 'Team Bey Mobile Version using ',
      intro: 'Team Bey web version Project movile version using Flutter',
      description: 'This is a detailed description ',
      keywords: ['keyword3', 'keyword4'],
      createdAt: '1 day ago',
      members: ['member3', 'member4'],
      roomId: 'room2',
      likes: 997,
      popularity: 0.9,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: data.length + 1,
            itemBuilder: (_, index) {
              if (index == 0) {
                return const SearchBarz();
              }
              return ConversationItem(
                title: data[index - 1].title,
                url: data[index - 1].ownerPhoto,
              );
            }));
  }
}

class ConversationItem extends StatelessWidget {
  const ConversationItem({
    super.key,
    required this.title,
    required this.url,
  });
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfilePicture(
        url: url,
      ),
      title: Text('Group - $title '),
      subtitle: const Text('Sent 5h ago'),
      onTap: () {
        Navigator.of(context).pushNamed(ConversationPage.route);
      },
    );
  }
}
