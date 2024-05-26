import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/models/user.dart';
import 'package:mobile/presentation/post_project/cubit/post_project_cubit.dart';
import 'package:mobile/presentation/shared/my_text_field.dart';
import 'package:mobile/presentation/shared/profile_picture.dart';

class PostProjectPage extends StatefulWidget {
  const PostProjectPage({super.key});

  static const String route = '/post-project';

  @override
  State<PostProjectPage> createState() => _PostProjectPageState();
}

class _PostProjectPageState extends State<PostProjectPage> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _introductionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostProjectCubit>(
      create: (context) => PostProjectCubit(),
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Post',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.teal, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          body: BlocConsumer<PostProjectCubit, PostProjectState>(
            listener: (context, state) {
              if (state.status == Status.success) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Project Created Successfully"),
                          const SizedBox(height: 10),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('okay'))
                        ],
                      );
                    });
              } else if (state.status == Status.loading) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    });
              } else if (state.status == Status.failed) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Text('ghalta');
                    });
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
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
                      subtitle: const Text('🌎 Public '),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                      label: 'Title',
                      hintText: '...',
                      controller: _titleController,
                      errorText: null,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                      label: 'Intoduction',
                      hintText: ' ...',
                      controller: _introductionController,
                      errorText: null,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                      label: 'Description',
                      hintText: ' ...',
                      controller: _descriptionController,
                      errorText: null,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          final args = ModalRoute.of(context)!
                              .settings
                              .arguments as User;
                          final Map<String, dynamic> owner = {
                            'id': args.id,
                            'gender': args.gender,
                            'interests': args.interests,
                            'birthDay': args.birthDay,
                            'username': args.username,
                            'phoneNumber': args.phoneNumber,
                            'role': args.role,
                            'email': args.email,
                            'password': null,
                          };
                          BlocProvider.of<PostProjectCubit>(context)
                              .postProject(
                                  title: _titleController.text,
                                  introduction: _introductionController.text,
                                  description: _descriptionController.text,
                                  keywords: ['flutter', 'react'],
                                  user: owner);
                        },
                        child: Text('oubeid'))
                  ],
                ),
              );
            },
          )),
    );
  }
}
