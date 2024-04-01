import 'package:flutter/material.dart';

class ProfileBio extends StatelessWidget {
  const ProfileBio({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Flutter enthusiast, curious about astronomy looking friend for new adventure ',
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
