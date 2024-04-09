import 'package:flutter/material.dart';

class AppWelcome extends StatelessWidget {
  const AppWelcome({super.key, required this.child});
  final String child;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Welcome to TeamBey',
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      Text(
        child,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: 35, fontWeight: FontWeight.bold),
      ),
    ]);
  }
}
