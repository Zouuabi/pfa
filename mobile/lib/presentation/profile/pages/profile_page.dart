import 'package:flutter/material.dart';

import 'package:mobile/presentation/profile/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileHeader(),
              const SizedBox(height: 20),
              const ProfileBio(),
              const SizedBox(height: 20),
              const UserStatistics(),
              const SizedBox(height: 20),
              InterestsSection(),
              const SizedBox(height: 20),
              const ExperienceSection(),
            ],
          ),
        ));
  }
}
