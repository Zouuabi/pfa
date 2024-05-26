import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile/data/models/projectz.dart';
import 'package:mobile/presentation/feed/pages/project_details.page.dart';
import 'package:mobile/presentation/shared/profile_picture.dart';

class Project extends StatefulWidget {
  const Project({
    super.key,
    required this.title,
    required this.profileUrl,
    required this.ago,
    required this.intro,
    required this.likes,
    required this.userName,
    required this.description,
  });
  final String title;
  final String userName;
  final String profileUrl;
  final String ago;
  final String intro;
  final int likes;
  final String description;

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  // For Ui Testing
  bool isLiked = false;
  late int likes;

  @override
  void initState() {
    likes = widget.likes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProjectDetailsPage(
                      project: Projectz(
                        id: 1,
                        ownerName: widget.userName,
                        ownerPhoto: widget.profileUrl,
                        title: widget.title,
                        intro: widget.intro,
                        description: widget.description,
                        keywords: ['keyword1', 'keyword2'],
                        createdAt: widget.ago,
                        members: ['member1', 'member2'],
                        roomId: 'room1',
                        likes: likes,
                        popularity: 0.8,
                      ),
                    )));
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
                leading: ProfilePicture(
                  url: widget.profileUrl,
                ),
                title: Text(
                  widget.userName,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  widget.ago,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const Divider(thickness: 0.5),
              Text(
                widget.intro,
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
                  const Spacer(),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProjectDetailsPage(
                                      project: Projectz(
                                        id: 1,
                                        ownerName: widget.userName,
                                        ownerPhoto: widget.profileUrl,
                                        title: widget.title,
                                        intro: widget.intro,
                                        description: widget.description,
                                        keywords: ['keyword1', 'keyword2'],
                                        createdAt: widget.ago,
                                        members: ['member1', 'member2'],
                                        roomId: 'room1',
                                        likes: likes,
                                        popularity: 0.8,
                                      ),
                                    )));
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
