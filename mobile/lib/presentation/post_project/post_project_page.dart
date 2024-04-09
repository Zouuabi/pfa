import 'package:flutter/material.dart';
import 'package:mobile/presentation/shared/profile_picture.dart';

class PostProjectPage extends StatelessWidget {
  const PostProjectPage({super.key});

  static const String route = '/post-project';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Post',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.teal, fontWeight: FontWeight.bold),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ListTile(
                leading: const ProfilePicture(),
                title: Text(
                  'Lina_97',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('🌎 Public '),
              ),
              const TextField(
                maxLength: 2000,
                maxLines: 5,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Post A New Project Idea !'),
              )
            ],
          ),
        ));
  }
}
