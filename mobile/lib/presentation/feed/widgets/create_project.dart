import 'package:flutter/material.dart';
import 'package:mobile/data/models/user.dart';
import 'package:mobile/presentation/post_project/pages/post_project_page.dart';
import 'package:mobile/presentation/shared/profile_picture.dart';

class CreateProject extends StatelessWidget {
  const CreateProject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const ProfilePicture(
              url:
                  'https://www.oubeid.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fprofile-pic.52928098.png&w=640&q=75',
            ),
            title: Text(
              'Post A New Project Idea !',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey),
            ),
          ),
        ));
  }
}
