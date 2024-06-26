import 'package:flutter/material.dart';
import 'package:mobile/presentation/profile/pages/account_settings.dart';
import 'package:mobile/presentation/shared/profile_picture.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AccountSettings.route);
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.teal,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProfilePicture(
              url:
                  'https://www.oubeid.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fprofile-pic.52928098.png&w=640&q=75',
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/edit-profile');
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    SizedBox(width: 2),
                    Text('Edit'),
                  ],
                ))
          ],
        ),
        Text(
          'Zouabi Oubeid',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          '@zouuabi',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
