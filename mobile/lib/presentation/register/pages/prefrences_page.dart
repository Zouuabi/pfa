import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/presentation/login/pages/login_page.dart';
import 'package:mobile/presentation/register/cubit/register_cubit.dart';

class PrefrencesPage extends StatefulWidget {
  const PrefrencesPage({super.key});
  static const String route = '/prefrences-page';
  @override
  State<PrefrencesPage> createState() => _PrefrencesPageState();
}

class _PrefrencesPageState extends State<PrefrencesPage> {
  List<Color> selectedColor = [
    Colors.tealAccent,
    Colors.teal,
  ];
  List<Color> notSelectedColor = [
    const Color.fromARGB(255, 228, 228, 228),
    const Color.fromARGB(255, 91, 91, 91),
  ];
  List<String> selectedprefs = [];
  List<String> prefs = [
    "Flutter",
    "React",
    "UI/IX",
    "Desing",
    "Software Testing",
    "Agile",
    "Scrum",
    "Jira",
    "Angular",
    "Web Development",
    "FrontEnd",
    "BackEnd",
    "DotNet",
    "SQL",
    "Firebase",
    "Vue",
    "AI",
    "Machine Learing",
    "Django",
    "NodeJs",
    "ExpressJs",
    "MySql",
    "PostgreSql",
    "API",
    "NoSql",
    "Mongo",
    "Cassandra",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => RegisterCubit(),
      lazy: false,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back)),
            actions: [
              TextButton(
                onPressed: () {
                  final args = ModalRoute.of(context)!.settings.arguments
                      as Map<String, dynamic>;
                  args['interests'] = selectedprefs;

                  Navigator.pushReplacementNamed(context, LoginPage.route);
                },
                child: const Text('next'),
              )
            ],
          ),
          body: BlocListener<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state.status == Status.loading) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.teal,
                        ),
                      );
                    });
              } else if (state.status == Status.success) {
                Navigator.of(context).pushNamed(LoginPage.route);
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(
                    'Choose your interests',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    children: prefs
                        .map((e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedprefs.contains(e)) {
                                  selectedprefs.remove(e);
                                } else {
                                  selectedprefs.add(e);
                                }
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    colors: selectedprefs.contains(e)
                                        ? selectedColor
                                        : notSelectedColor,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )),
                              child: Text(e),
                            )))
                        .toList(),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
