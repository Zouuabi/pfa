import 'package:flutter/material.dart';

class UserStatistics extends StatelessWidget {
  const UserStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        StatisticCount(number: 2, label: 'Followers'),
        SizedBox(width: 50),
        StatisticCount(number: 2, label: 'Projects'),
      ],
    );
  }
}

class StatisticCount extends StatelessWidget {
  const StatisticCount({super.key, required this.number, required this.label});

  final int number;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        '$number',
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      const SizedBox(width: 5),
      Text(
        label,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.grey),
      )
    ]);
  }
}
