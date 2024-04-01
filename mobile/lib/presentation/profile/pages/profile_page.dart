import 'package:flutter/material.dart';

import 'package:mobile/presentation/profile/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(),
              SizedBox(height: 20),
              ProfileBio(),
              SizedBox(height: 20),
              UserStatistics(),
              SizedBox(height: 20),
              InterestsSection(),
              SizedBox(height: 20),
              ExperienceSection(),
            ],
          ),
        ));
  }
}
