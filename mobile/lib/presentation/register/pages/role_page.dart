import 'package:flutter/material.dart';

import 'package:mobile/presentation/shared/gradient.dart';
import 'package:mobile/presentation/shared/variables.dart';

class RolePage extends StatefulWidget {
  const RolePage({super.key});

  static const String route = '/role';

  @override
  State<RolePage> createState() => _GenderPageState();
}

class _GenderPageState extends State<RolePage> {
  Color color1 = grey;
  Color color2 = grey;
  String? textError;
  String? selectedRole;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          TextButton(
            onPressed: () {
              if (color1 == teal || color2 == teal) {
                Navigator.of(context)
                    .pushNamed('/register', arguments: {'role': selectedRole});
              } else {
                setState(() {
                  textError = "You must select one";
                });
              }
            },
            child: Text(
              'Next',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.teal, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.15,
            ),
            const Text(
              'Role',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            GradientButton(
                child: 'Individual',
                ontap: () {
                  selectedRole = 'Individual';
                  setState(() {
                    if (color1 == grey) {
                      color1 = teal;
                      color2 = grey;
                      textError = null;
                    } else {
                      color1 = grey;
                    }
                  });
                },
                color: color1),
            const SizedBox(
              height: 20,
            ),
            GradientButton(
                child: 'Company',
                ontap: () {
                  selectedRole = 'Company';
                  setState(() {
                    if (color2 == grey) {
                      color2 = teal;
                      color1 = grey;
                      textError = null;
                    } else {
                      color2 = grey;
                    }
                  });
                },
                color: color2),
            const SizedBox(
              height: 30,
            ),
            textError == null
                ? const SizedBox.shrink()
                : Text(
                    textError!,
                    style: const TextStyle(color: Colors.red),
                  ),
          ],
        ),
      ),
    );
  }
}
