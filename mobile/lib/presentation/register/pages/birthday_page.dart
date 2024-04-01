import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/presentation/register/pages/prefrences_page.dart';

class BirthdayPage extends StatelessWidget {
  const BirthdayPage({super.key});

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
              Navigator.of(context).pushNamed(PrefrencesPage.route);
            },
            child: const Text('next'),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'My birthday',
              style: TextStyle(fontSize: 30),
            ),
            const Text('Your age will be public'),
            SizedBox(
                height: 300,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime(2000),
                    maximumDate: DateTime(2015),
                    onDateTimeChanged: (val) {}))
          ],
        ),
      ),
    );
  }
}
