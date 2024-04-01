import 'package:flutter/material.dart';

import 'package:mobile/presentation/register/widgets/gender_button.dart';
import 'package:mobile/presentation/shared/variables.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String? _gender;
  Color color1 = grey;
  Color color2 = grey;
  String? textError;
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
                Navigator.of(context).pushNamed('/birthday');
              } else {
                setState(() {
                  textError = "You must select your Gender";
                });
              }
            },
            child: const Text('next'),
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
              'My Gender',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            GenderButton(
                child: 'Female',
                ontap: () {
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
            GenderButton(
                child: 'Male',
                ontap: () {
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
