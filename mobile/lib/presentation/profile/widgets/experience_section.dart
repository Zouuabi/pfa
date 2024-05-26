import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experience',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 10),
        Container(
            margin: const EdgeInsets.only(left: 20),
            height: 250,
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Experience(
                  index: index,
                );
              },
            )),
      ],
    );
  }
}

class Experience extends StatelessWidget {
  const Experience({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      lineXY: 0.2,
      isFirst: index == 0,
      isLast: index == 9,
      indicatorStyle: const IndicatorStyle(
        width: 12,
        color: Colors.teal,
      ),
      afterLineStyle:
          const LineStyle(color: Color.fromARGB(255, 173, 187, 186)),
      beforeLineStyle:
          const LineStyle(color: Color.fromARGB(255, 173, 187, 186)),
      endChild: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Team Bey',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '2024',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
              const Text('This is the description of participation\n'),
            ],
          ),
        ),
      ),
    );
  }
}
