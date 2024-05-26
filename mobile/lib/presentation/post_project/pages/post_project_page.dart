import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/models/projectz.dart';
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
                  onPressed: () {
                    Navigator.of(context).pop(Projectz(
                        id: 5,
                        ownerName: 'Zouuabi',
                        ownerPhoto:
                            'https://www.oubeid.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fprofile-pic.52928098.png&w=640&q=75',
                        title: _titleController.text,
                        intro: _introductionController.text,
                        description: _descriptionController.text,
                        createdAt: 'Now',
                        likes: 0,
                        popularity: 0));
                  },
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
                      leading: const ProfilePicture(
                        url:
                            'https://www.oubeid.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fprofile-pic.52928098.png&w=640&q=75',
                      ),
                      title: Text(
                        'Zouuabi',
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
                      hintText: 'title',
                      controller: _titleController,
                      errorText: null,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                      label: 'Intoduction',
                      hintText: 'your project intro',
                      controller: _introductionController,
                      errorText: null,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                      label: 'Description',
                      hintText: 'Write description here',
                      controller: _descriptionController,
                      errorText: null,
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
