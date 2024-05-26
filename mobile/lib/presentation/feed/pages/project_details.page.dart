import 'package:flutter/material.dart';

import 'package:mobile/data/models/projectz.dart';
import 'package:mobile/presentation/shared/profile_picture.dart';

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({super.key, required this.project});

  final Projectz project;

  static const String route = '/project-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text('Project Details',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfilePicture(url: project.ownerPhoto),
              Text(
                project.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                'Closed Source',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.teal, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Text(
                'Introduction',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(project.intro),
              const Divider(),
              Text(
                'TeamBey is a platform that aims to facilitate access to professional opportunities for young talents and create a work environment similar to that of the professional world. The platform connects young talents with relevant projects and provides them with the resources and support they need to succeed. Teambey is  collaboration platform fostering a professional environment for project creation, team formation, and project management.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              Text(
                'Needed Roles',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text('React Developer',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500)),
              Text('Express.js Developer',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500)),
              Text('Mobile developer',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500)),
              Text('DataBase engineer',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500)),
              Text('Tester',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500)),
              Text('UI/UX designer',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500)),
              Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 150,
                                    width: 300,
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Center(
                                              child: Text(
                                                'Request has been sent to the team leader',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Okay'))
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            });
                      },
                      child: const Text('Request Join')))
            ],
          ),
        ),
      ),
    );
  }
}
