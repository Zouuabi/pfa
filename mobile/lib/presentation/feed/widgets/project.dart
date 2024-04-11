import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile/presentation/feed/pages/project_details.page.dart';
import 'package:mobile/presentation/shared/profile_picture.dart';



class Project extends StatefulWidget {
  const Project({
    super.key,
  });

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  // For Ui Testing
  bool isLiked = false;
  int likes = Random().nextInt(900);
  int comments = Random().nextInt(900);
  int time = Random().nextInt(60);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProjectDetailsPage.route);
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                subtitle: Text(
                  '$time min',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Text(
                'TeamBey project - Collaboration platform',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const Divider(thickness: 0.5),
              Text(
                'Teambey is  collaboration platform fostering a professional environment for project creation, team formation, and project management...',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.left,
              ),
              const Divider(thickness: 0.5),
              Row(
                children: [
                  Row(children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            // XNOR
                            if (isLiked) {
                              isLiked = false;
                              likes--;
                            } else {
                              isLiked = true;
                              likes++;
                            }
                          });
                        },
                        icon: Icon(
                          Icons.thumb_up,
                          color: isLiked ? Colors.teal : Colors.grey,
                        )),
                    Text(
                      '$likes',
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ]),
                  const SizedBox(width: 10),
                  Row(children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.comment)),
                    Text(
                      '$comments',
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ]),
                  const Spacer(),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ProjectDetailsPage.route);
                      },
                      child: const Text('View Details')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
