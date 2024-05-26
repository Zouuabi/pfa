import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/presentation/register/cubit/register_cubit.dart';
import 'package:mobile/presentation/register/widgets/my_text_button.dart';

class PrefrencesPage extends StatefulWidget {
  const PrefrencesPage({super.key});
  static const String route = '/prefrences-page';
  @override
  State<PrefrencesPage> createState() => _PrefrencesPageState();
}

class _PrefrencesPageState extends State<PrefrencesPage> {
  // state=f(data)
  late bool isLoading;
  bool isFetched = false;
  Map<String, dynamic>? data;
  List<String> intrests = [];

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    getDataFromAPI();
    super.initState();
  }

  void getDataFromAPI() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          data = {
            'status': HttpStatus.ok,
            'Prefrences': ['a', 'a', 'a', 'a', 'a', 'a', 'a', 'a'],
          };
          isLoading = false;
        });
      },
    );
  }

  List<Widget> _getUi() {
    List<Widget> ret = [];
    for (String elt in data!['Prefrences']) {
      ret.add(Intrest(
          onPressed: () {
            intrests.add(elt);
            print(intrests);
          },
          icon: Icons.g_mobiledata,
          child: elt));
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
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
                  args['interests'] = ['Flutter', 'Django', 'React'];
                  args['role'] = 'individual';
                  // Navigator.of(context).pushNamed('/prefrences');
                  BlocProvider.of<RegisterCubit>(context).register(user: args);
                },
                child: const Text('next'),
              )
            ],
          ),
          body: isLoading
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 5),
                    children: _getUi(),
                  ),
                )),
    );
  }
}
