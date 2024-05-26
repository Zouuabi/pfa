import 'package:flutter/material.dart';

class InterestsSection extends StatelessWidget {
  InterestsSection({super.key});

  final List<String> interest = ['Flutter', 'React', 'Dart_Frog'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Interests',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: interest.length,
              itemBuilder: (context, index) {
                return Interest(
                  interst: interest[index],
                );
              }),
        ),
      ],
    );
  }
}

class Interest extends StatelessWidget {
  const Interest({super.key, required this.interst});
  final String interst;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.rocket,
            color: Colors.teal,
          ),
          Text(interst)
        ],
      ),
    );
  }
}
